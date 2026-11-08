using Agent.Modules;
using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main(string[] args)
    {
<<<<<<< HEAD
=======
		if (args.Length > 0 && args[0] == "--check-browsers")
        	{
            	string json = BrowserChecker.GetRunningBrowsersJson();
            	Console.WriteLine(json);
            	return;
        	}
		
>>>>>>> c02a2b0a4d1f00e974bb4c7cbf5d1bd9f9e8c265
        var allowedDomains = new List<string>();
        var allowedApps = new List<string>();
        int durationMinutes = 30;

        for (int i = 0; i < args.Length; i++)
        {
            switch (args[i])
            {
                case "--domains":
                    if (i + 1 < args.Length)
                        allowedDomains = args[i + 1].Split(',', StringSplitOptions.RemoveEmptyEntries).ToList();
                    break;
                case "--apps":
                    if (i + 1 < args.Length)
                        allowedApps = args[i + 1].Split(',', StringSplitOptions.RemoveEmptyEntries).ToList();
                    break;
                case "--duration":
                    if (i + 1 < args.Length && int.TryParse(args[i + 1], out int d))
                        durationMinutes = d;
                    break;
            }
        }

        string upstreamDns = "192.168.0.1";

        Console.WriteLine($"[MAIN] Starting focus mode. Duration: {durationMinutes} min.");
        Console.WriteLine($"[MAIN] Allowed domains: {string.Join(", ", allowedDomains)}");
        Console.WriteLine($"[MAIN] Allowed apps: {string.Join(", ", allowedApps)}");

        FirewallManager.ApplyRules(upstreamDns);
        SystemDnsManager.ApplyBrowserPolicies();
        SystemDnsManager.SetSystemDns();
        
        var monitor = new FocusMonitor(allowedApps); 
        monitor.Start();

        var dns = new DnsProxy(allowedDomains, upstreamDns);
        dns.Start();

        Console.WriteLine("[MAIN] Focus mode active. Waiting for 'stop' command...");

        string line;
        while ((line = Console.ReadLine()) != null)
        {
            if (line.Trim().ToLower() == "stop")
            {
                Console.WriteLine("[MAIN] Stop command received. Exiting...");
                break;
            }
        }

        Console.WriteLine("[MAIN] Cleaning up...");
        dns.Stop();
        monitor.Stop();
        FirewallManager.RemoveRules();
        SystemDnsManager.RestoreSystemDns();
        SystemDnsManager.RemoveBrowserPolicies();
        Console.WriteLine("[MAIN] Exited.");
    }
}
