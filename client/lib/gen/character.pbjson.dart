// This is a generated file - do not edit.
//
// Generated from character.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createCharacterRequestDescriptor instead')
const CreateCharacterRequest$json = {
  '1': 'CreateCharacterRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 5, '10': 'accountId'},
    {'1': 'character_name', '3': 2, '4': 1, '5': 9, '10': 'characterName'},
    {'1': 'class_type', '3': 3, '4': 1, '5': 9, '10': 'classType'},
  ],
};

/// Descriptor for `CreateCharacterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCharacterRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVDaGFyYWN0ZXJSZXF1ZXN0Eh0KCmFjY291bnRfaWQYASABKAVSCWFjY291bnRJZB'
    'IlCg5jaGFyYWN0ZXJfbmFtZRgCIAEoCVINY2hhcmFjdGVyTmFtZRIdCgpjbGFzc190eXBlGAMg'
    'ASgJUgljbGFzc1R5cGU=');

@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = {
  '1': 'AuthResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'account_id', '3': 3, '4': 1, '5': 5, '10': 'accountId'},
    {'1': 'character_id', '3': 4, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'username', '3': 5, '4': 1, '5': 9, '10': 'username'},
    {'1': 'character_name', '3': 6, '4': 1, '5': 9, '10': 'characterName'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode(
    'CgxBdXRoUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGAIgAS'
    'gJUgdtZXNzYWdlEh0KCmFjY291bnRfaWQYAyABKAVSCWFjY291bnRJZBIhCgxjaGFyYWN0ZXJf'
    'aWQYBCABKAVSC2NoYXJhY3RlcklkEhoKCHVzZXJuYW1lGAUgASgJUgh1c2VybmFtZRIlCg5jaG'
    'FyYWN0ZXJfbmFtZRgGIAEoCVINY2hhcmFjdGVyTmFtZQ==');

@$core.Deprecated('Use characterRequestDescriptor instead')
const CharacterRequest$json = {
  '1': 'CharacterRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `CharacterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterRequestDescriptor =
    $convert.base64Decode('ChBDaGFyYWN0ZXJSZXF1ZXN0Eg4KAmlkGAEgASgFUgJpZA==');

@$core.Deprecated('Use characterResponseDescriptor instead')
const CharacterResponse$json = {
  '1': 'CharacterResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'level', '3': 3, '4': 1, '5': 5, '10': 'level'},
    {'1': 'class_type', '3': 4, '4': 1, '5': 9, '10': 'classType'},
    {'1': 'experience', '3': 5, '4': 1, '5': 3, '10': 'experience'},
    {'1': 'strength', '3': 6, '4': 1, '5': 5, '10': 'strength'},
    {'1': 'dexterity', '3': 7, '4': 1, '5': 5, '10': 'dexterity'},
    {'1': 'intelligence', '3': 8, '4': 1, '5': 5, '10': 'intelligence'},
    {'1': 'luck', '3': 9, '4': 1, '5': 5, '10': 'luck'},
    {'1': 'talentpoint', '3': 10, '4': 1, '5': 5, '10': 'talentpoint'},
    {'1': 'gold', '3': 11, '4': 1, '5': 3, '10': 'gold'},
    {'1': 'barracks_end', '3': 12, '4': 1, '5': 3, '10': 'barracksEnd'},
    {'1': 'clan_id', '3': 13, '4': 1, '5': 5, '10': 'clanId'},
    {'1': 'total_crafts', '3': 14, '4': 1, '5': 5, '10': 'totalCrafts'},
    {'1': 'total_salvaged', '3': 15, '4': 1, '5': 5, '10': 'totalSalvaged'},
    {
      '1': 'total_raids_survived',
      '3': 16,
      '4': 1,
      '5': 5,
      '10': 'totalRaidsSurvived'
    },
    {'1': 'total_echo_wins', '3': 17, '4': 1, '5': 5, '10': 'totalEchoWins'},
    {
      '1': 'total_blizzards_survived',
      '3': 18,
      '4': 1,
      '5': 5,
      '10': 'totalBlizzardsSurvived'
    },
    {
      '1': 'total_resonance_pos',
      '3': 19,
      '4': 1,
      '5': 5,
      '10': 'totalResonancePos'
    },
    {'1': 'pvp_wins', '3': 20, '4': 1, '5': 5, '10': 'pvpWins'},
    {'1': 'pvp_losses', '3': 21, '4': 1, '5': 5, '10': 'pvpLosses'},
    {
      '1': 'total_focus_minutes',
      '3': 22,
      '4': 1,
      '5': 3,
      '10': 'totalFocusMinutes'
    },
    {
      '1': 'total_gold_earned',
      '3': 23,
      '4': 1,
      '5': 3,
      '10': 'totalGoldEarned'
    },
    {
      '1': 'total_loot_collected',
      '3': 24,
      '4': 1,
      '5': 3,
      '10': 'totalLootCollected'
    },
    {
      '1': 'total_expeditions',
      '3': 25,
      '4': 1,
      '5': 5,
      '10': 'totalExpeditions'
    },
    {'1': 'tutorial_step', '3': 26, '4': 1, '5': 5, '10': 'tutorialStep'},
  ],
};

/// Descriptor for `CharacterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterResponseDescriptor = $convert.base64Decode(
    'ChFDaGFyYWN0ZXJSZXNwb25zZRIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZR'
    'IUCgVsZXZlbBgDIAEoBVIFbGV2ZWwSHQoKY2xhc3NfdHlwZRgEIAEoCVIJY2xhc3NUeXBlEh4K'
    'CmV4cGVyaWVuY2UYBSABKANSCmV4cGVyaWVuY2USGgoIc3RyZW5ndGgYBiABKAVSCHN0cmVuZ3'
    'RoEhwKCWRleHRlcml0eRgHIAEoBVIJZGV4dGVyaXR5EiIKDGludGVsbGlnZW5jZRgIIAEoBVIM'
    'aW50ZWxsaWdlbmNlEhIKBGx1Y2sYCSABKAVSBGx1Y2sSIAoLdGFsZW50cG9pbnQYCiABKAVSC3'
    'RhbGVudHBvaW50EhIKBGdvbGQYCyABKANSBGdvbGQSIQoMYmFycmFja3NfZW5kGAwgASgDUgti'
    'YXJyYWNrc0VuZBIXCgdjbGFuX2lkGA0gASgFUgZjbGFuSWQSIQoMdG90YWxfY3JhZnRzGA4gAS'
    'gFUgt0b3RhbENyYWZ0cxIlCg50b3RhbF9zYWx2YWdlZBgPIAEoBVINdG90YWxTYWx2YWdlZBIw'
    'ChR0b3RhbF9yYWlkc19zdXJ2aXZlZBgQIAEoBVISdG90YWxSYWlkc1N1cnZpdmVkEiYKD3RvdG'
    'FsX2VjaG9fd2lucxgRIAEoBVINdG90YWxFY2hvV2lucxI4Chh0b3RhbF9ibGl6emFyZHNfc3Vy'
    'dml2ZWQYEiABKAVSFnRvdGFsQmxpenphcmRzU3Vydml2ZWQSLgoTdG90YWxfcmVzb25hbmNlX3'
    'BvcxgTIAEoBVIRdG90YWxSZXNvbmFuY2VQb3MSGQoIcHZwX3dpbnMYFCABKAVSB3B2cFdpbnMS'
    'HQoKcHZwX2xvc3NlcxgVIAEoBVIJcHZwTG9zc2VzEi4KE3RvdGFsX2ZvY3VzX21pbnV0ZXMYFi'
    'ABKANSEXRvdGFsRm9jdXNNaW51dGVzEioKEXRvdGFsX2dvbGRfZWFybmVkGBcgASgDUg90b3Rh'
    'bEdvbGRFYXJuZWQSMAoUdG90YWxfbG9vdF9jb2xsZWN0ZWQYGCABKANSEnRvdGFsTG9vdENvbG'
    'xlY3RlZBIrChF0b3RhbF9leHBlZGl0aW9ucxgZIAEoBVIQdG90YWxFeHBlZGl0aW9ucxIjCg10'
    'dXRvcmlhbF9zdGVwGBogASgFUgx0dXRvcmlhbFN0ZXA=');

@$core.Deprecated('Use getTalentsRequestDescriptor instead')
const GetTalentsRequest$json = {
  '1': 'GetTalentsRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetTalentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTalentsRequestDescriptor = $convert.base64Decode(
    'ChFHZXRUYWxlbnRzUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlcklk');

@$core.Deprecated('Use getTalentsResponseDescriptor instead')
const GetTalentsResponse$json = {
  '1': 'GetTalentsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'talent_points', '3': 2, '4': 1, '5': 5, '10': 'talentPoints'},
    {
      '1': 'talents',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.character.GetTalentsResponse.TalentsEntry',
      '10': 'talents'
    },
  ],
  '3': [GetTalentsResponse_TalentsEntry$json],
};

@$core.Deprecated('Use getTalentsResponseDescriptor instead')
const GetTalentsResponse_TalentsEntry$json = {
  '1': 'TalentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GetTalentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTalentsResponseDescriptor = $convert.base64Decode(
    'ChJHZXRUYWxlbnRzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIjCg10YWxlbn'
    'RfcG9pbnRzGAIgASgFUgx0YWxlbnRQb2ludHMSRAoHdGFsZW50cxgDIAMoCzIqLmNoYXJhY3Rl'
    'ci5HZXRUYWxlbnRzUmVzcG9uc2UuVGFsZW50c0VudHJ5Ugd0YWxlbnRzGjoKDFRhbGVudHNFbn'
    'RyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoBVIFdmFsdWU6AjgB');

@$core.Deprecated('Use upgradeTalentRequestDescriptor instead')
const UpgradeTalentRequest$json = {
  '1': 'UpgradeTalentRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'talent_id', '3': 2, '4': 1, '5': 9, '10': 'talentId'},
  ],
};

/// Descriptor for `UpgradeTalentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upgradeTalentRequestDescriptor = $convert.base64Decode(
    'ChRVcGdyYWRlVGFsZW50UmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlck'
    'lkEhsKCXRhbGVudF9pZBgCIAEoCVIIdGFsZW50SWQ=');

@$core.Deprecated('Use upgradeTalentResponseDescriptor instead')
const UpgradeTalentResponse$json = {
  '1': 'UpgradeTalentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'new_level', '3': 3, '4': 1, '5': 5, '10': 'newLevel'},
  ],
};

/// Descriptor for `UpgradeTalentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upgradeTalentResponseDescriptor = $convert.base64Decode(
    'ChVVcGdyYWRlVGFsZW50UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZX'
    'NzYWdlGAIgASgJUgdtZXNzYWdlEhsKCW5ld19sZXZlbBgDIAEoBVIIbmV3TGV2ZWw=');

@$core.Deprecated('Use completeTutorialRequestDescriptor instead')
const CompleteTutorialRequest$json = {
  '1': 'CompleteTutorialRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `CompleteTutorialRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeTutorialRequestDescriptor =
    $convert.base64Decode(
        'ChdDb21wbGV0ZVR1dG9yaWFsUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3'
        'Rlcklk');

@$core.Deprecated('Use completeTutorialResponseDescriptor instead')
const CompleteTutorialResponse$json = {
  '1': 'CompleteTutorialResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CompleteTutorialResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeTutorialResponseDescriptor =
    $convert.base64Decode(
        'ChhDb21wbGV0ZVR1dG9yaWFsUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
