// This is a generated file - do not edit.
//
// Generated from craft.proto.

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

import 'craft.pb.dart' as $0;

export 'craft.pb.dart';

@$pb.GrpcServiceName('craft.CraftService')
class CraftServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CraftServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetRecipesResponse> getRecipes(
    $0.GetRecipesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getRecipes, request, options: options);
  }

  $grpc.ResponseFuture<$0.CraftItemResponse> craftItem(
    $0.CraftItemRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$craftItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSalvageableItemsResponse> getSalvageableItems(
    $0.GetSalvageableItemsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSalvageableItems, request, options: options);
  }

  $grpc.ResponseFuture<$0.SalvageItemResponse> salvageItem(
    $0.SalvageItemRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$salvageItem, request, options: options);
  }

  // method descriptors

  static final _$getRecipes =
      $grpc.ClientMethod<$0.GetRecipesRequest, $0.GetRecipesResponse>(
          '/craft.CraftService/GetRecipes',
          ($0.GetRecipesRequest value) => value.writeToBuffer(),
          $0.GetRecipesResponse.fromBuffer);
  static final _$craftItem =
      $grpc.ClientMethod<$0.CraftItemRequest, $0.CraftItemResponse>(
          '/craft.CraftService/CraftItem',
          ($0.CraftItemRequest value) => value.writeToBuffer(),
          $0.CraftItemResponse.fromBuffer);
  static final _$getSalvageableItems = $grpc.ClientMethod<
          $0.GetSalvageableItemsRequest, $0.GetSalvageableItemsResponse>(
      '/craft.CraftService/GetSalvageableItems',
      ($0.GetSalvageableItemsRequest value) => value.writeToBuffer(),
      $0.GetSalvageableItemsResponse.fromBuffer);
  static final _$salvageItem =
      $grpc.ClientMethod<$0.SalvageItemRequest, $0.SalvageItemResponse>(
          '/craft.CraftService/SalvageItem',
          ($0.SalvageItemRequest value) => value.writeToBuffer(),
          $0.SalvageItemResponse.fromBuffer);
}

@$pb.GrpcServiceName('craft.CraftService')
abstract class CraftServiceBase extends $grpc.Service {
  $core.String get $name => 'craft.CraftService';

  CraftServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetRecipesRequest, $0.GetRecipesResponse>(
        'GetRecipes',
        getRecipes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRecipesRequest.fromBuffer(value),
        ($0.GetRecipesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CraftItemRequest, $0.CraftItemResponse>(
        'CraftItem',
        craftItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CraftItemRequest.fromBuffer(value),
        ($0.CraftItemResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSalvageableItemsRequest,
            $0.GetSalvageableItemsResponse>(
        'GetSalvageableItems',
        getSalvageableItems_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSalvageableItemsRequest.fromBuffer(value),
        ($0.GetSalvageableItemsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SalvageItemRequest, $0.SalvageItemResponse>(
            'SalvageItem',
            salvageItem_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SalvageItemRequest.fromBuffer(value),
            ($0.SalvageItemResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetRecipesResponse> getRecipes_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetRecipesRequest> $request) async {
    return getRecipes($call, await $request);
  }

  $async.Future<$0.GetRecipesResponse> getRecipes(
      $grpc.ServiceCall call, $0.GetRecipesRequest request);

  $async.Future<$0.CraftItemResponse> craftItem_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CraftItemRequest> $request) async {
    return craftItem($call, await $request);
  }

  $async.Future<$0.CraftItemResponse> craftItem(
      $grpc.ServiceCall call, $0.CraftItemRequest request);

  $async.Future<$0.GetSalvageableItemsResponse> getSalvageableItems_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetSalvageableItemsRequest> $request) async {
    return getSalvageableItems($call, await $request);
  }

  $async.Future<$0.GetSalvageableItemsResponse> getSalvageableItems(
      $grpc.ServiceCall call, $0.GetSalvageableItemsRequest request);

  $async.Future<$0.SalvageItemResponse> salvageItem_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SalvageItemRequest> $request) async {
    return salvageItem($call, await $request);
  }

  $async.Future<$0.SalvageItemResponse> salvageItem(
      $grpc.ServiceCall call, $0.SalvageItemRequest request);
}
