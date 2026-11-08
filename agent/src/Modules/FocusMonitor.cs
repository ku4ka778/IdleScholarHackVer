using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Agent.Modules
{
    public class FocusMonitor
    {
        [DllImport("user32.dll")]
        private static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll")]
        private static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint processId);

        [DllImport("kernel32.dll")]
        private static extern IntPtr OpenProcess(uint processAccess, bool bInheritHandle, uint processId);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
        private static extern bool QueryFullProcessImageName(IntPtr hProcess, uint flags, [Out] StringBuilder lpExeName, ref uint lpdwSize);

        [DllImport("kernel32.dll")]
        private static extern bool CloseHandle(IntPtr hObject);

        [DllImport("user32.dll")]
        private static extern bool PostMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);

        [DllImport("user32.dll")]
        private static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

        private const uint PROCESS_QUERY_LIMITED_INFORMATION = 0x1000;
        private const uint WM_SYSCOMMAND = 0x0112;
        private const uint SC_MINIMIZE = 0xF020;
        private const int SW_MINIMIZE = 6;

        private bool _isRunning = false;
        private HashSet<string> _allowedApps;

        public FocusMonitor(IEnumerable<string> extraAllowedApps = null)
        {
            _allowedApps = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
            {
                "emacs.exe", "idlescholar.exe",
                "snippingtool.exe", "screensketch.exe", "gamebar.exe",
                "gamebarftserver.exe", "gamebarpresencewriter.exe",
                "sharex.exe", "lightshot.exe",
                "shellhost.exe", "windowsterminal.exe", "cmdproxy.exe",
                "explorer.exe", "taskmgr.exe", "taskhostw.exe", "sihost.exe",
                "shellexperiencehost.exe", "searchhost.exe", "startmenuexperiencehost.exe",
                "textinputhost.exe", "runtimebroker.exe", "dwm.exe",
                "winlogon.exe", "csrss.exe", "smss.exe", "services.exe", "lsass.exe",
                "svchost.exe", "fontdrvhost.exe", "ctfmon.exe", "systemsettings.exe",
                "applicationframehost.exe", "msedgewebview2.exe", "widgets.exe",
                "widgetservice.exe", "lockapp.exe", "useroobebroker.exe", "wudfhost.exe",
                "wmiprvse.exe", "searchapp.exe", "securityhealthsystray.exe",
                "securityhealthservice.exe", "nissrv.exe", "msmpeng.exe", "windefend.exe",
                "system", "idle", "registry", "memory compression", "secure system",
                "lsaiso.exe", "wininit.exe", "spoolsv.exe", "audiodg.exe"
            };
<<<<<<< HEAD
=======
			if (extraAllowedApps != null)
    		{	
        		foreach (var app in extraAllowedApps)
        		{
            		_allowedApps.Add(app.Trim().ToLower());
        		}
    		}
        }
		
>>>>>>> c02a2b0a4d1f00e974bb4c7cbf5d1bd9f9e8c265

			if (extraAllowedApps != null)
			{
				foreach (var app in extraAllowedApps)
				{
					_allowedApps.Add(app.Trim().ToLower());
				}
			}
		}
		
        public void Start()
        {
            if (_isRunning) return;
            _isRunning = true;
            Task.Run(MonitorWorker);
            Console.WriteLine("[MONITOR] Started");
        }

        public void Stop()
        {
            _isRunning = false;
            Console.WriteLine("[MONITOR] Stopped");
        }

        private void MonitorWorker()
        {
            var minimizedCache = new HashSet<string>();

            while (_isRunning)
            {
                var (procName, hwnd) = GetActiveProcessNameFast();

                if (procName != null && hwnd != IntPtr.Zero && !_allowedApps.Contains(procName))
                {
                    if (!minimizedCache.Contains(procName))
                    {
                        minimizedCache.Add(procName);
                        Console.WriteLine($"[MONITOR] Minimizing: '{procName}'");
                    }

                    PostMessage(hwnd, WM_SYSCOMMAND, (IntPtr)SC_MINIMIZE, IntPtr.Zero);
                    ShowWindow(hwnd, SW_MINIMIZE);

                    Thread.Sleep(300);
                }
                Thread.Sleep(100);
            }
        }

        private (string? ProcessName, IntPtr Hwnd) GetActiveProcessNameFast()
        {
            IntPtr hwnd = GetForegroundWindow();
            if (hwnd == IntPtr.Zero) return (null, IntPtr.Zero);

            try
            {
                GetWindowThreadProcessId(hwnd, out uint pid);
                if (pid == 0) return (null, IntPtr.Zero);

                IntPtr hProcess = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, false, pid);
                if (hProcess != IntPtr.Zero)
                {
                    try
                    {
                        var buffer = new StringBuilder(260);
                        uint size = 260;

                        if (QueryFullProcessImageName(hProcess, 0, buffer, ref size))
                        {
                            string fullPath = buffer.ToString();
                            string procName = System.IO.Path.GetFileName(fullPath).ToLower();

                            if (string.IsNullOrEmpty(procName)) return (null, IntPtr.Zero);

                            return (procName, hwnd);
                        }
                    }
                    finally
                    {
                        CloseHandle(hProcess);
                    }
                }
            }
            catch
            {
            }

            return (null, IntPtr.Zero);
        }
    }
}
