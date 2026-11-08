using System;
using System.Diagnostics;
using System.Linq;
using Microsoft.Win32;

namespace Agent.Modules
{
    public static class SystemDnsManager
    {
        public static void SetSystemDns()
        {
            var interfaces = GetConnectedInterfaces();
            foreach (var iface in interfaces)
            {
                RunPowerShell($"Set-DnsClientServerAddress -InterfaceAlias '{iface}' -ServerAddresses ('127.0.0.1')");
                Console.WriteLine($"[SYS] DNS set to 127.0.0.1 on {iface}");
            }
            FlushDnsCache();
        }

        public static void RestoreSystemDns()
        {
            var interfaces = GetConnectedInterfaces();
            foreach (var iface in interfaces)
            {
                RunPowerShell($"Set-DnsClientServerAddress -InterfaceAlias '{iface}' -ResetServerAddresses");
                Console.WriteLine($"[SYS] DNS restored to DHCP on {iface}");
            }
            FlushDnsCache();
        }

        public static void FlushDnsCache()
        {
            try
            {
                var psi = new ProcessStartInfo("ipconfig", "/flushdns") { CreateNoWindow = true, UseShellExecute = false };
                Process.Start(psi)?.WaitForExit();
                Console.WriteLine("[SYS] DNS cache flushed");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"[SYS] Failed to flush DNS cache: {ex.Message}");
            }
        }

        public static void ApplyBrowserPolicies()
        {
            string[] firefoxPaths = {
                @"C:\Program Files\Mozilla Firefox\distribution",
                @"C:\Program Files (x86)\Mozilla Firefox\distribution",
                Environment.ExpandEnvironmentVariables(@"%LOCALAPPDATA%\Zen\distribution"),
                Environment.ExpandEnvironmentVariables(@"%PROGRAMFILES%\Zen Browser\distribution"),
                Environment.ExpandEnvironmentVariables(@"%LOCALAPPDATA%\Mozilla\Firefox\distribution")
            };

            string policyJson = "{\n  \"policies\": {\n    \"DNSOverHTTPS\": {\n      \"Enabled\": false,\n      \"Locked\": true\n    }\n  }\n}";

            foreach (var path in firefoxPaths)
            {
                try
                {
                    string parent = System.IO.Path.GetDirectoryName(path) ?? "";
                    if (System.IO.Directory.Exists(parent))
                    {
                        System.IO.Directory.CreateDirectory(path);
                        System.IO.File.WriteAllText(System.IO.Path.Combine(path, "policies.json"), policyJson);
                        Console.WriteLine($"[POLICY] DoH disabled: {path}");
                    }
                }
                catch { }
            }

            try
            {
                using var chromeKey = Registry.LocalMachine.CreateSubKey(@"SOFTWARE\Policies\Google\Chrome");
                chromeKey?.SetValue("DnsOverHttpsMode", "off", RegistryValueKind.String);

                using var edgeKey = Registry.LocalMachine.CreateSubKey(@"SOFTWARE\Policies\Microsoft\Edge");
                edgeKey?.SetValue("DnsOverHttpsMode", "off", RegistryValueKind.String);
                
                Console.WriteLine("[POLICY] DoH disabled in Chromium browsers");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"[POLICY] Failed to set registry: {ex.Message}");
            }
        }

        public static void RemoveBrowserPolicies()
        {
            string[] firefoxPaths = {
                @"C:\Program Files\Mozilla Firefox\distribution",
                @"C:\Program Files (x86)\Mozilla Firefox\distribution",
                Environment.ExpandEnvironmentVariables(@"%LOCALAPPDATA%\Zen\distribution"),
                Environment.ExpandEnvironmentVariables(@"%PROGRAMFILES%\Zen Browser\distribution"),
                Environment.ExpandEnvironmentVariables(@"%LOCALAPPDATA%\Mozilla\Firefox\distribution")
            };

            foreach (var path in firefoxPaths)
            {
                try
                {
                    var file = System.IO.Path.Combine(path, "policies.json");
                    if (System.IO.File.Exists(file))
                    {
                        System.IO.File.Delete(file);
                        Console.WriteLine($"[POLICY] Removed: {file}");
                    }
                }
                catch { }
            }
        }

        private static System.Collections.Generic.IEnumerable<string> GetConnectedInterfaces()
        {
            string psCommand = "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Select-Object -ExpandProperty Name";
            
            var psi = new ProcessStartInfo("powershell", $"-NoProfile -Command \"{psCommand}\"")
            {
                CreateNoWindow = true,
                UseShellExecute = false,
                RedirectStandardOutput = true,
                StandardOutputEncoding = System.Text.Encoding.UTF8
            };

            using var process = Process.Start(psi);
            if (process == null) yield break;

            string output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();

            foreach (var line in output.Split('\n', StringSplitOptions.RemoveEmptyEntries))
            {
                var iface = line.Trim();
                if (!string.IsNullOrEmpty(iface))
                {
                    yield return iface;
                }
            }
        }

        private static void RunPowerShell(string command)
        {
            try
            {
                var psi = new ProcessStartInfo("powershell", $"-NoProfile -Command \"{command}\"")
                {
                    CreateNoWindow = true,
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true
                };
                using var process = Process.Start(psi);
                process?.WaitForExit();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"[SYS] PowerShell error: {ex.Message}");
            }
        }
    }
}
