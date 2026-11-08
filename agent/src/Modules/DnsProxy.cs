using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using DnsClient;
using DnsClient.Protocol;

namespace Agent.Modules
{
    public class DnsProxy
    {
        private readonly UdpClient _listener;
        private readonly IPEndPoint _upstream;
        private readonly HashSet<string> _allowedDomains;
        private bool _isRunning;

        public DnsProxy(IEnumerable<string> allowedDomains, string upstreamIp)
        {
            _allowedDomains = new HashSet<string>(allowedDomains, StringComparer.OrdinalIgnoreCase);
            _upstream = new IPEndPoint(IPAddress.Parse(upstreamIp), 53);
            _listener = new UdpClient(new IPEndPoint(IPAddress.Loopback, 53));
        }

        public void Start()
        {
            _isRunning = true;
            Task.Run(ReceiveLoop);
            Console.WriteLine("[DNS] Listening on 127.0.0.1:53");
        }

        public void Stop()
        {
            _isRunning = false;
            _listener.Close();
            Console.WriteLine("[DNS] Stopped");
        }

        private async Task ReceiveLoop()
        {
            while (_isRunning)
            {
                try
                {
                    var result = await _listener.ReceiveAsync();
                    _ = Task.Run(() => ProcessQuery(result.Buffer, result.RemoteEndPoint));
                }
                catch (ObjectDisposedException)
                {
                    break;
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"[DNS] Receive error: {ex.Message}");
                }
            }
        }

        private void ProcessQuery(byte[] query, IPEndPoint client)
        {
            try
            {
                string domain = ParseDomainFromDnsPacket(query);
                if (string.IsNullOrEmpty(domain))
                {
                    return;
                }

                if (!IsDomainAllowed(domain))
                {
                    Console.WriteLine($"[DNS] BLOCK {domain}");
                    byte[] nxdomain = CreateNxDomainResponse(query);
                    _listener.Send(nxdomain, nxdomain.Length, client);
                    return;
                }

                using var upstreamClient = new UdpClient();
                upstreamClient.Send(query, query.Length, _upstream);
                upstreamClient.Client.ReceiveTimeout = 3000;
                
                var remoteEp = new IPEndPoint(IPAddress.Any, 0);
                var upstreamResponse = upstreamClient.Receive(ref remoteEp);
                _listener.Send(upstreamResponse, upstreamResponse.Length, client);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"[DNS] Processing error: {ex.Message}");
            }
        }

        private string ParseDomainFromDnsPacket(byte[] packet)
        {
            try
            {
                if (packet.Length < 12) return string.Empty;

                int position = 12;
                var sb = new StringBuilder();

                while (true)
                {
                    int length = packet[position];
                    if (length == 0)
                    {
                        break;
                    }

                    if ((length & 0xC0) == 0xC0)
                    {
                        if (position + 1 >= packet.Length) break;
                        int offset = ((length & 0x3F) << 8) | packet[position + 1];
                        position = offset;
                        continue;
                    }

                    position++;
                    if (position + length > packet.Length) break;

                    if (sb.Length > 0) sb.Append('.');
                    sb.Append(Encoding.ASCII.GetString(packet, position, length));
                    position += length;
                }

                return sb.ToString().ToLower();
            }
            catch
            {
                return string.Empty;
            }
        }

        private byte[] CreateNxDomainResponse(byte[] query)
        {
            var response = new byte[query.Length];
            Array.Copy(query, response, query.Length);

            response[2] = (byte)(response[2] | 0x80);
            response[3] = (byte)((response[3] & 0xF0) | 0x03);

            response[6] = 0;
            response[7] = 0;
            response[8] = 0;
            response[9] = 0;
            response[10] = 0;
            response[11] = 0;

            return response;
        }

        private bool IsDomainAllowed(string domain)
        {
            if (string.IsNullOrEmpty(domain)) return false;
            string cleanDomain = domain.TrimEnd('.');
            return _allowedDomains.Any(d => cleanDomain.Equals(d, StringComparison.OrdinalIgnoreCase) || 
                                            cleanDomain.EndsWith("." + d, StringComparison.OrdinalIgnoreCase));
        }
    }
}
