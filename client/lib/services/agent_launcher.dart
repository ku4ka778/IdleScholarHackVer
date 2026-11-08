import 'dart:io';

class AgentLauncher {
  Process? _agentProcess;

  Future<void> startAgent({
    required List<String> allowedDomains,
    required List<String> allowedApps,
    required int durationMinutes,
  }) async {
    final agentPath = '${Directory.current.path}/agent/publish/Agent.exe';

    _agentProcess = await Process.start(
      agentPath,
      [
        '--domains', allowedDomains.join(','),
        '--apps', allowedApps.join(','),
        '--duration', durationMinutes.toString(),
      ],
      workingDirectory: Directory.current.path,
      runInShell: true,
    );

    _agentProcess!.stdout.transform(SystemEncoding().decoder).listen((data) {
      print('AGENT: $data');
    });
    _agentProcess!.stderr.transform(SystemEncoding().decoder).listen((data) {
      print('AGENT ERROR: $data');
    });
  }

  Future<void> stopAgent() async {
    _agentProcess?.kill();
    _agentProcess = null;
  }
}
