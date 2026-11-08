// This is a generated file - do not edit.
//
// Generated from equipment.proto.

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

import 'equipment.pb.dart' as $0;

export 'equipment.pb.dart';

@$pb.GrpcServiceName('equipment.EquipmentService')
class EquipmentServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  EquipmentServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetEquipmentResponse> getEquipment(
    $0.GetEquipmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getEquipment, request, options: options);
  }

  $grpc.ResponseFuture<$0.EquipResponse> equip(
    $0.EquipRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$equip, request, options: options);
  }

  $grpc.ResponseFuture<$0.UnequipResponse> unequip(
    $0.UnequipRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unequip, request, options: options);
  }

  // method descriptors

  static final _$getEquipment =
      $grpc.ClientMethod<$0.GetEquipmentRequest, $0.GetEquipmentResponse>(
          '/equipment.EquipmentService/GetEquipment',
          ($0.GetEquipmentRequest value) => value.writeToBuffer(),
          $0.GetEquipmentResponse.fromBuffer);
  static final _$equip = $grpc.ClientMethod<$0.EquipRequest, $0.EquipResponse>(
      '/equipment.EquipmentService/Equip',
      ($0.EquipRequest value) => value.writeToBuffer(),
      $0.EquipResponse.fromBuffer);
  static final _$unequip =
      $grpc.ClientMethod<$0.UnequipRequest, $0.UnequipResponse>(
          '/equipment.EquipmentService/Unequip',
          ($0.UnequipRequest value) => value.writeToBuffer(),
          $0.UnequipResponse.fromBuffer);
}

@$pb.GrpcServiceName('equipment.EquipmentService')
abstract class EquipmentServiceBase extends $grpc.Service {
  $core.String get $name => 'equipment.EquipmentService';

  EquipmentServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetEquipmentRequest, $0.GetEquipmentResponse>(
            'GetEquipment',
            getEquipment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetEquipmentRequest.fromBuffer(value),
            ($0.GetEquipmentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EquipRequest, $0.EquipResponse>(
        'Equip',
        equip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EquipRequest.fromBuffer(value),
        ($0.EquipResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UnequipRequest, $0.UnequipResponse>(
        'Unequip',
        unequip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UnequipRequest.fromBuffer(value),
        ($0.UnequipResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetEquipmentResponse> getEquipment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetEquipmentRequest> $request) async {
    return getEquipment($call, await $request);
  }

  $async.Future<$0.GetEquipmentResponse> getEquipment(
      $grpc.ServiceCall call, $0.GetEquipmentRequest request);

  $async.Future<$0.EquipResponse> equip_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.EquipRequest> $request) async {
    return equip($call, await $request);
  }

  $async.Future<$0.EquipResponse> equip(
      $grpc.ServiceCall call, $0.EquipRequest request);

  $async.Future<$0.UnequipResponse> unequip_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UnequipRequest> $request) async {
    return unequip($call, await $request);
  }

  $async.Future<$0.UnequipResponse> unequip(
      $grpc.ServiceCall call, $0.UnequipRequest request);
}
