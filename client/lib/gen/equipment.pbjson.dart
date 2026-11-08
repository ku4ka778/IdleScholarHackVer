// This is a generated file - do not edit.
//
// Generated from equipment.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getEquipmentRequestDescriptor instead')
const GetEquipmentRequest$json = {
  '1': 'GetEquipmentRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
  ],
};

/// Descriptor for `GetEquipmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEquipmentRequestDescriptor = $convert.base64Decode(
    'ChNHZXRFcXVpcG1lbnRSZXF1ZXN0EiEKDGNoYXJhY3Rlcl9pZBgBIAEoBVILY2hhcmFjdGVySW'
    'Q=');

@$core.Deprecated('Use getEquipmentResponseDescriptor instead')
const GetEquipmentResponse$json = {
  '1': 'GetEquipmentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'items',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.equipment.EquipmentItem',
      '10': 'items'
    },
    {'1': 'total_attack', '3': 4, '4': 1, '5': 5, '10': 'totalAttack'},
    {'1': 'total_defense', '3': 5, '4': 1, '5': 5, '10': 'totalDefense'},
    {'1': 'total_luck', '3': 6, '4': 1, '5': 5, '10': 'totalLuck'},
  ],
};

/// Descriptor for `GetEquipmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEquipmentResponseDescriptor = $convert.base64Decode(
    'ChRHZXRFcXVpcG1lbnRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2USLgoFaXRlbXMYAyADKAsyGC5lcXVpcG1lbnQuRXF1aXBtZW50'
    'SXRlbVIFaXRlbXMSIQoMdG90YWxfYXR0YWNrGAQgASgFUgt0b3RhbEF0dGFjaxIjCg10b3RhbF'
    '9kZWZlbnNlGAUgASgFUgx0b3RhbERlZmVuc2USHQoKdG90YWxfbHVjaxgGIAEoBVIJdG90YWxM'
    'dWNr');

@$core.Deprecated('Use equipmentItemDescriptor instead')
const EquipmentItem$json = {
  '1': 'EquipmentItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'slot', '3': 4, '4': 1, '5': 9, '10': 'slot'},
    {'1': 'attack', '3': 5, '4': 1, '5': 5, '10': 'attack'},
    {'1': 'defense', '3': 6, '4': 1, '5': 5, '10': 'defense'},
    {'1': 'luck', '3': 7, '4': 1, '5': 5, '10': 'luck'},
    {'1': 'equipped', '3': 8, '4': 1, '5': 8, '10': 'equipped'},
  ],
};

/// Descriptor for `EquipmentItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List equipmentItemDescriptor = $convert.base64Decode(
    'Cg1FcXVpcG1lbnRJdGVtEg4KAmlkGAEgASgFUgJpZBISCgRjb2RlGAIgASgJUgRjb2RlEhIKBG'
    '5hbWUYAyABKAlSBG5hbWUSEgoEc2xvdBgEIAEoCVIEc2xvdBIWCgZhdHRhY2sYBSABKAVSBmF0'
    'dGFjaxIYCgdkZWZlbnNlGAYgASgFUgdkZWZlbnNlEhIKBGx1Y2sYByABKAVSBGx1Y2sSGgoIZX'
    'F1aXBwZWQYCCABKAhSCGVxdWlwcGVk');

@$core.Deprecated('Use equipRequestDescriptor instead')
const EquipRequest$json = {
  '1': 'EquipRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'item_id', '3': 2, '4': 1, '5': 5, '10': 'itemId'},
  ],
};

/// Descriptor for `EquipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List equipRequestDescriptor = $convert.base64Decode(
    'CgxFcXVpcFJlcXVlc3QSIQoMY2hhcmFjdGVyX2lkGAEgASgFUgtjaGFyYWN0ZXJJZBIXCgdpdG'
    'VtX2lkGAIgASgFUgZpdGVtSWQ=');

@$core.Deprecated('Use equipResponseDescriptor instead')
const EquipResponse$json = {
  '1': 'EquipResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `EquipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List equipResponseDescriptor = $convert.base64Decode(
    'Cg1FcXVpcFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZRgCIA'
    'EoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use unequipRequestDescriptor instead')
const UnequipRequest$json = {
  '1': 'UnequipRequest',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 5, '10': 'characterId'},
    {'1': 'item_id', '3': 2, '4': 1, '5': 5, '10': 'itemId'},
  ],
};

/// Descriptor for `UnequipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unequipRequestDescriptor = $convert.base64Decode(
    'Cg5VbmVxdWlwUmVxdWVzdBIhCgxjaGFyYWN0ZXJfaWQYASABKAVSC2NoYXJhY3RlcklkEhcKB2'
    'l0ZW1faWQYAiABKAVSBml0ZW1JZA==');

@$core.Deprecated('Use unequipResponseDescriptor instead')
const UnequipResponse$json = {
  '1': 'UnequipResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UnequipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unequipResponseDescriptor = $convert.base64Decode(
    'Cg9VbmVxdWlwUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGA'
    'IgASgJUgdtZXNzYWdl');
