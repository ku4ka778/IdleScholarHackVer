// This is a generated file - do not edit.
//
// Generated from expedition.proto.

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

import 'expedition.pb.dart' as $0;

export 'expedition.pb.dart';

@$pb.GrpcServiceName('expedition.ExpeditionService')
class ExpeditionServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ExpeditionServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.StartExpeditionResponse> startExpedition(
    $0.StartExpeditionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$startExpedition, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetExpeditionStatusResponse> getExpeditionStatus(
    $0.GetExpeditionStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getExpeditionStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.StopExpeditionResponse> stopExpedition(
    $0.StopExpeditionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$stopExpedition, request, options: options);
  }

  $grpc.ResponseFuture<$0.HeartbeatResponse> sendHeartbeat(
    $0.HeartbeatRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendHeartbeat, request, options: options);
  }

  $grpc.ResponseFuture<$0.FinishExpeditionResponse> finishExpedition(
    $0.FinishExpeditionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finishExpedition, request, options: options);
  }

  $grpc.ResponseFuture<$0.PauseExpeditionResponse> pauseExpedition(
    $0.PauseExpeditionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pauseExpedition, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResumeExpeditionResponse> resumeExpedition(
    $0.ResumeExpeditionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resumeExpedition, request, options: options);
  }

  // method descriptors

  static final _$startExpedition =
      $grpc.ClientMethod<$0.StartExpeditionRequest, $0.StartExpeditionResponse>(
          '/expedition.ExpeditionService/StartExpedition',
          ($0.StartExpeditionRequest value) => value.writeToBuffer(),
          $0.StartExpeditionResponse.fromBuffer);
  static final _$getExpeditionStatus = $grpc.ClientMethod<
          $0.GetExpeditionStatusRequest, $0.GetExpeditionStatusResponse>(
      '/expedition.ExpeditionService/GetExpeditionStatus',
      ($0.GetExpeditionStatusRequest value) => value.writeToBuffer(),
      $0.GetExpeditionStatusResponse.fromBuffer);
  static final _$stopExpedition =
      $grpc.ClientMethod<$0.StopExpeditionRequest, $0.StopExpeditionResponse>(
          '/expedition.ExpeditionService/StopExpedition',
          ($0.StopExpeditionRequest value) => value.writeToBuffer(),
          $0.StopExpeditionResponse.fromBuffer);
  static final _$sendHeartbeat =
      $grpc.ClientMethod<$0.HeartbeatRequest, $0.HeartbeatResponse>(
          '/expedition.ExpeditionService/SendHeartbeat',
          ($0.HeartbeatRequest value) => value.writeToBuffer(),
          $0.HeartbeatResponse.fromBuffer);
  static final _$finishExpedition = $grpc.ClientMethod<
          $0.FinishExpeditionRequest, $0.FinishExpeditionResponse>(
      '/expedition.ExpeditionService/FinishExpedition',
      ($0.FinishExpeditionRequest value) => value.writeToBuffer(),
      $0.FinishExpeditionResponse.fromBuffer);
  static final _$pauseExpedition =
      $grpc.ClientMethod<$0.PauseExpeditionRequest, $0.PauseExpeditionResponse>(
          '/expedition.ExpeditionService/PauseExpedition',
          ($0.PauseExpeditionRequest value) => value.writeToBuffer(),
          $0.PauseExpeditionResponse.fromBuffer);
  static final _$resumeExpedition = $grpc.ClientMethod<
          $0.ResumeExpeditionRequest, $0.ResumeExpeditionResponse>(
      '/expedition.ExpeditionService/ResumeExpedition',
      ($0.ResumeExpeditionRequest value) => value.writeToBuffer(),
      $0.ResumeExpeditionResponse.fromBuffer);
}

@$pb.GrpcServiceName('expedition.ExpeditionService')
abstract class ExpeditionServiceBase extends $grpc.Service {
  $core.String get $name => 'expedition.ExpeditionService';

  ExpeditionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StartExpeditionRequest,
            $0.StartExpeditionResponse>(
        'StartExpedition',
        startExpedition_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StartExpeditionRequest.fromBuffer(value),
        ($0.StartExpeditionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetExpeditionStatusRequest,
            $0.GetExpeditionStatusResponse>(
        'GetExpeditionStatus',
        getExpeditionStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetExpeditionStatusRequest.fromBuffer(value),
        ($0.GetExpeditionStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StopExpeditionRequest,
            $0.StopExpeditionResponse>(
        'StopExpedition',
        stopExpedition_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StopExpeditionRequest.fromBuffer(value),
        ($0.StopExpeditionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HeartbeatRequest, $0.HeartbeatResponse>(
        'SendHeartbeat',
        sendHeartbeat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HeartbeatRequest.fromBuffer(value),
        ($0.HeartbeatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FinishExpeditionRequest,
            $0.FinishExpeditionResponse>(
        'FinishExpedition',
        finishExpedition_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinishExpeditionRequest.fromBuffer(value),
        ($0.FinishExpeditionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PauseExpeditionRequest,
            $0.PauseExpeditionResponse>(
        'PauseExpedition',
        pauseExpedition_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.PauseExpeditionRequest.fromBuffer(value),
        ($0.PauseExpeditionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResumeExpeditionRequest,
            $0.ResumeExpeditionResponse>(
        'ResumeExpedition',
        resumeExpedition_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResumeExpeditionRequest.fromBuffer(value),
        ($0.ResumeExpeditionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.StartExpeditionResponse> startExpedition_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StartExpeditionRequest> $request) async {
    return startExpedition($call, await $request);
  }

  $async.Future<$0.StartExpeditionResponse> startExpedition(
      $grpc.ServiceCall call, $0.StartExpeditionRequest request);

  $async.Future<$0.GetExpeditionStatusResponse> getExpeditionStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetExpeditionStatusRequest> $request) async {
    return getExpeditionStatus($call, await $request);
  }

  $async.Future<$0.GetExpeditionStatusResponse> getExpeditionStatus(
      $grpc.ServiceCall call, $0.GetExpeditionStatusRequest request);

  $async.Future<$0.StopExpeditionResponse> stopExpedition_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StopExpeditionRequest> $request) async {
    return stopExpedition($call, await $request);
  }

  $async.Future<$0.StopExpeditionResponse> stopExpedition(
      $grpc.ServiceCall call, $0.StopExpeditionRequest request);

  $async.Future<$0.HeartbeatResponse> sendHeartbeat_Pre($grpc.ServiceCall $call,
      $async.Future<$0.HeartbeatRequest> $request) async {
    return sendHeartbeat($call, await $request);
  }

  $async.Future<$0.HeartbeatResponse> sendHeartbeat(
      $grpc.ServiceCall call, $0.HeartbeatRequest request);

  $async.Future<$0.FinishExpeditionResponse> finishExpedition_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FinishExpeditionRequest> $request) async {
    return finishExpedition($call, await $request);
  }

  $async.Future<$0.FinishExpeditionResponse> finishExpedition(
      $grpc.ServiceCall call, $0.FinishExpeditionRequest request);

  $async.Future<$0.PauseExpeditionResponse> pauseExpedition_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.PauseExpeditionRequest> $request) async {
    return pauseExpedition($call, await $request);
  }

  $async.Future<$0.PauseExpeditionResponse> pauseExpedition(
      $grpc.ServiceCall call, $0.PauseExpeditionRequest request);

  $async.Future<$0.ResumeExpeditionResponse> resumeExpedition_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ResumeExpeditionRequest> $request) async {
    return resumeExpedition($call, await $request);
  }

  $async.Future<$0.ResumeExpeditionResponse> resumeExpedition(
      $grpc.ServiceCall call, $0.ResumeExpeditionRequest request);
}
