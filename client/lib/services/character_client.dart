import 'package:grpc/grpc.dart';
import '../gen/character.pbgrpc.dart';

class CharacterClient {
  ClientChannel? _channel;
  CharacterServiceClient? _stub;

  Future<void> connect({String host = '95.31.41.147', int port = 50051}) async {
    if (_stub != null) return;
    _channel = ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    _stub = CharacterServiceClient(_channel!);
    await _channel!.getConnection();
  }

  Future<CharacterResponse> getCharacterById(int characterId) {
    if (_stub == null) throw StateError('Not connected');
    return _stub!.getCharacterById(CharacterRequest()..id = characterId);
  }

  Future<GetTalentsResponse> getTalents(int characterId) {
    if (_stub == null) throw StateError('Not connected');
    return _stub!.getTalents(GetTalentsRequest()..characterId = characterId);
  }

  Future<UpgradeTalentResponse> upgradeTalent(int characterId, String talentId) {
    if (_stub == null) throw StateError('Not connected');
    return _stub!.upgradeTalent(UpgradeTalentRequest()
      ..characterId = characterId
      ..talentId = talentId);
  }
}
	
