// This is a generated file - do not edit.
//
// Generated from craft.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getRecipesRequestDescriptor instead')
const GetRecipesRequest$json = {
  '1': 'GetRecipesRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetRecipesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecipesRequestDescriptor = $convert.base64Decode(
    'ChFHZXRSZWNpcGVzUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3Rlcklk');

@$core.Deprecated('Use getRecipesResponseDescriptor instead')
const GetRecipesResponse$json = {
  '1': 'GetRecipesResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'recipes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.craft.Recipe',
      '10': 'recipes'
    },
  ],
};

/// Descriptor for `GetRecipesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecipesResponseDescriptor = $convert.base64Decode(
    'ChJHZXRSZWNpcGVzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYW'
    'dlGAIgASgJUgdtZXNzYWdlEicKB3JlY2lwZXMYAyADKAsyDS5jcmFmdC5SZWNpcGVSB3JlY2lw'
    'ZXM=');

@$core.Deprecated('Use recipeDescriptor instead')
const Recipe$json = {
  '1': 'Recipe',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'result_code', '3': 3, '4': 1, '5': 9, '10': 'resultCode'},
    {'1': 'result_name', '3': 4, '4': 1, '5': 9, '10': 'resultName'},
    {'1': 'result_quantity', '3': 5, '4': 1, '5': 5, '10': 'resultQuantity'},
    {
      '1': 'ingredients',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.craft.Ingredient',
      '10': 'ingredients'
    },
    {'1': 'can_craft', '3': 7, '4': 1, '5': 8, '10': 'canCraft'},
    {'1': 'result_slot', '3': 8, '4': 1, '5': 9, '10': 'resultSlot'},
    {'1': 'result_attack', '3': 9, '4': 1, '5': 5, '10': 'resultAttack'},
    {'1': 'result_defense', '3': 10, '4': 1, '5': 5, '10': 'resultDefense'},
    {'1': 'result_luck', '3': 11, '4': 1, '5': 5, '10': 'resultLuck'},
    {'1': 'gold_cost', '3': 12, '4': 1, '5': 3, '10': 'goldCost'},
  ],
};

/// Descriptor for `Recipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recipeDescriptor = $convert.base64Decode(
    'CgZSZWNpcGUSDgoCaWQYASABKAVSAmlkEhIKBGNvZGUYAiABKAlSBGNvZGUSHwoLcmVzdWx0X2'
    'NvZGUYAyABKAlSCnJlc3VsdENvZGUSHwoLcmVzdWx0X25hbWUYBCABKAlSCnJlc3VsdE5hbWUS'
    'JwoPcmVzdWx0X3F1YW50aXR5GAUgASgFUg5yZXN1bHRRdWFudGl0eRIzCgtpbmdyZWRpZW50cx'
    'gGIAMoCzIRLmNyYWZ0LkluZ3JlZGllbnRSC2luZ3JlZGllbnRzEhsKCWNhbl9jcmFmdBgHIAEo'
    'CFIIY2FuQ3JhZnQSHwoLcmVzdWx0X3Nsb3QYCCABKAlSCnJlc3VsdFNsb3QSIwoNcmVzdWx0X2'
    'F0dGFjaxgJIAEoBVIMcmVzdWx0QXR0YWNrEiUKDnJlc3VsdF9kZWZlbnNlGAogASgFUg1yZXN1'
    'bHREZWZlbnNlEh8KC3Jlc3VsdF9sdWNrGAsgASgFUgpyZXN1bHRMdWNrEhsKCWdvbGRfY29zdB'
    'gMIAEoA1IIZ29sZENvc3Q=');

@$core.Deprecated('Use ingredientDescriptor instead')
const Ingredient$json = {
  '1': 'Ingredient',
  '2': [
    {'1': 'resource_type', '3': 1, '4': 1, '5': 9, '10': 'resourceType'},
    {'1': 'amount', '3': 2, '4': 1, '5': 5, '10': 'amount'},
    {'1': 'available', '3': 3, '4': 1, '5': 3, '10': 'available'},
  ],
};

/// Descriptor for `Ingredient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingredientDescriptor = $convert.base64Decode(
    'CgpJbmdyZWRpZW50EiMKDXJlc291cmNlX3R5cGUYASABKAlSDHJlc291cmNlVHlwZRIWCgZhbW'
    '91bnQYAiABKAVSBmFtb3VudBIcCglhdmFpbGFibGUYAyABKANSCWF2YWlsYWJsZQ==');

@$core.Deprecated('Use craftItemRequestDescriptor instead')
const CraftItemRequest$json = {
  '1': 'CraftItemRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'recipe_id', '3': 2, '4': 1, '5': 5, '10': 'recipeId'},
    {'1': 'amount', '3': 3, '4': 1, '5': 5, '10': 'amount'},
  ],
};

/// Descriptor for `CraftItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List craftItemRequestDescriptor = $convert.base64Decode(
    'ChBDcmFmdEl0ZW1SZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySWQSGw'
    'oJcmVjaXBlX2lkGAIgASgFUghyZWNpcGVJZBIWCgZhbW91bnQYAyABKAVSBmFtb3VudA==');

@$core.Deprecated('Use craftItemResponseDescriptor instead')
const CraftItemResponse$json = {
  '1': 'CraftItemResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CraftItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List craftItemResponseDescriptor = $convert.base64Decode(
    'ChFDcmFmdEl0ZW1SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2'
    'UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use getSalvageableItemsRequestDescriptor instead')
const GetSalvageableItemsRequest$json = {
  '1': 'GetSalvageableItemsRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetSalvageableItemsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSalvageableItemsRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRTYWx2YWdlYWJsZUl0ZW1zUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYX'
        'JhY3Rlcklk');

@$core.Deprecated('Use getSalvageableItemsResponseDescriptor instead')
const GetSalvageableItemsResponse$json = {
  '1': 'GetSalvageableItemsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'items',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.craft.SalvageableItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `GetSalvageableItemsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSalvageableItemsResponseDescriptor =
    $convert.base64Decode(
        'ChtHZXRTYWx2YWdlYWJsZUl0ZW1zUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcx'
        'IYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEiwKBWl0ZW1zGAMgAygLMhYuY3JhZnQuU2FsdmFn'
        'ZWFibGVJdGVtUgVpdGVtcw==');

@$core.Deprecated('Use salvageableItemDescriptor instead')
const SalvageableItem$json = {
  '1': 'SalvageableItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'slot', '3': 4, '4': 1, '5': 9, '10': 'slot'},
    {'1': 'tier', '3': 5, '4': 1, '5': 5, '10': 'tier'},
    {
      '1': 'preview',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.craft.SalvageResult',
      '10': 'preview'
    },
  ],
};

/// Descriptor for `SalvageableItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salvageableItemDescriptor = $convert.base64Decode(
    'Cg9TYWx2YWdlYWJsZUl0ZW0SDgoCaWQYASABKAVSAmlkEhIKBGNvZGUYAiABKAlSBGNvZGUSEg'
    'oEbmFtZRgDIAEoCVIEbmFtZRISCgRzbG90GAQgASgJUgRzbG90EhIKBHRpZXIYBSABKAVSBHRp'
    'ZXISLgoHcHJldmlldxgGIAMoCzIULmNyYWZ0LlNhbHZhZ2VSZXN1bHRSB3ByZXZpZXc=');

@$core.Deprecated('Use salvageItemRequestDescriptor instead')
const SalvageItemRequest$json = {
  '1': 'SalvageItemRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'item_id', '3': 2, '4': 1, '5': 5, '10': 'itemId'},
  ],
};

/// Descriptor for `SalvageItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salvageItemRequestDescriptor = $convert.base64Decode(
    'ChJTYWx2YWdlSXRlbVJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZXJJZB'
    'IXCgdpdGVtX2lkGAIgASgFUgZpdGVtSWQ=');

@$core.Deprecated('Use salvageItemResponseDescriptor instead')
const SalvageItemResponse$json = {
  '1': 'SalvageItemResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'results',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.craft.SalvageResult',
      '10': 'results'
    },
  ],
};

/// Descriptor for `SalvageItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salvageItemResponseDescriptor = $convert.base64Decode(
    'ChNTYWx2YWdlSXRlbVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZRIuCgdyZXN1bHRzGAMgAygLMhQuY3JhZnQuU2FsdmFnZVJlc3Vs'
    'dFIHcmVzdWx0cw==');

@$core.Deprecated('Use salvageResultDescriptor instead')
const SalvageResult$json = {
  '1': 'SalvageResult',
  '2': [
    {'1': 'resource_type', '3': 1, '4': 1, '5': 9, '10': 'resourceType'},
    {'1': 'amount', '3': 2, '4': 1, '5': 5, '10': 'amount'},
  ],
};

/// Descriptor for `SalvageResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salvageResultDescriptor = $convert.base64Decode(
    'Cg1TYWx2YWdlUmVzdWx0EiMKDXJlc291cmNlX3R5cGUYASABKAlSDHJlc291cmNlVHlwZRIWCg'
    'ZhbW91bnQYAiABKAVSBmFtb3VudA==');
