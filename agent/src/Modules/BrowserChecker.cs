using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text.Json;

namespace Agent.Modules
{
    public static class BrowserChecker
    {
        private static readonly HashSet<string> Browsers = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            "chrome.exe", "msedge.exe", "brave.exe", "opera.exe", "operagx.exe", "vivaldi.exe", 
            "chromium.exe", "yandex.exe", "browser.exe", "iron.exe", "slimjet.exe", "torch.exe",
            "avastbrowser.exe", "avgsecurebrowser.exe", "comodo_dragon.exe", "dragon.exe", 
            "maxthon.exe", "midori.exe", "epic.exe", "centbrowser.exe", "kinza.exe", "sidekick.exe",
            "arc.exe", "thorium.exe", "ungoogled-chromium.exe",
            "firefox.exe", "zen.exe", "waterfox.exe", "palemoon.exe", "librewolf.exe", "icecat.exe",
            "seamonkey.exe", "basilisk.exe", "gnu icecat.exe", "tor browser.exe", "torbrowser.exe",
            "mullvad browser.exe", "floorp.exe", "mercury.exe", "pulse.exe",
            "iexplore.exe", "safari.exe", "theworld.exe", "sogouexplorer.exe", "2345explorer.exe",
            "liebao.exe", "baidubrowser.exe", "qihoo.exe", "360se.exe", "360chrome.exe"
        };

        public static string GetRunningBrowsersJson()
        {
            var running = new HashSet<string>();

            foreach (var process in Process.GetProcesses())
            {
                try
                {
                    string procName = process.ProcessName + ".exe"; 
                    if (Browsers.Contains(procName))
                    {
                        running.Add(procName.ToLower());
                    }
                }
                catch
                {
                }
                finally
                {
                    process.Dispose();
                }
            }

            var sortedList = running.OrderBy(x => x).ToList();
            return JsonSerializer.Serialize(sortedList);
        }
    }
}
