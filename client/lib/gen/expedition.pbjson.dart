// This is a generated file - do not edit.
//
// Generated from expedition.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use startExpeditionRequestDescriptor instead')
const StartExpeditionRequest$json = {
  '1': 'StartExpeditionRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'duration_minutes', '3': 2, '4': 1, '5': 5, '10': 'durationMinutes'},
    {'1': 'activity_type', '3': 3, '4': 1, '5': 5, '10': 'activityType'},
    {'1': 'activity_level', '3': 4, '4': 1, '5': 5, '10': 'activityLevel'},
    {'1': 'allowed_domains', '3': 5, '4': 3, '5': 9, '10': 'allowedDomains'},
    {'1': 'allowed_apps', '3': 6, '4': 3, '5': 9, '10': 'allowedApps'},
  ],
};

/// Descriptor for `StartExpeditionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startExpeditionRequestDescriptor = $convert.base64Decode(
    'ChZTdGFydEV4cGVkaXRpb25SZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdG'
    'VySWQSKQoQZHVyYXRpb25fbWludXRlcxgCIAEoBVIPZHVyYXRpb25NaW51dGVzEiMKDWFjdGl2'
    'aXR5X3R5cGUYAyABKAVSDGFjdGl2aXR5VHlwZRIlCg5hY3Rpdml0eV9sZXZlbBgEIAEoBVINYW'
    'N0aXZpdHlMZXZlbBInCg9hbGxvd2VkX2RvbWFpbnMYBSADKAlSDmFsbG93ZWREb21haW5zEiEK'
    'DGFsbG93ZWRfYXBwcxgGIAMoCVILYWxsb3dlZEFwcHM=');

@$core.Deprecated('Use startExpeditionResponseDescriptor instead')
const StartExpeditionResponse$json = {
  '1': 'StartExpeditionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'expedition_end_unix',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'expeditionEndUnix'
    },
    {
      '1': 'total_gold_bonus_pct',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'totalGoldBonusPct'
    },
    {
      '1': 'total_luck_bonus_pct',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'totalLuckBonusPct'
    },
    {
      '1': 'penalty_reduction_pct',
      '3': 6,
      '4': 1,
      '5': 5,
      '10': 'penaltyReductionPct'
    },
    {'1': 'str_bonus_atk', '3': 7, '4': 1, '5': 5, '10': 'strBonusAtk'},
    {
      '1': 'dex_cycle_reduction',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'dexCycleReduction'
    },
    {'1': 'int_exp_bonus_pct', '3': 9, '4': 1, '5': 5, '10': 'intExpBonusPct'},
  ],
};

/// Descriptor for `StartExpeditionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startExpeditionResponseDescriptor = $convert.base64Decode(
    'ChdTdGFydEV4cGVkaXRpb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB2'
    '1lc3NhZ2UYAiABKAlSB21lc3NhZ2USLgoTZXhwZWRpdGlvbl9lbmRfdW5peBgDIAEoA1IRZXhw'
    'ZWRpdGlvbkVuZFVuaXgSLwoUdG90YWxfZ29sZF9ib251c19wY3QYBCABKAVSEXRvdGFsR29sZE'
    'JvbnVzUGN0Ei8KFHRvdGFsX2x1Y2tfYm9udXNfcGN0GAUgASgFUhF0b3RhbEx1Y2tCb251c1Bj'
    'dBIyChVwZW5hbHR5X3JlZHVjdGlvbl9wY3QYBiABKAVSE3BlbmFsdHlSZWR1Y3Rpb25QY3QSIg'
    'oNc3RyX2JvbnVzX2F0axgHIAEoBVILc3RyQm9udXNBdGsSLgoTZGV4X2N5Y2xlX3JlZHVjdGlv'
    'bhgIIAEoBVIRZGV4Q3ljbGVSZWR1Y3Rpb24SKQoRaW50X2V4cF9ib251c19wY3QYCSABKAVSDm'
    'ludEV4cEJvbnVzUGN0');

@$core.Deprecated('Use getExpeditionStatusRequestDescriptor instead')
const GetExpeditionStatusRequest$json = {
  '1': 'GetExpeditionStatusRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetExpeditionStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExpeditionStatusRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRFeHBlZGl0aW9uU3RhdHVzUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYX'
        'JhY3Rlcklk');

@$core.Deprecated('Use getExpeditionStatusResponseDescriptor instead')
const GetExpeditionStatusResponse$json = {
  '1': 'GetExpeditionStatusResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '10': 'isActive'},
    {
      '1': 'remaining_seconds',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'remainingSeconds'
    },
    {'1': 'activity_type', '3': 4, '4': 1, '5': 5, '10': 'activityType'},
    {'1': 'activity_level', '3': 5, '4': 1, '5': 5, '10': 'activityLevel'},
    {'1': 'just_finished', '3': 6, '4': 1, '5': 8, '10': 'justFinished'},
    {'1': 'gold_gained', '3': 7, '4': 1, '5': 3, '10': 'goldGained'},
    {'1': 'exp_gained', '3': 8, '4': 1, '5': 3, '10': 'expGained'},
    {'1': 'items_gained', '3': 9, '4': 3, '5': 9, '10': 'itemsGained'},
    {'1': 'penalty_stacks', '3': 10, '4': 1, '5': 5, '10': 'penaltyStacks'},
    {'1': 'penalty_expires', '3': 11, '4': 1, '5': 5, '10': 'penaltyExpires'},
  ],
};

/// Descriptor for `GetExpeditionStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExpeditionStatusResponseDescriptor = $convert.base64Decode(
    'ChtHZXRFeHBlZGl0aW9uU3RhdHVzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcx'
    'IbCglpc19hY3RpdmUYAiABKAhSCGlzQWN0aXZlEisKEXJlbWFpbmluZ19zZWNvbmRzGAMgASgD'
    'UhByZW1haW5pbmdTZWNvbmRzEiMKDWFjdGl2aXR5X3R5cGUYBCABKAVSDGFjdGl2aXR5VHlwZR'
    'IlCg5hY3Rpdml0eV9sZXZlbBgFIAEoBVINYWN0aXZpdHlMZXZlbBIjCg1qdXN0X2ZpbmlzaGVk'
    'GAYgASgIUgxqdXN0RmluaXNoZWQSHwoLZ29sZF9nYWluZWQYByABKANSCmdvbGRHYWluZWQSHQ'
    'oKZXhwX2dhaW5lZBgIIAEoA1IJZXhwR2FpbmVkEiEKDGl0ZW1zX2dhaW5lZBgJIAMoCVILaXRl'
    'bXNHYWluZWQSJQoOcGVuYWx0eV9zdGFja3MYCiABKAVSDXBlbmFsdHlTdGFja3MSJwoPcGVuYW'
    'x0eV9leHBpcmVzGAsgASgFUg5wZW5hbHR5RXhwaXJlcw==');

@$core.Deprecated('Use stopExpeditionRequestDescriptor instead')
const StopExpeditionRequest$json = {
  '1': 'StopExpeditionRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `StopExpeditionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopExpeditionRequestDescriptor = $convert.base64Decode(
    'ChVTdG9wRXhwZWRpdGlvblJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZX'
    'JJZA==');

@$core.Deprecated('Use stopExpeditionResponseDescriptor instead')
const StopExpeditionResponse$json = {
  '1': 'StopExpeditionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'penalty_applied', '3': 3, '4': 1, '5': 8, '10': 'penaltyApplied'},
  ],
};

/// Descriptor for `StopExpeditionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopExpeditionResponseDescriptor = $convert.base64Decode(
    'ChZTdG9wRXhwZWRpdGlvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbW'
    'Vzc2FnZRgCIAEoCVIHbWVzc2FnZRInCg9wZW5hbHR5X2FwcGxpZWQYAyABKAhSDnBlbmFsdHlB'
    'cHBsaWVk');

@$core.Deprecated('Use heartbeatRequestDescriptor instead')
const HeartbeatRequest$json = {
  '1': 'HeartbeatRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `HeartbeatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatRequestDescriptor = $convert.base64Decode(
    'ChBIZWFydGJlYXRSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySWQ=');

@$core.Deprecated('Use heartbeatResponseDescriptor instead')
const HeartbeatResponse$json = {
  '1': 'HeartbeatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'gold_gained', '3': 4, '4': 1, '5': 3, '10': 'goldGained'},
    {'1': 'exp_gained', '3': 5, '4': 1, '5': 3, '10': 'expGained'},
    {'1': 'items_gained', '3': 6, '4': 3, '5': 9, '10': 'itemsGained'},
    {'1': 'new_level', '3': 7, '4': 1, '5': 5, '10': 'newLevel'},
  ],
};

/// Descriptor for `HeartbeatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatResponseDescriptor = $convert.base64Decode(
    'ChFIZWFydGJlYXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhsKCWlzX2FjdG'
    'l2ZRgCIAEoCFIIaXNBY3RpdmUSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIfCgtnb2xkX2dh'
    'aW5lZBgEIAEoA1IKZ29sZEdhaW5lZBIdCgpleHBfZ2FpbmVkGAUgASgDUglleHBHYWluZWQSIQ'
    'oMaXRlbXNfZ2FpbmVkGAYgAygJUgtpdGVtc0dhaW5lZBIbCgluZXdfbGV2ZWwYByABKAVSCG5l'
    'd0xldmVs');

@$core.Deprecated('Use finishExpeditionRequestDescriptor instead')
const FinishExpeditionRequest$json = {
  '1': 'FinishExpeditionRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `FinishExpeditionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finishExpeditionRequestDescriptor =
    $convert.base64Decode(
        'ChdGaW5pc2hFeHBlZGl0aW9uUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3'
        'Rlcklk');

@$core.Deprecated('Use finishExpeditionResponseDescriptor instead')
const FinishExpeditionResponse$json = {
  '1': 'FinishExpeditionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'gold_gained', '3': 3, '4': 1, '5': 3, '10': 'goldGained'},
    {'1': 'exp_gained', '3': 4, '4': 1, '5': 3, '10': 'expGained'},
    {'1': 'items_gained', '3': 5, '4': 3, '5': 9, '10': 'itemsGained'},
    {'1': 'new_level', '3': 6, '4': 1, '5': 5, '10': 'newLevel'},
    {'1': 'echo_triggered', '3': 7, '4': 1, '5': 8, '10': 'echoTriggered'},
    {'1': 'echo_defeated', '3': 8, '4': 1, '5': 8, '10': 'echoDefeated'},
    {'1': 'echo_gold_lost', '3': 9, '4': 1, '5': 3, '10': 'echoGoldLost'},
    {'1': 'echo_exp_lost', '3': 10, '4': 1, '5': 3, '10': 'echoExpLost'},
    {'1': 'raid_triggered', '3': 11, '4': 1, '5': 8, '10': 'raidTriggered'},
    {
      '1': 'raid_resources_lost',
      '3': 12,
      '4': 1,
      '5': 3,
      '10': 'raidResourcesLost'
    },
    {
      '1': 'blizzard_triggered',
      '3': 13,
      '4': 1,
      '5': 8,
      '10': 'blizzardTriggered'
    },
    {
      '1': 'blizzard_gold_lost',
      '3': 14,
      '4': 1,
      '5': 3,
      '10': 'blizzardGoldLost'
    },
    {
      '1': 'blizzard_resource_lost',
      '3': 15,
      '4': 1,
      '5': 3,
      '10': 'blizzardResourceLost'
    },
    {
      '1': 'resonance_triggered',
      '3': 16,
      '4': 1,
      '5': 8,
      '10': 'resonanceTriggered'
    },
    {
      '1': 'resonance_positive',
      '3': 17,
      '4': 1,
      '5': 8,
      '10': 'resonancePositive'
    },
  ],
};

/// Descriptor for `FinishExpeditionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finishExpeditionResponseDescriptor = $convert.base64Decode(
    'ChhGaW5pc2hFeHBlZGl0aW9uUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCg'
    'dtZXNzYWdlGAIgASgJUgdtZXNzYWdlEh8KC2dvbGRfZ2FpbmVkGAMgASgDUgpnb2xkR2FpbmVk'
    'Eh0KCmV4cF9nYWluZWQYBCABKANSCWV4cEdhaW5lZBIhCgxpdGVtc19nYWluZWQYBSADKAlSC2'
    'l0ZW1zR2FpbmVkEhsKCW5ld19sZXZlbBgGIAEoBVIIbmV3TGV2ZWwSJQoOZWNob190cmlnZ2Vy'
    'ZWQYByABKAhSDWVjaG9UcmlnZ2VyZWQSIwoNZWNob19kZWZlYXRlZBgIIAEoCFIMZWNob0RlZm'
    'VhdGVkEiQKDmVjaG9fZ29sZF9sb3N0GAkgASgDUgxlY2hvR29sZExvc3QSIgoNZWNob19leHBf'
    'bG9zdBgKIAEoA1ILZWNob0V4cExvc3QSJQoOcmFpZF90cmlnZ2VyZWQYCyABKAhSDXJhaWRUcm'
    'lnZ2VyZWQSLgoTcmFpZF9yZXNvdXJjZXNfbG9zdBgMIAEoA1IRcmFpZFJlc291cmNlc0xvc3QS'
    'LQoSYmxpenphcmRfdHJpZ2dlcmVkGA0gASgIUhFibGl6emFyZFRyaWdnZXJlZBIsChJibGl6em'
    'FyZF9nb2xkX2xvc3QYDiABKANSEGJsaXp6YXJkR29sZExvc3QSNAoWYmxpenphcmRfcmVzb3Vy'
    'Y2VfbG9zdBgPIAEoA1IUYmxpenphcmRSZXNvdXJjZUxvc3QSLwoTcmVzb25hbmNlX3RyaWdnZX'
    'JlZBgQIAEoCFIScmVzb25hbmNlVHJpZ2dlcmVkEi0KEnJlc29uYW5jZV9wb3NpdGl2ZRgRIAEo'
    'CFIRcmVzb25hbmNlUG9zaXRpdmU=');

@$core.Deprecated('Use pauseExpeditionRequestDescriptor instead')
const PauseExpeditionRequest$json = {
  '1': 'PauseExpeditionRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `PauseExpeditionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pauseExpeditionRequestDescriptor =
    $convert.base64Decode(
        'ChZQYXVzZUV4cGVkaXRpb25SZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdG'
        'VySWQ=');

@$core.Deprecated('Use pauseExpeditionResponseDescriptor instead')
const PauseExpeditionResponse$json = {
  '1': 'PauseExpeditionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `PauseExpeditionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pauseExpeditionResponseDescriptor =
    $convert.base64Decode(
        'ChdQYXVzZUV4cGVkaXRpb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB2'
        '1lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use resumeExpeditionRequestDescriptor instead')
const ResumeExpeditionRequest$json = {
  '1': 'ResumeExpeditionRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `ResumeExpeditionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resumeExpeditionRequestDescriptor =
    $convert.base64Decode(
        'ChdSZXN1bWVFeHBlZGl0aW9uUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3'
        'Rlcklk');

@$core.Deprecated('Use resumeExpeditionResponseDescriptor instead')
const ResumeExpeditionResponse$json = {
  '1': 'ResumeExpeditionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'remaining_seconds',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'remainingSeconds'
    },
  ],
};

/// Descriptor for `ResumeExpeditionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resumeExpeditionResponseDescriptor = $convert.base64Decode(
    'ChhSZXN1bWVFeHBlZGl0aW9uUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCg'
    'dtZXNzYWdlGAIgASgJUgdtZXNzYWdlEisKEXJlbWFpbmluZ19zZWNvbmRzGAMgASgDUhByZW1h'
    'aW5pbmdTZWNvbmRz');
