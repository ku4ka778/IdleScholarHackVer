// This is a generated file - do not edit.
//
// Generated from character.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CreateCharacterRequest extends $pb.GeneratedMessage {
  factory CreateCharacterRequest({
    $core.int? accountId,
    $core.String? characterName,
    $core.String? classType,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (characterName != null) result.characterName = characterName;
    if (classType != null) result.classType = classType;
    return result;
  }

  CreateCharacterRequest._();

  factory CreateCharacterRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCharacterRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCharacterRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'accountId')
    ..aOS(2, _omitFieldNames ? '' : 'characterName')
    ..aOS(3, _omitFieldNames ? '' : 'classType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCharacterRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCharacterRequest copyWith(
          void Function(CreateCharacterRequest) updates) =>
      super.copyWith((message) => updates(message as CreateCharacterRequest))
          as CreateCharacterRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCharacterRequest create() => CreateCharacterRequest._();
  @$core.override
  CreateCharacterRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCharacterRequest> createRepeated() =>
      $pb.PbList<CreateCharacterRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCharacterRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCharacterRequest>(create);
  static CreateCharacterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get accountId => $_getIZ(0);
  @$pb.TagNumber(1)
  set accountId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get characterName => $_getSZ(1);
  @$pb.TagNumber(2)
  set characterName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCharacterName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacterName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get classType => $_getSZ(2);
  @$pb.TagNumber(3)
  set classType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasClassType() => $_has(2);
  @$pb.TagNumber(3)
  void clearClassType() => $_clearField(3);
}

class AuthResponse extends $pb.GeneratedMessage {
  factory AuthResponse({
    $core.bool? success,
    $core.String? message,
    $core.int? accountId,
    $core.int? characterId,
    $core.String? username,
    $core.String? characterName,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (accountId != null) result.accountId = accountId;
    if (characterId != null) result.characterId = characterId;
    if (username != null) result.username = username;
    if (characterName != null) result.characterName = characterName;
    return result;
  }

  AuthResponse._();

  factory AuthResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'accountId')
    ..aI(4, _omitFieldNames ? '' : 'characterId')
    ..aOS(5, _omitFieldNames ? '' : 'username')
    ..aOS(6, _omitFieldNames ? '' : 'characterName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthResponse copyWith(void Function(AuthResponse) updates) =>
      super.copyWith((message) => updates(message as AuthResponse))
          as AuthResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthResponse create() => AuthResponse._();
  @$core.override
  AuthResponse createEmptyInstance() => create();
  static $pb.PbList<AuthResponse> createRepeated() =>
      $pb.PbList<AuthResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthResponse>(create);
  static AuthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get accountId => $_getIZ(2);
  @$pb.TagNumber(3)
  set accountId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccountId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get characterId => $_getIZ(3);
  @$pb.TagNumber(4)
  set characterId($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCharacterId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCharacterId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get username => $_getSZ(4);
  @$pb.TagNumber(5)
  set username($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearUsername() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get characterName => $_getSZ(5);
  @$pb.TagNumber(6)
  set characterName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCharacterName() => $_has(5);
  @$pb.TagNumber(6)
  void clearCharacterName() => $_clearField(6);
}

class CharacterRequest extends $pb.GeneratedMessage {
  factory CharacterRequest({
    $core.int? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  CharacterRequest._();

  factory CharacterRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CharacterRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CharacterRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharacterRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharacterRequest copyWith(void Function(CharacterRequest) updates) =>
      super.copyWith((message) => updates(message as CharacterRequest))
          as CharacterRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CharacterRequest create() => CharacterRequest._();
  @$core.override
  CharacterRequest createEmptyInstance() => create();
  static $pb.PbList<CharacterRequest> createRepeated() =>
      $pb.PbList<CharacterRequest>();
  @$core.pragma('dart2js:noInline')
  static CharacterRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CharacterRequest>(create);
  static CharacterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class CharacterResponse extends $pb.GeneratedMessage {
  factory CharacterResponse({
    $core.int? id,
    $core.String? name,
    $core.int? level,
    $core.String? classType,
    $fixnum.Int64? experience,
    $core.int? strength,
    $core.int? dexterity,
    $core.int? intelligence,
    $core.int? luck,
    $core.int? talentpoint,
    $fixnum.Int64? gold,
    $fixnum.Int64? barracksEnd,
    $core.int? clanId,
    $core.int? totalCrafts,
    $core.int? totalSalvaged,
    $core.int? totalRaidsSurvived,
    $core.int? totalEchoWins,
    $core.int? totalBlizzardsSurvived,
    $core.int? totalResonancePos,
    $core.int? pvpWins,
    $core.int? pvpLosses,
    $fixnum.Int64? totalFocusMinutes,
    $fixnum.Int64? totalGoldEarned,
    $fixnum.Int64? totalLootCollected,
    $core.int? totalExpeditions,
    $core.int? tutorialStep,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (level != null) result.level = level;
    if (classType != null) result.classType = classType;
    if (experience != null) result.experience = experience;
    if (strength != null) result.strength = strength;
    if (dexterity != null) result.dexterity = dexterity;
    if (intelligence != null) result.intelligence = intelligence;
    if (luck != null) result.luck = luck;
    if (talentpoint != null) result.talentpoint = talentpoint;
    if (gold != null) result.gold = gold;
    if (barracksEnd != null) result.barracksEnd = barracksEnd;
    if (clanId != null) result.clanId = clanId;
    if (totalCrafts != null) result.totalCrafts = totalCrafts;
    if (totalSalvaged != null) result.totalSalvaged = totalSalvaged;
    if (totalRaidsSurvived != null)
      result.totalRaidsSurvived = totalRaidsSurvived;
    if (totalEchoWins != null) result.totalEchoWins = totalEchoWins;
    if (totalBlizzardsSurvived != null)
      result.totalBlizzardsSurvived = totalBlizzardsSurvived;
    if (totalResonancePos != null) result.totalResonancePos = totalResonancePos;
    if (pvpWins != null) result.pvpWins = pvpWins;
    if (pvpLosses != null) result.pvpLosses = pvpLosses;
    if (totalFocusMinutes != null) result.totalFocusMinutes = totalFocusMinutes;
    if (totalGoldEarned != null) result.totalGoldEarned = totalGoldEarned;
    if (totalLootCollected != null)
      result.totalLootCollected = totalLootCollected;
    if (totalExpeditions != null) result.totalExpeditions = totalExpeditions;
    if (tutorialStep != null) result.tutorialStep = tutorialStep;
    return result;
  }

  CharacterResponse._();

  factory CharacterResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CharacterResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CharacterResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'level')
    ..aOS(4, _omitFieldNames ? '' : 'classType')
    ..aInt64(5, _omitFieldNames ? '' : 'experience')
    ..aI(6, _omitFieldNames ? '' : 'strength')
    ..aI(7, _omitFieldNames ? '' : 'dexterity')
    ..aI(8, _omitFieldNames ? '' : 'intelligence')
    ..aI(9, _omitFieldNames ? '' : 'luck')
    ..aI(10, _omitFieldNames ? '' : 'talentpoint')
    ..aInt64(11, _omitFieldNames ? '' : 'gold')
    ..aInt64(12, _omitFieldNames ? '' : 'barracksEnd')
    ..aI(13, _omitFieldNames ? '' : 'clanId')
    ..aI(14, _omitFieldNames ? '' : 'totalCrafts')
    ..aI(15, _omitFieldNames ? '' : 'totalSalvaged')
    ..aI(16, _omitFieldNames ? '' : 'totalRaidsSurvived')
    ..aI(17, _omitFieldNames ? '' : 'totalEchoWins')
    ..aI(18, _omitFieldNames ? '' : 'totalBlizzardsSurvived')
    ..aI(19, _omitFieldNames ? '' : 'totalResonancePos')
    ..aI(20, _omitFieldNames ? '' : 'pvpWins')
    ..aI(21, _omitFieldNames ? '' : 'pvpLosses')
    ..aInt64(22, _omitFieldNames ? '' : 'totalFocusMinutes')
    ..aInt64(23, _omitFieldNames ? '' : 'totalGoldEarned')
    ..aInt64(24, _omitFieldNames ? '' : 'totalLootCollected')
    ..aI(25, _omitFieldNames ? '' : 'totalExpeditions')
    ..aI(26, _omitFieldNames ? '' : 'tutorialStep')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharacterResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharacterResponse copyWith(void Function(CharacterResponse) updates) =>
      super.copyWith((message) => updates(message as CharacterResponse))
          as CharacterResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CharacterResponse create() => CharacterResponse._();
  @$core.override
  CharacterResponse createEmptyInstance() => create();
  static $pb.PbList<CharacterResponse> createRepeated() =>
      $pb.PbList<CharacterResponse>();
  @$core.pragma('dart2js:noInline')
  static CharacterResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CharacterResponse>(create);
  static CharacterResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get classType => $_getSZ(3);
  @$pb.TagNumber(4)
  set classType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasClassType() => $_has(3);
  @$pb.TagNumber(4)
  void clearClassType() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get experience => $_getI64(4);
  @$pb.TagNumber(5)
  set experience($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExperience() => $_has(4);
  @$pb.TagNumber(5)
  void clearExperience() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get strength => $_getIZ(5);
  @$pb.TagNumber(6)
  set strength($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStrength() => $_has(5);
  @$pb.TagNumber(6)
  void clearStrength() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get dexterity => $_getIZ(6);
  @$pb.TagNumber(7)
  set dexterity($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDexterity() => $_has(6);
  @$pb.TagNumber(7)
  void clearDexterity() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get intelligence => $_getIZ(7);
  @$pb.TagNumber(8)
  set intelligence($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIntelligence() => $_has(7);
  @$pb.TagNumber(8)
  void clearIntelligence() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get luck => $_getIZ(8);
  @$pb.TagNumber(9)
  set luck($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLuck() => $_has(8);
  @$pb.TagNumber(9)
  void clearLuck() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get talentpoint => $_getIZ(9);
  @$pb.TagNumber(10)
  set talentpoint($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTalentpoint() => $_has(9);
  @$pb.TagNumber(10)
  void clearTalentpoint() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get gold => $_getI64(10);
  @$pb.TagNumber(11)
  set gold($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasGold() => $_has(10);
  @$pb.TagNumber(11)
  void clearGold() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get barracksEnd => $_getI64(11);
  @$pb.TagNumber(12)
  set barracksEnd($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasBarracksEnd() => $_has(11);
  @$pb.TagNumber(12)
  void clearBarracksEnd() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get clanId => $_getIZ(12);
  @$pb.TagNumber(13)
  set clanId($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasClanId() => $_has(12);
  @$pb.TagNumber(13)
  void clearClanId() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get totalCrafts => $_getIZ(13);
  @$pb.TagNumber(14)
  set totalCrafts($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasTotalCrafts() => $_has(13);
  @$pb.TagNumber(14)
  void clearTotalCrafts() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.int get totalSalvaged => $_getIZ(14);
  @$pb.TagNumber(15)
  set totalSalvaged($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(15)
  $core.bool hasTotalSalvaged() => $_has(14);
  @$pb.TagNumber(15)
  void clearTotalSalvaged() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get totalRaidsSurvived => $_getIZ(15);
  @$pb.TagNumber(16)
  set totalRaidsSurvived($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(16)
  $core.bool hasTotalRaidsSurvived() => $_has(15);
  @$pb.TagNumber(16)
  void clearTotalRaidsSurvived() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.int get totalEchoWins => $_getIZ(16);
  @$pb.TagNumber(17)
  set totalEchoWins($core.int value) => $_setSignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasTotalEchoWins() => $_has(16);
  @$pb.TagNumber(17)
  void clearTotalEchoWins() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.int get totalBlizzardsSurvived => $_getIZ(17);
  @$pb.TagNumber(18)
  set totalBlizzardsSurvived($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(18)
  $core.bool hasTotalBlizzardsSurvived() => $_has(17);
  @$pb.TagNumber(18)
  void clearTotalBlizzardsSurvived() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.int get totalResonancePos => $_getIZ(18);
  @$pb.TagNumber(19)
  set totalResonancePos($core.int value) => $_setSignedInt32(18, value);
  @$pb.TagNumber(19)
  $core.bool hasTotalResonancePos() => $_has(18);
  @$pb.TagNumber(19)
  void clearTotalResonancePos() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.int get pvpWins => $_getIZ(19);
  @$pb.TagNumber(20)
  set pvpWins($core.int value) => $_setSignedInt32(19, value);
  @$pb.TagNumber(20)
  $core.bool hasPvpWins() => $_has(19);
  @$pb.TagNumber(20)
  void clearPvpWins() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.int get pvpLosses => $_getIZ(20);
  @$pb.TagNumber(21)
  set pvpLosses($core.int value) => $_setSignedInt32(20, value);
  @$pb.TagNumber(21)
  $core.bool hasPvpLosses() => $_has(20);
  @$pb.TagNumber(21)
  void clearPvpLosses() => $_clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get totalFocusMinutes => $_getI64(21);
  @$pb.TagNumber(22)
  set totalFocusMinutes($fixnum.Int64 value) => $_setInt64(21, value);
  @$pb.TagNumber(22)
  $core.bool hasTotalFocusMinutes() => $_has(21);
  @$pb.TagNumber(22)
  void clearTotalFocusMinutes() => $_clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get totalGoldEarned => $_getI64(22);
  @$pb.TagNumber(23)
  set totalGoldEarned($fixnum.Int64 value) => $_setInt64(22, value);
  @$pb.TagNumber(23)
  $core.bool hasTotalGoldEarned() => $_has(22);
  @$pb.TagNumber(23)
  void clearTotalGoldEarned() => $_clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get totalLootCollected => $_getI64(23);
  @$pb.TagNumber(24)
  set totalLootCollected($fixnum.Int64 value) => $_setInt64(23, value);
  @$pb.TagNumber(24)
  $core.bool hasTotalLootCollected() => $_has(23);
  @$pb.TagNumber(24)
  void clearTotalLootCollected() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.int get totalExpeditions => $_getIZ(24);
  @$pb.TagNumber(25)
  set totalExpeditions($core.int value) => $_setSignedInt32(24, value);
  @$pb.TagNumber(25)
  $core.bool hasTotalExpeditions() => $_has(24);
  @$pb.TagNumber(25)
  void clearTotalExpeditions() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.int get tutorialStep => $_getIZ(25);
  @$pb.TagNumber(26)
  set tutorialStep($core.int value) => $_setSignedInt32(25, value);
  @$pb.TagNumber(26)
  $core.bool hasTutorialStep() => $_has(25);
  @$pb.TagNumber(26)
  void clearTutorialStep() => $_clearField(26);
}

class GetTalentsRequest extends $pb.GeneratedMessage {
  factory GetTalentsRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetTalentsRequest._();

  factory GetTalentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTalentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTalentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTalentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTalentsRequest copyWith(void Function(GetTalentsRequest) updates) =>
      super.copyWith((message) => updates(message as GetTalentsRequest))
          as GetTalentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTalentsRequest create() => GetTalentsRequest._();
  @$core.override
  GetTalentsRequest createEmptyInstance() => create();
  static $pb.PbList<GetTalentsRequest> createRepeated() =>
      $pb.PbList<GetTalentsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTalentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTalentsRequest>(create);
  static GetTalentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetTalentsResponse extends $pb.GeneratedMessage {
  factory GetTalentsResponse({
    $core.bool? success,
    $core.int? talentPoints,
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? talents,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (talentPoints != null) result.talentPoints = talentPoints;
    if (talents != null) result.talents.addEntries(talents);
    return result;
  }

  GetTalentsResponse._();

  factory GetTalentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTalentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTalentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'talentPoints')
    ..m<$core.String, $core.int>(3, _omitFieldNames ? '' : 'talents',
        entryClassName: 'GetTalentsResponse.TalentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3,
        packageName: const $pb.PackageName('character'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTalentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTalentsResponse copyWith(void Function(GetTalentsResponse) updates) =>
      super.copyWith((message) => updates(message as GetTalentsResponse))
          as GetTalentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTalentsResponse create() => GetTalentsResponse._();
  @$core.override
  GetTalentsResponse createEmptyInstance() => create();
  static $pb.PbList<GetTalentsResponse> createRepeated() =>
      $pb.PbList<GetTalentsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTalentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTalentsResponse>(create);
  static GetTalentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get talentPoints => $_getIZ(1);
  @$pb.TagNumber(2)
  set talentPoints($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTalentPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearTalentPoints() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.int> get talents => $_getMap(2);
}

class UpgradeTalentRequest extends $pb.GeneratedMessage {
  factory UpgradeTalentRequest({
    $core.int? characterId,
    $core.String? talentId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (talentId != null) result.talentId = talentId;
    return result;
  }

  UpgradeTalentRequest._();

  factory UpgradeTalentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpgradeTalentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpgradeTalentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'talentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeTalentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeTalentRequest copyWith(void Function(UpgradeTalentRequest) updates) =>
      super.copyWith((message) => updates(message as UpgradeTalentRequest))
          as UpgradeTalentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpgradeTalentRequest create() => UpgradeTalentRequest._();
  @$core.override
  UpgradeTalentRequest createEmptyInstance() => create();
  static $pb.PbList<UpgradeTalentRequest> createRepeated() =>
      $pb.PbList<UpgradeTalentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpgradeTalentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgradeTalentRequest>(create);
  static UpgradeTalentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get talentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set talentId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTalentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTalentId() => $_clearField(2);
}

class UpgradeTalentResponse extends $pb.GeneratedMessage {
  factory UpgradeTalentResponse({
    $core.bool? success,
    $core.String? message,
    $core.int? newLevel,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (newLevel != null) result.newLevel = newLevel;
    return result;
  }

  UpgradeTalentResponse._();

  factory UpgradeTalentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpgradeTalentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpgradeTalentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'newLevel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeTalentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeTalentResponse copyWith(
          void Function(UpgradeTalentResponse) updates) =>
      super.copyWith((message) => updates(message as UpgradeTalentResponse))
          as UpgradeTalentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpgradeTalentResponse create() => UpgradeTalentResponse._();
  @$core.override
  UpgradeTalentResponse createEmptyInstance() => create();
  static $pb.PbList<UpgradeTalentResponse> createRepeated() =>
      $pb.PbList<UpgradeTalentResponse>();
  @$core.pragma('dart2js:noInline')
  static UpgradeTalentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgradeTalentResponse>(create);
  static UpgradeTalentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get newLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set newLevel($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewLevel() => $_clearField(3);
}

class CompleteTutorialRequest extends $pb.GeneratedMessage {
  factory CompleteTutorialRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  CompleteTutorialRequest._();

  factory CompleteTutorialRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompleteTutorialRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompleteTutorialRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompleteTutorialRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompleteTutorialRequest copyWith(
          void Function(CompleteTutorialRequest) updates) =>
      super.copyWith((message) => updates(message as CompleteTutorialRequest))
          as CompleteTutorialRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompleteTutorialRequest create() => CompleteTutorialRequest._();
  @$core.override
  CompleteTutorialRequest createEmptyInstance() => create();
  static $pb.PbList<CompleteTutorialRequest> createRepeated() =>
      $pb.PbList<CompleteTutorialRequest>();
  @$core.pragma('dart2js:noInline')
  static CompleteTutorialRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompleteTutorialRequest>(create);
  static CompleteTutorialRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class CompleteTutorialResponse extends $pb.GeneratedMessage {
  factory CompleteTutorialResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  CompleteTutorialResponse._();

  factory CompleteTutorialResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompleteTutorialResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompleteTutorialResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'character'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompleteTutorialResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompleteTutorialResponse copyWith(
          void Function(CompleteTutorialResponse) updates) =>
      super.copyWith((message) => updates(message as CompleteTutorialResponse))
          as CompleteTutorialResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompleteTutorialResponse create() => CompleteTutorialResponse._();
  @$core.override
  CompleteTutorialResponse createEmptyInstance() => create();
  static $pb.PbList<CompleteTutorialResponse> createRepeated() =>
      $pb.PbList<CompleteTutorialResponse>();
  @$core.pragma('dart2js:noInline')
  static CompleteTutorialResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompleteTutorialResponse>(create);
  static CompleteTutorialResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
