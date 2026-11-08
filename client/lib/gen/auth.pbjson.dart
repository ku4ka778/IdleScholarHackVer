// This is a generated file - do not edit.
//
// Generated from auth.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3'
    'JkGAIgASgJUghwYXNzd29yZBIUCgVlbWFpbBgDIAEoCVIFZW1haWw=');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGA'
    'IgASgJUghwYXNzd29yZA==');

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
