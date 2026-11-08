// This is a generated file - do not edit.
//
// Generated from city.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getCityRequestDescriptor instead')
const GetCityRequest$json = {
  '1': 'GetCityRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetCityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCityRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRDaXR5UmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlcklk');

@$core.Deprecated('Use getCityResponseDescriptor instead')
const GetCityResponse$json = {
  '1': 'GetCityResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'city_id', '3': 3, '4': 1, '5': 5, '10': 'cityId'},
    {'1': 'level', '3': 4, '4': 1, '5': 5, '10': 'level'},
    {
      '1': 'resources',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.city.ResourceEntry',
      '10': 'resources'
    },
    {
      '1': 'upgrades',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.city.GetCityResponse.UpgradesEntry',
      '10': 'upgrades'
    },
  ],
  '3': [GetCityResponse_UpgradesEntry$json],
};

@$core.Deprecated('Use getCityResponseDescriptor instead')
const GetCityResponse_UpgradesEntry$json = {
  '1': 'UpgradesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GetCityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCityResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRDaXR5UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGA'
    'IgASgJUgdtZXNzYWdlEhcKB2NpdHlfaWQYAyABKAVSBmNpdHlJZBIUCgVsZXZlbBgEIAEoBVIF'
    'bGV2ZWwSMQoJcmVzb3VyY2VzGAUgAygLMhMuY2l0eS5SZXNvdXJjZUVudHJ5UglyZXNvdXJjZX'
    'MSPwoIdXBncmFkZXMYBiADKAsyIy5jaXR5LkdldENpdHlSZXNwb25zZS5VcGdyYWRlc0VudHJ5'
    'Ugh1cGdyYWRlcxo7Cg1VcGdyYWRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGA'
    'IgASgFUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use resourceEntryDescriptor instead')
const ResourceEntry$json = {
  '1': 'ResourceEntry',
  '2': [
    {'1': 'resource_type', '3': 1, '4': 1, '5': 9, '10': 'resourceType'},
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `ResourceEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceEntryDescriptor = $convert.base64Decode(
    'Cg1SZXNvdXJjZUVudHJ5EiMKDXJlc291cmNlX3R5cGUYASABKAlSDHJlc291cmNlVHlwZRIWCg'
    'ZhbW91bnQYAiABKANSBmFtb3VudA==');

@$core.Deprecated('Use upgradeBuildingRequestDescriptor instead')
const UpgradeBuildingRequest$json = {
  '1': 'UpgradeBuildingRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'upgrade_code', '3': 2, '4': 1, '5': 9, '10': 'upgradeCode'},
  ],
};

/// Descriptor for `UpgradeBuildingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upgradeBuildingRequestDescriptor =
    $convert.base64Decode(
        'ChZVcGdyYWRlQnVpbGRpbmdSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdG'
        'VySWQSIQoMdXBncmFkZV9jb2RlGAIgASgJUgt1cGdyYWRlQ29kZQ==');

@$core.Deprecated('Use upgradeBuildingResponseDescriptor instead')
const UpgradeBuildingResponse$json = {
  '1': 'UpgradeBuildingResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'new_level', '3': 3, '4': 1, '5': 5, '10': 'newLevel'},
  ],
};

/// Descriptor for `UpgradeBuildingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upgradeBuildingResponseDescriptor = $convert.base64Decode(
    'ChdVcGdyYWRlQnVpbGRpbmdSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB2'
    '1lc3NhZ2UYAiABKAlSB21lc3NhZ2USGwoJbmV3X2xldmVsGAMgASgFUghuZXdMZXZlbA==');

@$core.Deprecated('Use getFoodRecipesRequestDescriptor instead')
const GetFoodRecipesRequest$json = {
  '1': 'GetFoodRecipesRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetFoodRecipesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFoodRecipesRequestDescriptor = $convert.base64Decode(
    'ChVHZXRGb29kUmVjaXBlc1JlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZX'
    'JJZA==');

@$core.Deprecated('Use getFoodRecipesResponseDescriptor instead')
const GetFoodRecipesResponse$json = {
  '1': 'GetFoodRecipesResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'recipes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.city.FoodRecipe',
      '10': 'recipes'
    },
    {
      '1': 'active_food_gold_pct',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'activeFoodGoldPct'
    },
    {
      '1': 'active_food_exp_pct',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'activeFoodExpPct'
    },
    {
      '1': 'active_food_luck_pct',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'activeFoodLuckPct'
    },
  ],
};

/// Descriptor for `GetFoodRecipesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFoodRecipesResponseDescriptor = $convert.base64Decode(
    'ChZHZXRGb29kUmVjaXBlc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSKgoHcm'
    'VjaXBlcxgCIAMoCzIQLmNpdHkuRm9vZFJlY2lwZVIHcmVjaXBlcxIvChRhY3RpdmVfZm9vZF9n'
    'b2xkX3BjdBgDIAEoBVIRYWN0aXZlRm9vZEdvbGRQY3QSLQoTYWN0aXZlX2Zvb2RfZXhwX3BjdB'
    'gEIAEoBVIQYWN0aXZlRm9vZEV4cFBjdBIvChRhY3RpdmVfZm9vZF9sdWNrX3BjdBgFIAEoBVIR'
    'YWN0aXZlRm9vZEx1Y2tQY3Q=');

@$core.Deprecated('Use foodRecipeDescriptor instead')
const FoodRecipe$json = {
  '1': 'FoodRecipe',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'cost_resource', '3': 5, '4': 1, '5': 9, '10': 'costResource'},
    {'1': 'cost_amount', '3': 6, '4': 1, '5': 5, '10': 'costAmount'},
    {'1': 'buff_gold_pct', '3': 7, '4': 1, '5': 5, '10': 'buffGoldPct'},
    {'1': 'buff_exp_pct', '3': 8, '4': 1, '5': 5, '10': 'buffExpPct'},
    {'1': 'buff_luck_pct', '3': 9, '4': 1, '5': 5, '10': 'buffLuckPct'},
    {'1': 'tier', '3': 10, '4': 1, '5': 5, '10': 'tier'},
  ],
};

/// Descriptor for `FoodRecipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List foodRecipeDescriptor = $convert.base64Decode(
    'CgpGb29kUmVjaXBlEg4KAmlkGAEgASgFUgJpZBISCgRjb2RlGAIgASgJUgRjb2RlEhIKBG5hbW'
    'UYAyABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEiMKDWNvc3Rf'
    'cmVzb3VyY2UYBSABKAlSDGNvc3RSZXNvdXJjZRIfCgtjb3N0X2Ftb3VudBgGIAEoBVIKY29zdE'
    'Ftb3VudBIiCg1idWZmX2dvbGRfcGN0GAcgASgFUgtidWZmR29sZFBjdBIgCgxidWZmX2V4cF9w'
    'Y3QYCCABKAVSCmJ1ZmZFeHBQY3QSIgoNYnVmZl9sdWNrX3BjdBgJIAEoBVILYnVmZkx1Y2tQY3'
    'QSEgoEdGllchgKIAEoBVIEdGllcg==');

@$core.Deprecated('Use buyFoodRequestDescriptor instead')
const BuyFoodRequest$json = {
  '1': 'BuyFoodRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'food_code', '3': 2, '4': 1, '5': 9, '10': 'foodCode'},
  ],
};

/// Descriptor for `BuyFoodRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyFoodRequestDescriptor = $convert.base64Decode(
    'Cg5CdXlGb29kUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3RlcklkEhsKCW'
    'Zvb2RfY29kZRgCIAEoCVIIZm9vZENvZGU=');

@$core.Deprecated('Use buyFoodResponseDescriptor instead')
const BuyFoodResponse$json = {
  '1': 'BuyFoodResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `BuyFoodResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyFoodResponseDescriptor = $convert.base64Decode(
    'Cg9CdXlGb29kUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGA'
    'IgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getPotionRecipesRequestDescriptor instead')
const GetPotionRecipesRequest$json = {
  '1': 'GetPotionRecipesRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetPotionRecipesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPotionRecipesRequestDescriptor =
    $convert.base64Decode(
        'ChdHZXRQb3Rpb25SZWNpcGVzUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3'
        'Rlcklk');

@$core.Deprecated('Use getPotionRecipesResponseDescriptor instead')
const GetPotionRecipesResponse$json = {
  '1': 'GetPotionRecipesResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'recipes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.city.PotionRecipe',
      '10': 'recipes'
    },
  ],
};

/// Descriptor for `GetPotionRecipesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPotionRecipesResponseDescriptor =
    $convert.base64Decode(
        'ChhHZXRQb3Rpb25SZWNpcGVzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIsCg'
        'dyZWNpcGVzGAIgAygLMhIuY2l0eS5Qb3Rpb25SZWNpcGVSB3JlY2lwZXM=');

@$core.Deprecated('Use potionRecipeDescriptor instead')
const PotionRecipe$json = {
  '1': 'PotionRecipe',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'tier', '3': 5, '4': 1, '5': 5, '10': 'tier'},
    {'1': 'cost_resource', '3': 6, '4': 1, '5': 9, '10': 'costResource'},
    {'1': 'cost_amount', '3': 7, '4': 1, '5': 5, '10': 'costAmount'},
    {'1': 'cost_gold', '3': 8, '4': 1, '5': 5, '10': 'costGold'},
    {'1': 'reward_gold', '3': 9, '4': 1, '5': 5, '10': 'rewardGold'},
    {'1': 'reward_exp', '3': 10, '4': 1, '5': 5, '10': 'rewardExp'},
    {'1': 'reward_resource', '3': 11, '4': 1, '5': 9, '10': 'rewardResource'},
    {
      '1': 'reward_resource_amount',
      '3': 12,
      '4': 1,
      '5': 5,
      '10': 'rewardResourceAmount'
    },
  ],
};

/// Descriptor for `PotionRecipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List potionRecipeDescriptor = $convert.base64Decode(
    'CgxQb3Rpb25SZWNpcGUSDgoCaWQYASABKAVSAmlkEhIKBGNvZGUYAiABKAlSBGNvZGUSEgoEbm'
    'FtZRgDIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb24SEgoEdGll'
    'chgFIAEoBVIEdGllchIjCg1jb3N0X3Jlc291cmNlGAYgASgJUgxjb3N0UmVzb3VyY2USHwoLY2'
    '9zdF9hbW91bnQYByABKAVSCmNvc3RBbW91bnQSGwoJY29zdF9nb2xkGAggASgFUghjb3N0R29s'
    'ZBIfCgtyZXdhcmRfZ29sZBgJIAEoBVIKcmV3YXJkR29sZBIdCgpyZXdhcmRfZXhwGAogASgFUg'
    'lyZXdhcmRFeHASJwoPcmV3YXJkX3Jlc291cmNlGAsgASgJUg5yZXdhcmRSZXNvdXJjZRI0ChZy'
    'ZXdhcmRfcmVzb3VyY2VfYW1vdW50GAwgASgFUhRyZXdhcmRSZXNvdXJjZUFtb3VudA==');

@$core.Deprecated('Use drinkPotionRequestDescriptor instead')
const DrinkPotionRequest$json = {
  '1': 'DrinkPotionRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'potion_code', '3': 2, '4': 1, '5': 9, '10': 'potionCode'},
  ],
};

/// Descriptor for `DrinkPotionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drinkPotionRequestDescriptor = $convert.base64Decode(
    'ChJEcmlua1BvdGlvblJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZXJJZB'
    'IfCgtwb3Rpb25fY29kZRgCIAEoCVIKcG90aW9uQ29kZQ==');

@$core.Deprecated('Use drinkPotionResponseDescriptor instead')
const DrinkPotionResponse$json = {
  '1': 'DrinkPotionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DrinkPotionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drinkPotionResponseDescriptor = $convert.base64Decode(
    'ChNEcmlua1BvdGlvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use startBarracksRequestDescriptor instead')
const StartBarracksRequest$json = {
  '1': 'StartBarracksRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `StartBarracksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startBarracksRequestDescriptor = $convert.base64Decode(
    'ChRTdGFydEJhcnJhY2tzUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlck'
    'lk');

@$core.Deprecated('Use startBarracksResponseDescriptor instead')
const StartBarracksResponse$json = {
  '1': 'StartBarracksResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'end_time', '3': 3, '4': 1, '5': 3, '10': 'endTime'},
  ],
};

/// Descriptor for `StartBarracksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startBarracksResponseDescriptor = $convert.base64Decode(
    'ChVTdGFydEJhcnJhY2tzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZX'
    'NzYWdlGAIgASgJUgdtZXNzYWdlEhkKCGVuZF90aW1lGAMgASgDUgdlbmRUaW1l');

@$core.Deprecated('Use claimBarracksRequestDescriptor instead')
const ClaimBarracksRequest$json = {
  '1': 'ClaimBarracksRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `ClaimBarracksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimBarracksRequestDescriptor = $convert.base64Decode(
    'ChRDbGFpbUJhcnJhY2tzUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlck'
    'lk');

@$core.Deprecated('Use claimBarracksResponseDescriptor instead')
const ClaimBarracksResponse$json = {
  '1': 'ClaimBarracksResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'gold_earned', '3': 3, '4': 1, '5': 3, '10': 'goldEarned'},
  ],
};

/// Descriptor for `ClaimBarracksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimBarracksResponseDescriptor = $convert.base64Decode(
    'ChVDbGFpbUJhcnJhY2tzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZX'
    'NzYWdlGAIgASgJUgdtZXNzYWdlEh8KC2dvbGRfZWFybmVkGAMgASgDUgpnb2xkRWFybmVk');

@$core.Deprecated('Use getRaidLogsRequestDescriptor instead')
const GetRaidLogsRequest$json = {
  '1': 'GetRaidLogsRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetRaidLogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRaidLogsRequestDescriptor = $convert.base64Decode(
    'ChJHZXRSYWlkTG9nc1JlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZXJJZA'
    '==');

@$core.Deprecated('Use raidLogDescriptor instead')
const RaidLog$json = {
  '1': 'RaidLog',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'raid_power', '3': 2, '4': 1, '5': 5, '10': 'raidPower'},
    {'1': 'wall_defense', '3': 3, '4': 1, '5': 5, '10': 'wallDefense'},
    {'1': 'resources_lost', '3': 4, '4': 1, '5': 3, '10': 'resourcesLost'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `RaidLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raidLogDescriptor = $convert.base64Decode(
    'CgdSYWlkTG9nEg4KAmlkGAEgASgFUgJpZBIdCgpyYWlkX3Bvd2VyGAIgASgFUglyYWlkUG93ZX'
    'ISIQoMd2FsbF9kZWZlbnNlGAMgASgFUgt3YWxsRGVmZW5zZRIlCg5yZXNvdXJjZXNfbG9zdBgE'
    'IAEoA1INcmVzb3VyY2VzTG9zdBIdCgpjcmVhdGVkX2F0GAUgASgJUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use getRaidLogsResponseDescriptor instead')
const GetRaidLogsResponse$json = {
  '1': 'GetRaidLogsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'logs', '3': 2, '4': 3, '5': 11, '6': '.city.RaidLog', '10': 'logs'},
  ],
};

/// Descriptor for `GetRaidLogsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRaidLogsResponseDescriptor = $convert.base64Decode(
    'ChNHZXRSYWlkTG9nc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIQoEbG9ncx'
    'gCIAMoCzINLmNpdHkuUmFpZExvZ1IEbG9ncw==');

@$core.Deprecated('Use getLeaderboardRequestDescriptor instead')
const GetLeaderboardRequest$json = {
  '1': 'GetLeaderboardRequest',
  '2': [
    {'1': 'sort_by', '3': 1, '4': 1, '5': 9, '10': 'sortBy'},
  ],
};

/// Descriptor for `GetLeaderboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLeaderboardRequestDescriptor =
    $convert.base64Decode(
        'ChVHZXRMZWFkZXJib2FyZFJlcXVlc3QSFwoHc29ydF9ieRgBIAEoCVIGc29ydEJ5');

@$core.Deprecated('Use getLeaderboardResponseDescriptor instead')
const GetLeaderboardResponse$json = {
  '1': 'GetLeaderboardResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'entries',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.city.LeaderboardEntry',
      '10': 'entries'
    },
  ],
};

/// Descriptor for `GetLeaderboardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLeaderboardResponseDescriptor =
    $convert.base64Decode(
        'ChZHZXRMZWFkZXJib2FyZFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSMAoHZW'
        '50cmllcxgCIAMoCzIWLmNpdHkuTGVhZGVyYm9hcmRFbnRyeVIHZW50cmllcw==');

@$core.Deprecated('Use leaderboardEntryDescriptor instead')
const LeaderboardEntry$json = {
  '1': 'LeaderboardEntry',
  '2': [
    {'1': 'rank', '3': 1, '4': 1, '5': 5, '10': 'rank'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'level', '3': 3, '4': 1, '5': 5, '10': 'level'},
    {'1': 'total_time', '3': 4, '4': 1, '5': 3, '10': 'totalTime'},
    {'1': 'class_type', '3': 5, '4': 1, '5': 9, '10': 'classType'},
    {'1': 'character_id', '3': 6, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `LeaderboardEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaderboardEntryDescriptor = $convert.base64Decode(
    'ChBMZWFkZXJib2FyZEVudHJ5EhIKBHJhbmsYASABKAVSBHJhbmsSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIUCgVsZXZlbBgDIAEoBVIFbGV2ZWwSHQoKdG90YWxfdGltZRgEIAEoA1IJdG90YWxUaW1l'
    'Eh0KCmNsYXNzX3R5cGUYBSABKAlSCWNsYXNzVHlwZRIhCgxjaGFyYWN0ZXJfaWQYBiABKAVSC2'
    'NoYXJhY3Rlcklk');

@$core.Deprecated('Use searchPlayerRequestDescriptor instead')
const SearchPlayerRequest$json = {
  '1': 'SearchPlayerRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `SearchPlayerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchPlayerRequestDescriptor = $convert
    .base64Decode('ChNTZWFyY2hQbGF5ZXJSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use searchPlayerResponseDescriptor instead')
const SearchPlayerResponse$json = {
  '1': 'SearchPlayerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'character_id', '3': 2, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'level', '3': 4, '4': 1, '5': 5, '10': 'level'},
    {'1': 'class_type', '3': 5, '4': 1, '5': 9, '10': 'classType'},
    {'1': 'clan_id', '3': 6, '4': 1, '5': 5, '10': 'clanId'},
  ],
};

/// Descriptor for `SearchPlayerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchPlayerResponseDescriptor = $convert.base64Decode(
    'ChRTZWFyY2hQbGF5ZXJSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEiEKDGNoYX'
    'JhY3Rlcl9pZBgCIAEoBVILY2hhcmFjdGVySWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIUCgVsZXZl'
    'bBgEIAEoBVIFbGV2ZWwSHQoKY2xhc3NfdHlwZRgFIAEoCVIJY2xhc3NUeXBlEhcKB2NsYW5faW'
    'QYBiABKAVSBmNsYW5JZA==');

@$core.Deprecated('Use addFriendRequestDescriptor instead')
const AddFriendRequest$json = {
  '1': 'AddFriendRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'target_id', '3': 2, '4': 1, '5': 5, '10': 'targetId'},
  ],
};

/// Descriptor for `AddFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addFriendRequestDescriptor = $convert.base64Decode(
    'ChBBZGRGcmllbmRSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySWQSGw'
    'oJdGFyZ2V0X2lkGAIgASgFUgh0YXJnZXRJZA==');

@$core.Deprecated('Use addFriendResponseDescriptor instead')
const AddFriendResponse$json = {
  '1': 'AddFriendResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AddFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addFriendResponseDescriptor = $convert.base64Decode(
    'ChFBZGRGcmllbmRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2'
    'UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use friendEntryDescriptor instead')
const FriendEntry$json = {
  '1': 'FriendEntry',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'level', '3': 3, '4': 1, '5': 5, '10': 'level'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `FriendEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendEntryDescriptor = $convert.base64Decode(
    'CgtGcmllbmRFbnRyeRIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3RlcklkEhIKBG5hbW'
    'UYAiABKAlSBG5hbWUSFAoFbGV2ZWwYAyABKAVSBWxldmVsEhYKBnN0YXR1cxgEIAEoCVIGc3Rh'
    'dHVz');

@$core.Deprecated('Use getFriendsRequestDescriptor instead')
const GetFriendsRequest$json = {
  '1': 'GetFriendsRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetFriendsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendsRequestDescriptor = $convert.base64Decode(
    'ChFHZXRGcmllbmRzUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlcklk');

@$core.Deprecated('Use getFriendsResponseDescriptor instead')
const GetFriendsResponse$json = {
  '1': 'GetFriendsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'friends',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.city.FriendEntry',
      '10': 'friends'
    },
  ],
};

/// Descriptor for `GetFriendsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendsResponseDescriptor = $convert.base64Decode(
    'ChJHZXRGcmllbmRzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIrCgdmcmllbm'
    'RzGAIgAygLMhEuY2l0eS5GcmllbmRFbnRyeVIHZnJpZW5kcw==');

@$core.Deprecated('Use acceptFriendRequestDescriptor instead')
const AcceptFriendRequest$json = {
  '1': 'AcceptFriendRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'requester_id', '3': 2, '4': 1, '5': 5, '10': 'requesterId'},
  ],
};

/// Descriptor for `AcceptFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptFriendRequestDescriptor = $convert.base64Decode(
    'ChNBY2NlcHRGcmllbmRSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySW'
    'QSIQoMcmVxdWVzdGVyX2lkGAIgASgFUgtyZXF1ZXN0ZXJJZA==');

@$core.Deprecated('Use acceptFriendResponseDescriptor instead')
const AcceptFriendResponse$json = {
  '1': 'AcceptFriendResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AcceptFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptFriendResponseDescriptor = $convert.base64Decode(
    'ChRBY2NlcHRGcmllbmRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use createClanRequestDescriptor instead')
const CreateClanRequest$json = {
  '1': 'CreateClanRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'clan_name', '3': 2, '4': 1, '5': 9, '10': 'clanName'},
  ],
};

/// Descriptor for `CreateClanRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createClanRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVDbGFuUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3RlcklkEh'
    'sKCWNsYW5fbmFtZRgCIAEoCVIIY2xhbk5hbWU=');

@$core.Deprecated('Use createClanResponseDescriptor instead')
const CreateClanResponse$json = {
  '1': 'CreateClanResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateClanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createClanResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVDbGFuUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYW'
    'dlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use joinClanRequestDescriptor instead')
const JoinClanRequest$json = {
  '1': 'JoinClanRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'clan_id', '3': 2, '4': 1, '5': 5, '10': 'clanId'},
  ],
};

/// Descriptor for `JoinClanRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinClanRequestDescriptor = $convert.base64Decode(
    'Cg9Kb2luQ2xhblJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZXJJZBIXCg'
    'djbGFuX2lkGAIgASgFUgZjbGFuSWQ=');

@$core.Deprecated('Use joinClanResponseDescriptor instead')
const JoinClanResponse$json = {
  '1': 'JoinClanResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `JoinClanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinClanResponseDescriptor = $convert.base64Decode(
    'ChBKb2luQ2xhblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getClanInfoRequestDescriptor instead')
const GetClanInfoRequest$json = {
  '1': 'GetClanInfoRequest',
  '2': [
    {'1': 'clan_id', '3': 1, '4': 1, '5': 5, '10': 'clanId'},
  ],
};

/// Descriptor for `GetClanInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClanInfoRequestDescriptor =
    $convert.base64Decode(
        'ChJHZXRDbGFuSW5mb1JlcXVlc3QSFwoHY2xhbl9pZBgBIAEoBVIGY2xhbklk');

@$core.Deprecated('Use getClanInfoResponseDescriptor instead')
const GetClanInfoResponse$json = {
  '1': 'GetClanInfoResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'leader_name', '3': 3, '4': 1, '5': 9, '10': 'leaderName'},
    {
      '1': 'members',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.city.FriendEntry',
      '10': 'members'
    },
    {'1': 'bank_gold', '3': 5, '4': 1, '5': 3, '10': 'bankGold'},
    {'1': 'active_buff', '3': 6, '4': 1, '5': 9, '10': 'activeBuff'},
    {'1': 'buff_expires_at', '3': 7, '4': 1, '5': 3, '10': 'buffExpiresAt'},
  ],
};

/// Descriptor for `GetClanInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClanInfoResponseDescriptor = $convert.base64Decode(
    'ChNHZXRDbGFuSW5mb1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSEgoEbmFtZR'
    'gCIAEoCVIEbmFtZRIfCgtsZWFkZXJfbmFtZRgDIAEoCVIKbGVhZGVyTmFtZRIrCgdtZW1iZXJz'
    'GAQgAygLMhEuY2l0eS5GcmllbmRFbnRyeVIHbWVtYmVycxIbCgliYW5rX2dvbGQYBSABKANSCG'
    'JhbmtHb2xkEh8KC2FjdGl2ZV9idWZmGAYgASgJUgphY3RpdmVCdWZmEiYKD2J1ZmZfZXhwaXJl'
    'c19hdBgHIAEoA1INYnVmZkV4cGlyZXNBdA==');

@$core.Deprecated('Use searchClanRequestDescriptor instead')
const SearchClanRequest$json = {
  '1': 'SearchClanRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `SearchClanRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchClanRequestDescriptor = $convert
    .base64Decode('ChFTZWFyY2hDbGFuUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');

@$core.Deprecated('Use searchClanResponseDescriptor instead')
const SearchClanResponse$json = {
  '1': 'SearchClanResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'clan_id', '3': 2, '4': 1, '5': 5, '10': 'clanId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'leader_name', '3': 4, '4': 1, '5': 9, '10': 'leaderName'},
    {'1': 'member_count', '3': 5, '4': 1, '5': 5, '10': 'memberCount'},
    {'1': 'total_levels', '3': 6, '4': 1, '5': 3, '10': 'totalLevels'},
  ],
};

/// Descriptor for `SearchClanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchClanResponseDescriptor = $convert.base64Decode(
    'ChJTZWFyY2hDbGFuUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIXCgdjbGFuX2'
    'lkGAIgASgFUgZjbGFuSWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIfCgtsZWFkZXJfbmFtZRgEIAEo'
    'CVIKbGVhZGVyTmFtZRIhCgxtZW1iZXJfY291bnQYBSABKAVSC21lbWJlckNvdW50EiEKDHRvdG'
    'FsX2xldmVscxgGIAEoA1ILdG90YWxMZXZlbHM=');

@$core.Deprecated('Use getClanLeaderboardRequestDescriptor instead')
const GetClanLeaderboardRequest$json = {
  '1': 'GetClanLeaderboardRequest',
};

/// Descriptor for `GetClanLeaderboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClanLeaderboardRequestDescriptor =
    $convert.base64Decode('ChlHZXRDbGFuTGVhZGVyYm9hcmRSZXF1ZXN0');

@$core.Deprecated('Use clanEntryDescriptor instead')
const ClanEntry$json = {
  '1': 'ClanEntry',
  '2': [
    {'1': 'clan_id', '3': 1, '4': 1, '5': 5, '10': 'clanId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'member_count', '3': 3, '4': 1, '5': 5, '10': 'memberCount'},
    {'1': 'total_levels', '3': 4, '4': 1, '5': 3, '10': 'totalLevels'},
  ],
};

/// Descriptor for `ClanEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clanEntryDescriptor = $convert.base64Decode(
    'CglDbGFuRW50cnkSFwoHY2xhbl9pZBgBIAEoBVIGY2xhbklkEhIKBG5hbWUYAiABKAlSBG5hbW'
    'USIQoMbWVtYmVyX2NvdW50GAMgASgFUgttZW1iZXJDb3VudBIhCgx0b3RhbF9sZXZlbHMYBCAB'
    'KANSC3RvdGFsTGV2ZWxz');

@$core.Deprecated('Use getClanLeaderboardResponseDescriptor instead')
const GetClanLeaderboardResponse$json = {
  '1': 'GetClanLeaderboardResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'clans',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.city.ClanEntry',
      '10': 'clans'
    },
  ],
};

/// Descriptor for `GetClanLeaderboardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClanLeaderboardResponseDescriptor =
    $convert.base64Decode(
        'ChpHZXRDbGFuTGVhZGVyYm9hcmRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEi'
        'UKBWNsYW5zGAIgAygLMg8uY2l0eS5DbGFuRW50cnlSBWNsYW5z');

@$core.Deprecated('Use createCoopGroupRequestDescriptor instead')
const CreateCoopGroupRequest$json = {
  '1': 'CreateCoopGroupRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `CreateCoopGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCoopGroupRequestDescriptor =
    $convert.base64Decode(
        'ChZDcmVhdGVDb29wR3JvdXBSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdG'
        'VySWQ=');

@$core.Deprecated('Use createCoopGroupResponseDescriptor instead')
const CreateCoopGroupResponse$json = {
  '1': 'CreateCoopGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'group_id', '3': 3, '4': 1, '5': 5, '10': 'groupId'},
  ],
};

/// Descriptor for `CreateCoopGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCoopGroupResponseDescriptor =
    $convert.base64Decode(
        'ChdDcmVhdGVDb29wR3JvdXBSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB2'
        '1lc3NhZ2UYAiABKAlSB21lc3NhZ2USGQoIZ3JvdXBfaWQYAyABKAVSB2dyb3VwSWQ=');

@$core.Deprecated('Use joinCoopGroupRequestDescriptor instead')
const JoinCoopGroupRequest$json = {
  '1': 'JoinCoopGroupRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'leader_id', '3': 2, '4': 1, '5': 5, '10': 'leaderId'},
  ],
};

/// Descriptor for `JoinCoopGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinCoopGroupRequestDescriptor = $convert.base64Decode(
    'ChRKb2luQ29vcEdyb3VwUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlck'
    'lkEhsKCWxlYWRlcl9pZBgCIAEoBVIIbGVhZGVySWQ=');

@$core.Deprecated('Use joinCoopGroupResponseDescriptor instead')
const JoinCoopGroupResponse$json = {
  '1': 'JoinCoopGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `JoinCoopGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinCoopGroupResponseDescriptor = $convert.base64Decode(
    'ChVKb2luQ29vcEdyb3VwUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZX'
    'NzYWdlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use leaveCoopGroupRequestDescriptor instead')
const LeaveCoopGroupRequest$json = {
  '1': 'LeaveCoopGroupRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `LeaveCoopGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveCoopGroupRequestDescriptor = $convert.base64Decode(
    'ChVMZWF2ZUNvb3BHcm91cFJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZX'
    'JJZA==');

@$core.Deprecated('Use leaveCoopGroupResponseDescriptor instead')
const LeaveCoopGroupResponse$json = {
  '1': 'LeaveCoopGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `LeaveCoopGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveCoopGroupResponseDescriptor =
    $convert.base64Decode(
        'ChZMZWF2ZUNvb3BHcm91cFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbW'
        'Vzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use coopMemberDescriptor instead')
const CoopMember$json = {
  '1': 'CoopMember',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'level', '3': 3, '4': 1, '5': 5, '10': 'level'},
    {'1': 'is_ready', '3': 4, '4': 1, '5': 8, '10': 'isReady'},
  ],
};

/// Descriptor for `CoopMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coopMemberDescriptor = $convert.base64Decode(
    'CgpDb29wTWVtYmVyEiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySWQSEgoEbmFtZR'
    'gCIAEoCVIEbmFtZRIUCgVsZXZlbBgDIAEoBVIFbGV2ZWwSGQoIaXNfcmVhZHkYBCABKAhSB2lz'
    'UmVhZHk=');

@$core.Deprecated('Use getCoopGroupRequestDescriptor instead')
const GetCoopGroupRequest$json = {
  '1': 'GetCoopGroupRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetCoopGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCoopGroupRequestDescriptor = $convert.base64Decode(
    'ChNHZXRDb29wR3JvdXBSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySW'
    'Q=');

@$core.Deprecated('Use getCoopGroupResponseDescriptor instead')
const GetCoopGroupResponse$json = {
  '1': 'GetCoopGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'in_group', '3': 2, '4': 1, '5': 8, '10': 'inGroup'},
    {'1': 'group_id', '3': 3, '4': 1, '5': 5, '10': 'groupId'},
    {'1': 'leader_id', '3': 4, '4': 1, '5': 5, '10': 'leaderId'},
    {
      '1': 'members',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.city.CoopMember',
      '10': 'members'
    },
  ],
};

/// Descriptor for `GetCoopGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCoopGroupResponseDescriptor = $convert.base64Decode(
    'ChRHZXRDb29wR3JvdXBSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhkKCGluX2'
    'dyb3VwGAIgASgIUgdpbkdyb3VwEhkKCGdyb3VwX2lkGAMgASgFUgdncm91cElkEhsKCWxlYWRl'
    'cl9pZBgEIAEoBVIIbGVhZGVySWQSKgoHbWVtYmVycxgFIAMoCzIQLmNpdHkuQ29vcE1lbWJlcl'
    'IHbWVtYmVycw==');

@$core.Deprecated('Use setReadyRequestDescriptor instead')
const SetReadyRequest$json = {
  '1': 'SetReadyRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'is_ready', '3': 2, '4': 1, '5': 8, '10': 'isReady'},
  ],
};

/// Descriptor for `SetReadyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setReadyRequestDescriptor = $convert.base64Decode(
    'Cg9TZXRSZWFkeVJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZXJJZBIZCg'
    'hpc19yZWFkeRgCIAEoCFIHaXNSZWFkeQ==');

@$core.Deprecated('Use setReadyResponseDescriptor instead')
const SetReadyResponse$json = {
  '1': 'SetReadyResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SetReadyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setReadyResponseDescriptor = $convert.base64Decode(
    'ChBTZXRSZWFkeVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use depositClanGoldRequestDescriptor instead')
const DepositClanGoldRequest$json = {
  '1': 'DepositClanGoldRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `DepositClanGoldRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositClanGoldRequestDescriptor =
    $convert.base64Decode(
        'ChZEZXBvc2l0Q2xhbkdvbGRSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdG'
        'VySWQSFgoGYW1vdW50GAIgASgDUgZhbW91bnQ=');

@$core.Deprecated('Use depositClanGoldResponseDescriptor instead')
const DepositClanGoldResponse$json = {
  '1': 'DepositClanGoldResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DepositClanGoldResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositClanGoldResponseDescriptor =
    $convert.base64Decode(
        'ChdEZXBvc2l0Q2xhbkdvbGRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB2'
        '1lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use buyClanBuffRequestDescriptor instead')
const BuyClanBuffRequest$json = {
  '1': 'BuyClanBuffRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'buff_code', '3': 2, '4': 1, '5': 9, '10': 'buffCode'},
  ],
};

/// Descriptor for `BuyClanBuffRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyClanBuffRequestDescriptor = $convert.base64Decode(
    'ChJCdXlDbGFuQnVmZlJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZXJJZB'
    'IbCglidWZmX2NvZGUYAiABKAlSCGJ1ZmZDb2Rl');

@$core.Deprecated('Use buyClanBuffResponseDescriptor instead')
const BuyClanBuffResponse$json = {
  '1': 'BuyClanBuffResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `BuyClanBuffResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyClanBuffResponseDescriptor = $convert.base64Decode(
    'ChNCdXlDbGFuQnVmZlJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getPlayerProfileRequestDescriptor instead')
const GetPlayerProfileRequest$json = {
  '1': 'GetPlayerProfileRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetPlayerProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayerProfileRequestDescriptor =
    $convert.base64Decode(
        'ChdHZXRQbGF5ZXJQcm9maWxlUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3'
        'Rlcklk');

@$core.Deprecated('Use getPlayerProfileResponseDescriptor instead')
const GetPlayerProfileResponse$json = {
  '1': 'GetPlayerProfileResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'character_id', '3': 2, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'level', '3': 4, '4': 1, '5': 5, '10': 'level'},
    {'1': 'class_type', '3': 5, '4': 1, '5': 9, '10': 'classType'},
    {'1': 'clan_id', '3': 6, '4': 1, '5': 5, '10': 'clanId'},
    {'1': 'clan_name', '3': 7, '4': 1, '5': 9, '10': 'clanName'},
    {'1': 'strength', '3': 8, '4': 1, '5': 5, '10': 'strength'},
    {'1': 'dexterity', '3': 9, '4': 1, '5': 5, '10': 'dexterity'},
    {'1': 'intelligence', '3': 10, '4': 1, '5': 5, '10': 'intelligence'},
    {'1': 'luck', '3': 11, '4': 1, '5': 5, '10': 'luck'},
    {
      '1': 'equipped_items',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.city.PlayerEquipItem',
      '10': 'equippedItems'
    },
  ],
};

/// Descriptor for `GetPlayerProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayerProfileResponseDescriptor = $convert.base64Decode(
    'ChhHZXRQbGF5ZXJQcm9maWxlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCg'
    'xjaGFyYWN0ZXJfaWQYAiABKAVSC2NoYXJhY3RlcklkEhIKBG5hbWUYAyABKAlSBG5hbWUSFAoF'
    'bGV2ZWwYBCABKAVSBWxldmVsEh0KCmNsYXNzX3R5cGUYBSABKAlSCWNsYXNzVHlwZRIXCgdjbG'
    'FuX2lkGAYgASgFUgZjbGFuSWQSGwoJY2xhbl9uYW1lGAcgASgJUghjbGFuTmFtZRIaCghzdHJl'
    'bmd0aBgIIAEoBVIIc3RyZW5ndGgSHAoJZGV4dGVyaXR5GAkgASgFUglkZXh0ZXJpdHkSIgoMaW'
    '50ZWxsaWdlbmNlGAogASgFUgxpbnRlbGxpZ2VuY2USEgoEbHVjaxgLIAEoBVIEbHVjaxI8Cg5l'
    'cXVpcHBlZF9pdGVtcxgMIAMoCzIVLmNpdHkuUGxheWVyRXF1aXBJdGVtUg1lcXVpcHBlZEl0ZW'
    '1z');

@$core.Deprecated('Use playerEquipItemDescriptor instead')
const PlayerEquipItem$json = {
  '1': 'PlayerEquipItem',
  '2': [
    {'1': 'slot', '3': 1, '4': 1, '5': 9, '10': 'slot'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'attack', '3': 3, '4': 1, '5': 5, '10': 'attack'},
    {'1': 'defense', '3': 4, '4': 1, '5': 5, '10': 'defense'},
    {'1': 'luck', '3': 5, '4': 1, '5': 5, '10': 'luck'},
  ],
};

/// Descriptor for `PlayerEquipItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerEquipItemDescriptor = $convert.base64Decode(
    'Cg9QbGF5ZXJFcXVpcEl0ZW0SEgoEc2xvdBgBIAEoCVIEc2xvdBISCgRuYW1lGAIgASgJUgRuYW'
    '1lEhYKBmF0dGFjaxgDIAEoBVIGYXR0YWNrEhgKB2RlZmVuc2UYBCABKAVSB2RlZmVuc2USEgoE'
    'bHVjaxgFIAEoBVIEbHVjaw==');

@$core.Deprecated('Use findRaidTargetRequestDescriptor instead')
const FindRaidTargetRequest$json = {
  '1': 'FindRaidTargetRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `FindRaidTargetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findRaidTargetRequestDescriptor = $convert.base64Decode(
    'ChVGaW5kUmFpZFRhcmdldFJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZX'
    'JJZA==');

@$core.Deprecated('Use findRaidTargetResponseDescriptor instead')
const FindRaidTargetResponse$json = {
  '1': 'FindRaidTargetResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'target_id', '3': 2, '4': 1, '5': 5, '10': 'targetId'},
    {'1': 'target_name', '3': 3, '4': 1, '5': 9, '10': 'targetName'},
    {'1': 'target_level', '3': 4, '4': 1, '5': 5, '10': 'targetLevel'},
    {'1': 'target_wall_level', '3': 5, '4': 1, '5': 5, '10': 'targetWallLevel'},
    {'1': 'target_gold', '3': 6, '4': 1, '5': 3, '10': 'targetGold'},
  ],
};

/// Descriptor for `FindRaidTargetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findRaidTargetResponseDescriptor = $convert.base64Decode(
    'ChZGaW5kUmFpZFRhcmdldFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGwoJdG'
    'FyZ2V0X2lkGAIgASgFUgh0YXJnZXRJZBIfCgt0YXJnZXRfbmFtZRgDIAEoCVIKdGFyZ2V0TmFt'
    'ZRIhCgx0YXJnZXRfbGV2ZWwYBCABKAVSC3RhcmdldExldmVsEioKEXRhcmdldF93YWxsX2xldm'
    'VsGAUgASgFUg90YXJnZXRXYWxsTGV2ZWwSHwoLdGFyZ2V0X2dvbGQYBiABKANSCnRhcmdldEdv'
    'bGQ=');

@$core.Deprecated('Use attackPlayerRequestDescriptor instead')
const AttackPlayerRequest$json = {
  '1': 'AttackPlayerRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'target_id', '3': 2, '4': 1, '5': 5, '10': 'targetId'},
  ],
};

/// Descriptor for `AttackPlayerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attackPlayerRequestDescriptor = $convert.base64Decode(
    'ChNBdHRhY2tQbGF5ZXJSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySW'
    'QSGwoJdGFyZ2V0X2lkGAIgASgFUgh0YXJnZXRJZA==');

@$core.Deprecated('Use attackPlayerResponseDescriptor instead')
const AttackPlayerResponse$json = {
  '1': 'AttackPlayerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'victory', '3': 3, '4': 1, '5': 8, '10': 'victory'},
    {'1': 'gold_stolen', '3': 4, '4': 1, '5': 3, '10': 'goldStolen'},
    {'1': 'my_wall_level', '3': 5, '4': 1, '5': 5, '10': 'myWallLevel'},
    {'1': 'enemy_wall_level', '3': 6, '4': 1, '5': 5, '10': 'enemyWallLevel'},
  ],
};

/// Descriptor for `AttackPlayerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attackPlayerResponseDescriptor = $convert.base64Decode(
    'ChRBdHRhY2tQbGF5ZXJSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2USGAoHdmljdG9yeRgDIAEoCFIHdmljdG9yeRIfCgtnb2xkX3N0'
    'b2xlbhgEIAEoA1IKZ29sZFN0b2xlbhIiCg1teV93YWxsX2xldmVsGAUgASgFUgtteVdhbGxMZX'
    'ZlbBIoChBlbmVteV93YWxsX2xldmVsGAYgASgFUg5lbmVteVdhbGxMZXZlbA==');

@$core.Deprecated('Use getAchievementsRequestDescriptor instead')
const GetAchievementsRequest$json = {
  '1': 'GetAchievementsRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetAchievementsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAchievementsRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRBY2hpZXZlbWVudHNSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdG'
        'VySWQ=');

@$core.Deprecated('Use getAchievementsResponseDescriptor instead')
const GetAchievementsResponse$json = {
  '1': 'GetAchievementsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'achievements',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.city.AchievementEntry',
      '10': 'achievements'
    },
  ],
};

/// Descriptor for `GetAchievementsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAchievementsResponseDescriptor = $convert.base64Decode(
    'ChdHZXRBY2hpZXZlbWVudHNSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEjoKDG'
    'FjaGlldmVtZW50cxgCIAMoCzIWLmNpdHkuQWNoaWV2ZW1lbnRFbnRyeVIMYWNoaWV2ZW1lbnRz');

@$core.Deprecated('Use achievementEntryDescriptor instead')
const AchievementEntry$json = {
  '1': 'AchievementEntry',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'tier', '3': 4, '4': 1, '5': 5, '10': 'tier'},
    {'1': 'is_completed', '3': 5, '4': 1, '5': 8, '10': 'isCompleted'},
  ],
};

/// Descriptor for `AchievementEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List achievementEntryDescriptor = $convert.base64Decode(
    'ChBBY2hpZXZlbWVudEVudHJ5EhIKBGNvZGUYASABKAlSBGNvZGUSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SEgoEdGllchgEIAEoBVIEdGll'
    'chIhCgxpc19jb21wbGV0ZWQYBSABKAhSC2lzQ29tcGxldGVk');

@$core.Deprecated('Use cheatGiveAllRequestDescriptor instead')
const CheatGiveAllRequest$json = {
  '1': 'CheatGiveAllRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'level', '3': 2, '4': 1, '5': 5, '10': 'level'},
    {'1': 'gold', '3': 3, '4': 1, '5': 3, '10': 'gold'},
  ],
};

/// Descriptor for `CheatGiveAllRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cheatGiveAllRequestDescriptor = $convert.base64Decode(
    'ChNDaGVhdEdpdmVBbGxSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySW'
    'QSFAoFbGV2ZWwYAiABKAVSBWxldmVsEhIKBGdvbGQYAyABKANSBGdvbGQ=');

@$core.Deprecated('Use cheatGiveAllResponseDescriptor instead')
const CheatGiveAllResponse$json = {
  '1': 'CheatGiveAllResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CheatGiveAllResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cheatGiveAllResponseDescriptor = $convert.base64Decode(
    'ChRDaGVhdEdpdmVBbGxSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2U=');
