// This is a generated file - do not edit.
//
// Generated from character.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'character.pb.dart' as $0;

export 'character.pb.dart';

@$pb.GrpcServiceName('character.CharacterService')
class CharacterServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CharacterServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AuthResponse> createCharacter(
    $0.CreateCharacterRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createCharacter, request, options: options);
  }

  $grpc.ResponseFuture<$0.CharacterResponse> getCharacterById(
    $0.CharacterRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCharacterById, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTalentsResponse> getTalents(
    $0.GetTalentsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTalents, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpgradeTalentResponse> upgradeTalent(
    $0.UpgradeTalentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$upgradeTalent, request, options: options);
  }

  $grpc.ResponseFuture<$0.CompleteTutorialResponse> completeTutorial(
    $0.CompleteTutorialRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$completeTutorial, request, options: options);
  }

  // method descriptors

  static final _$createCharacter =
      $grpc.ClientMethod<$0.CreateCharacterRequest, $0.AuthResponse>(
          '/character.CharacterService/CreateCharacter',
          ($0.CreateCharacterRequest value) => value.writeToBuffer(),
          $0.AuthResponse.fromBuffer);
  static final _$getCharacterById =
      $grpc.ClientMethod<$0.CharacterRequest, $0.CharacterResponse>(
          '/character.CharacterService/GetCharacterById',
          ($0.CharacterRequest value) => value.writeToBuffer(),
          $0.CharacterResponse.fromBuffer);
  static final _$getTalents =
      $grpc.ClientMethod<$0.GetTalentsRequest, $0.GetTalentsResponse>(
          '/character.CharacterService/GetTalents',
          ($0.GetTalentsRequest value) => value.writeToBuffer(),
          $0.GetTalentsResponse.fromBuffer);
  static final _$upgradeTalent =
      $grpc.ClientMethod<$0.UpgradeTalentRequest, $0.UpgradeTalentResponse>(
          '/character.CharacterService/UpgradeTalent',
          ($0.UpgradeTalentRequest value) => value.writeToBuffer(),
          $0.UpgradeTalentResponse.fromBuffer);
  static final _$completeTutorial = $grpc.ClientMethod<
          $0.CompleteTutorialRequest, $0.CompleteTutorialResponse>(
      '/character.CharacterService/CompleteTutorial',
      ($0.CompleteTutorialRequest value) => value.writeToBuffer(),
      $0.CompleteTutorialResponse.fromBuffer);
}

@$pb.GrpcServiceName('character.CharacterService')
abstract class CharacterServiceBase extends $grpc.Service {
  $core.String get $name => 'character.CharacterService';

  CharacterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateCharacterRequest, $0.AuthResponse>(
        'CreateCharacter',
        createCharacter_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateCharacterRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CharacterRequest, $0.CharacterResponse>(
        'GetCharacterById',
        getCharacterById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CharacterRequest.fromBuffer(value),
        ($0.CharacterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTalentsRequest, $0.GetTalentsResponse>(
        'GetTalents',
        getTalents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTalentsRequest.fromBuffer(value),
        ($0.GetTalentsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpgradeTalentRequest, $0.UpgradeTalentResponse>(
            'UpgradeTalent',
            upgradeTalent_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpgradeTalentRequest.fromBuffer(value),
            ($0.UpgradeTalentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompleteTutorialRequest,
            $0.CompleteTutorialResponse>(
        'CompleteTutorial',
        completeTutorial_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CompleteTutorialRequest.fromBuffer(value),
        ($0.CompleteTutorialResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthResponse> createCharacter_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateCharacterRequest> $request) async {
    return createCharacter($call, await $request);
  }

  $async.Future<$0.AuthResponse> createCharacter(
      $grpc.ServiceCall call, $0.CreateCharacterRequest request);

  $async.Future<$0.CharacterResponse> getCharacterById_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CharacterRequest> $request) async {
    return getCharacterById($call, await $request);
  }

  $async.Future<$0.CharacterResponse> getCharacterById(
      $grpc.ServiceCall call, $0.CharacterRequest request);

  $async.Future<$0.GetTalentsResponse> getTalents_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetTalentsRequest> $request) async {
    return getTalents($call, await $request);
  }

  $async.Future<$0.GetTalentsResponse> getTalents(
      $grpc.ServiceCall call, $0.GetTalentsRequest request);

  $async.Future<$0.UpgradeTalentResponse> upgradeTalent_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpgradeTalentRequest> $request) async {
    return upgradeTalent($call, await $request);
  }

  $async.Future<$0.UpgradeTalentResponse> upgradeTalent(
      $grpc.ServiceCall call, $0.UpgradeTalentRequest request);

  $async.Future<$0.CompleteTutorialResponse> completeTutorial_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CompleteTutorialRequest> $request) async {
    return completeTutorial($call, await $request);
  }

  $async.Future<$0.CompleteTutorialResponse> completeTutorial(
      $grpc.ServiceCall call, $0.CompleteTutorialRequest request);
}
