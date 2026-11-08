// This is a generated file - do not edit.
//
// Generated from expedition.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class StartExpeditionRequest extends $pb.GeneratedMessage {
  factory StartExpeditionRequest({
    $core.int? characterId,
    $core.int? durationMinutes,
    $core.int? activityType,
    $core.int? activityLevel,
    $core.Iterable<$core.String>? allowedDomains,
    $core.Iterable<$core.String>? allowedApps,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (durationMinutes != null) result.durationMinutes = durationMinutes;
    if (activityType != null) result.activityType = activityType;
    if (activityLevel != null) result.activityLevel = activityLevel;
    if (allowedDomains != null) result.allowedDomains.addAll(allowedDomains);
    if (allowedApps != null) result.allowedApps.addAll(allowedApps);
    return result;
  }

  StartExpeditionRequest._();

  factory StartExpeditionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartExpeditionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartExpeditionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'durationMinutes')
    ..aI(3, _omitFieldNames ? '' : 'activityType')
    ..aI(4, _omitFieldNames ? '' : 'activityLevel')
    ..pPS(5, _omitFieldNames ? '' : 'allowedDomains')
    ..pPS(6, _omitFieldNames ? '' : 'allowedApps')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartExpeditionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartExpeditionRequest copyWith(
          void Function(StartExpeditionRequest) updates) =>
      super.copyWith((message) => updates(message as StartExpeditionRequest))
          as StartExpeditionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartExpeditionRequest create() => StartExpeditionRequest._();
  @$core.override
  StartExpeditionRequest createEmptyInstance() => create();
  static $pb.PbList<StartExpeditionRequest> createRepeated() =>
      $pb.PbList<StartExpeditionRequest>();
  @$core.pragma('dart2js:noInline')
  static StartExpeditionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartExpeditionRequest>(create);
  static StartExpeditionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get durationMinutes => $_getIZ(1);
  @$pb.TagNumber(2)
  set durationMinutes($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDurationMinutes() => $_has(1);
  @$pb.TagNumber(2)
  void clearDurationMinutes() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get activityType => $_getIZ(2);
  @$pb.TagNumber(3)
  set activityType($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasActivityType() => $_has(2);
  @$pb.TagNumber(3)
  void clearActivityType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get activityLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set activityLevel($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasActivityLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearActivityLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get allowedDomains => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get allowedApps => $_getList(5);
}

class StartExpeditionResponse extends $pb.GeneratedMessage {
  factory StartExpeditionResponse({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? expeditionEndUnix,
    $core.int? totalGoldBonusPct,
    $core.int? totalLuckBonusPct,
    $core.int? penaltyReductionPct,
    $core.int? strBonusAtk,
    $core.int? dexCycleReduction,
    $core.int? intExpBonusPct,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (expeditionEndUnix != null) result.expeditionEndUnix = expeditionEndUnix;
    if (totalGoldBonusPct != null) result.totalGoldBonusPct = totalGoldBonusPct;
    if (totalLuckBonusPct != null) result.totalLuckBonusPct = totalLuckBonusPct;
    if (penaltyReductionPct != null)
      result.penaltyReductionPct = penaltyReductionPct;
    if (strBonusAtk != null) result.strBonusAtk = strBonusAtk;
    if (dexCycleReduction != null) result.dexCycleReduction = dexCycleReduction;
    if (intExpBonusPct != null) result.intExpBonusPct = intExpBonusPct;
    return result;
  }

  StartExpeditionResponse._();

  factory StartExpeditionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartExpeditionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartExpeditionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aInt64(3, _omitFieldNames ? '' : 'expeditionEndUnix')
    ..aI(4, _omitFieldNames ? '' : 'totalGoldBonusPct')
    ..aI(5, _omitFieldNames ? '' : 'totalLuckBonusPct')
    ..aI(6, _omitFieldNames ? '' : 'penaltyReductionPct')
    ..aI(7, _omitFieldNames ? '' : 'strBonusAtk')
    ..aI(8, _omitFieldNames ? '' : 'dexCycleReduction')
    ..aI(9, _omitFieldNames ? '' : 'intExpBonusPct')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartExpeditionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartExpeditionResponse copyWith(
          void Function(StartExpeditionResponse) updates) =>
      super.copyWith((message) => updates(message as StartExpeditionResponse))
          as StartExpeditionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartExpeditionResponse create() => StartExpeditionResponse._();
  @$core.override
  StartExpeditionResponse createEmptyInstance() => create();
  static $pb.PbList<StartExpeditionResponse> createRepeated() =>
      $pb.PbList<StartExpeditionResponse>();
  @$core.pragma('dart2js:noInline')
  static StartExpeditionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartExpeditionResponse>(create);
  static StartExpeditionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expeditionEndUnix => $_getI64(2);
  @$pb.TagNumber(3)
  set expeditionEndUnix($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpeditionEndUnix() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpeditionEndUnix() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalGoldBonusPct => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalGoldBonusPct($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalGoldBonusPct() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalGoldBonusPct() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalLuckBonusPct => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalLuckBonusPct($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalLuckBonusPct() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalLuckBonusPct() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get penaltyReductionPct => $_getIZ(5);
  @$pb.TagNumber(6)
  set penaltyReductionPct($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPenaltyReductionPct() => $_has(5);
  @$pb.TagNumber(6)
  void clearPenaltyReductionPct() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get strBonusAtk => $_getIZ(6);
  @$pb.TagNumber(7)
  set strBonusAtk($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStrBonusAtk() => $_has(6);
  @$pb.TagNumber(7)
  void clearStrBonusAtk() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get dexCycleReduction => $_getIZ(7);
  @$pb.TagNumber(8)
  set dexCycleReduction($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDexCycleReduction() => $_has(7);
  @$pb.TagNumber(8)
  void clearDexCycleReduction() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get intExpBonusPct => $_getIZ(8);
  @$pb.TagNumber(9)
  set intExpBonusPct($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIntExpBonusPct() => $_has(8);
  @$pb.TagNumber(9)
  void clearIntExpBonusPct() => $_clearField(9);
}

class GetExpeditionStatusRequest extends $pb.GeneratedMessage {
  factory GetExpeditionStatusRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetExpeditionStatusRequest._();

  factory GetExpeditionStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetExpeditionStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetExpeditionStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetExpeditionStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetExpeditionStatusRequest copyWith(
          void Function(GetExpeditionStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetExpeditionStatusRequest))
          as GetExpeditionStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetExpeditionStatusRequest create() => GetExpeditionStatusRequest._();
  @$core.override
  GetExpeditionStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetExpeditionStatusRequest> createRepeated() =>
      $pb.PbList<GetExpeditionStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetExpeditionStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetExpeditionStatusRequest>(create);
  static GetExpeditionStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetExpeditionStatusResponse extends $pb.GeneratedMessage {
  factory GetExpeditionStatusResponse({
    $core.bool? success,
    $core.bool? isActive,
    $fixnum.Int64? remainingSeconds,
    $core.int? activityType,
    $core.int? activityLevel,
    $core.bool? justFinished,
    $fixnum.Int64? goldGained,
    $fixnum.Int64? expGained,
    $core.Iterable<$core.String>? itemsGained,
    $core.int? penaltyStacks,
    $core.int? penaltyExpires,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (isActive != null) result.isActive = isActive;
    if (remainingSeconds != null) result.remainingSeconds = remainingSeconds;
    if (activityType != null) result.activityType = activityType;
    if (activityLevel != null) result.activityLevel = activityLevel;
    if (justFinished != null) result.justFinished = justFinished;
    if (goldGained != null) result.goldGained = goldGained;
    if (expGained != null) result.expGained = expGained;
    if (itemsGained != null) result.itemsGained.addAll(itemsGained);
    if (penaltyStacks != null) result.penaltyStacks = penaltyStacks;
    if (penaltyExpires != null) result.penaltyExpires = penaltyExpires;
    return result;
  }

  GetExpeditionStatusResponse._();

  factory GetExpeditionStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetExpeditionStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetExpeditionStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aInt64(3, _omitFieldNames ? '' : 'remainingSeconds')
    ..aI(4, _omitFieldNames ? '' : 'activityType')
    ..aI(5, _omitFieldNames ? '' : 'activityLevel')
    ..aOB(6, _omitFieldNames ? '' : 'justFinished')
    ..aInt64(7, _omitFieldNames ? '' : 'goldGained')
    ..aInt64(8, _omitFieldNames ? '' : 'expGained')
    ..pPS(9, _omitFieldNames ? '' : 'itemsGained')
    ..aI(10, _omitFieldNames ? '' : 'penaltyStacks')
    ..aI(11, _omitFieldNames ? '' : 'penaltyExpires')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetExpeditionStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetExpeditionStatusResponse copyWith(
          void Function(GetExpeditionStatusResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetExpeditionStatusResponse))
          as GetExpeditionStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetExpeditionStatusResponse create() =>
      GetExpeditionStatusResponse._();
  @$core.override
  GetExpeditionStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetExpeditionStatusResponse> createRepeated() =>
      $pb.PbList<GetExpeditionStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetExpeditionStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetExpeditionStatusResponse>(create);
  static GetExpeditionStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get remainingSeconds => $_getI64(2);
  @$pb.TagNumber(3)
  set remainingSeconds($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemainingSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemainingSeconds() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get activityType => $_getIZ(3);
  @$pb.TagNumber(4)
  set activityType($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasActivityType() => $_has(3);
  @$pb.TagNumber(4)
  void clearActivityType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get activityLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set activityLevel($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasActivityLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearActivityLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get justFinished => $_getBF(5);
  @$pb.TagNumber(6)
  set justFinished($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasJustFinished() => $_has(5);
  @$pb.TagNumber(6)
  void clearJustFinished() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get goldGained => $_getI64(6);
  @$pb.TagNumber(7)
  set goldGained($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGoldGained() => $_has(6);
  @$pb.TagNumber(7)
  void clearGoldGained() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get expGained => $_getI64(7);
  @$pb.TagNumber(8)
  set expGained($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasExpGained() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpGained() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get itemsGained => $_getList(8);

  @$pb.TagNumber(10)
  $core.int get penaltyStacks => $_getIZ(9);
  @$pb.TagNumber(10)
  set penaltyStacks($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPenaltyStacks() => $_has(9);
  @$pb.TagNumber(10)
  void clearPenaltyStacks() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get penaltyExpires => $_getIZ(10);
  @$pb.TagNumber(11)
  set penaltyExpires($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasPenaltyExpires() => $_has(10);
  @$pb.TagNumber(11)
  void clearPenaltyExpires() => $_clearField(11);
}

class StopExpeditionRequest extends $pb.GeneratedMessage {
  factory StopExpeditionRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  StopExpeditionRequest._();

  factory StopExpeditionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopExpeditionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopExpeditionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopExpeditionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopExpeditionRequest copyWith(
          void Function(StopExpeditionRequest) updates) =>
      super.copyWith((message) => updates(message as StopExpeditionRequest))
          as StopExpeditionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopExpeditionRequest create() => StopExpeditionRequest._();
  @$core.override
  StopExpeditionRequest createEmptyInstance() => create();
  static $pb.PbList<StopExpeditionRequest> createRepeated() =>
      $pb.PbList<StopExpeditionRequest>();
  @$core.pragma('dart2js:noInline')
  static StopExpeditionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopExpeditionRequest>(create);
  static StopExpeditionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class StopExpeditionResponse extends $pb.GeneratedMessage {
  factory StopExpeditionResponse({
    $core.bool? success,
    $core.String? message,
    $core.bool? penaltyApplied,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (penaltyApplied != null) result.penaltyApplied = penaltyApplied;
    return result;
  }

  StopExpeditionResponse._();

  factory StopExpeditionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopExpeditionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopExpeditionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOB(3, _omitFieldNames ? '' : 'penaltyApplied')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopExpeditionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopExpeditionResponse copyWith(
          void Function(StopExpeditionResponse) updates) =>
      super.copyWith((message) => updates(message as StopExpeditionResponse))
          as StopExpeditionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopExpeditionResponse create() => StopExpeditionResponse._();
  @$core.override
  StopExpeditionResponse createEmptyInstance() => create();
  static $pb.PbList<StopExpeditionResponse> createRepeated() =>
      $pb.PbList<StopExpeditionResponse>();
  @$core.pragma('dart2js:noInline')
  static StopExpeditionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopExpeditionResponse>(create);
  static StopExpeditionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get penaltyApplied => $_getBF(2);
  @$pb.TagNumber(3)
  set penaltyApplied($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPenaltyApplied() => $_has(2);
  @$pb.TagNumber(3)
  void clearPenaltyApplied() => $_clearField(3);
}

class HeartbeatRequest extends $pb.GeneratedMessage {
  factory HeartbeatRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  HeartbeatRequest._();

  factory HeartbeatRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartbeatRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartbeatRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatRequest copyWith(void Function(HeartbeatRequest) updates) =>
      super.copyWith((message) => updates(message as HeartbeatRequest))
          as HeartbeatRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartbeatRequest create() => HeartbeatRequest._();
  @$core.override
  HeartbeatRequest createEmptyInstance() => create();
  static $pb.PbList<HeartbeatRequest> createRepeated() =>
      $pb.PbList<HeartbeatRequest>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartbeatRequest>(create);
  static HeartbeatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class HeartbeatResponse extends $pb.GeneratedMessage {
  factory HeartbeatResponse({
    $core.bool? success,
    $core.bool? isActive,
    $core.String? message,
    $fixnum.Int64? goldGained,
    $fixnum.Int64? expGained,
    $core.Iterable<$core.String>? itemsGained,
    $core.int? newLevel,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (isActive != null) result.isActive = isActive;
    if (message != null) result.message = message;
    if (goldGained != null) result.goldGained = goldGained;
    if (expGained != null) result.expGained = expGained;
    if (itemsGained != null) result.itemsGained.addAll(itemsGained);
    if (newLevel != null) result.newLevel = newLevel;
    return result;
  }

  HeartbeatResponse._();

  factory HeartbeatResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartbeatResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartbeatResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aInt64(4, _omitFieldNames ? '' : 'goldGained')
    ..aInt64(5, _omitFieldNames ? '' : 'expGained')
    ..pPS(6, _omitFieldNames ? '' : 'itemsGained')
    ..aI(7, _omitFieldNames ? '' : 'newLevel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatResponse copyWith(void Function(HeartbeatResponse) updates) =>
      super.copyWith((message) => updates(message as HeartbeatResponse))
          as HeartbeatResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartbeatResponse create() => HeartbeatResponse._();
  @$core.override
  HeartbeatResponse createEmptyInstance() => create();
  static $pb.PbList<HeartbeatResponse> createRepeated() =>
      $pb.PbList<HeartbeatResponse>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartbeatResponse>(create);
  static HeartbeatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get goldGained => $_getI64(3);
  @$pb.TagNumber(4)
  set goldGained($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGoldGained() => $_has(3);
  @$pb.TagNumber(4)
  void clearGoldGained() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expGained => $_getI64(4);
  @$pb.TagNumber(5)
  set expGained($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpGained() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpGained() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get itemsGained => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get newLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set newLevel($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNewLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearNewLevel() => $_clearField(7);
}

class FinishExpeditionRequest extends $pb.GeneratedMessage {
  factory FinishExpeditionRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  FinishExpeditionRequest._();

  factory FinishExpeditionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinishExpeditionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinishExpeditionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishExpeditionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishExpeditionRequest copyWith(
          void Function(FinishExpeditionRequest) updates) =>
      super.copyWith((message) => updates(message as FinishExpeditionRequest))
          as FinishExpeditionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinishExpeditionRequest create() => FinishExpeditionRequest._();
  @$core.override
  FinishExpeditionRequest createEmptyInstance() => create();
  static $pb.PbList<FinishExpeditionRequest> createRepeated() =>
      $pb.PbList<FinishExpeditionRequest>();
  @$core.pragma('dart2js:noInline')
  static FinishExpeditionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinishExpeditionRequest>(create);
  static FinishExpeditionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class FinishExpeditionResponse extends $pb.GeneratedMessage {
  factory FinishExpeditionResponse({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? goldGained,
    $fixnum.Int64? expGained,
    $core.Iterable<$core.String>? itemsGained,
    $core.int? newLevel,
    $core.bool? echoTriggered,
    $core.bool? echoDefeated,
    $fixnum.Int64? echoGoldLost,
    $fixnum.Int64? echoExpLost,
    $core.bool? raidTriggered,
    $fixnum.Int64? raidResourcesLost,
    $core.bool? blizzardTriggered,
    $fixnum.Int64? blizzardGoldLost,
    $fixnum.Int64? blizzardResourceLost,
    $core.bool? resonanceTriggered,
    $core.bool? resonancePositive,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (goldGained != null) result.goldGained = goldGained;
    if (expGained != null) result.expGained = expGained;
    if (itemsGained != null) result.itemsGained.addAll(itemsGained);
    if (newLevel != null) result.newLevel = newLevel;
    if (echoTriggered != null) result.echoTriggered = echoTriggered;
    if (echoDefeated != null) result.echoDefeated = echoDefeated;
    if (echoGoldLost != null) result.echoGoldLost = echoGoldLost;
    if (echoExpLost != null) result.echoExpLost = echoExpLost;
    if (raidTriggered != null) result.raidTriggered = raidTriggered;
    if (raidResourcesLost != null) result.raidResourcesLost = raidResourcesLost;
    if (blizzardTriggered != null) result.blizzardTriggered = blizzardTriggered;
    if (blizzardGoldLost != null) result.blizzardGoldLost = blizzardGoldLost;
    if (blizzardResourceLost != null)
      result.blizzardResourceLost = blizzardResourceLost;
    if (resonanceTriggered != null)
      result.resonanceTriggered = resonanceTriggered;
    if (resonancePositive != null) result.resonancePositive = resonancePositive;
    return result;
  }

  FinishExpeditionResponse._();

  factory FinishExpeditionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinishExpeditionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinishExpeditionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aInt64(3, _omitFieldNames ? '' : 'goldGained')
    ..aInt64(4, _omitFieldNames ? '' : 'expGained')
    ..pPS(5, _omitFieldNames ? '' : 'itemsGained')
    ..aI(6, _omitFieldNames ? '' : 'newLevel')
    ..aOB(7, _omitFieldNames ? '' : 'echoTriggered')
    ..aOB(8, _omitFieldNames ? '' : 'echoDefeated')
    ..aInt64(9, _omitFieldNames ? '' : 'echoGoldLost')
    ..aInt64(10, _omitFieldNames ? '' : 'echoExpLost')
    ..aOB(11, _omitFieldNames ? '' : 'raidTriggered')
    ..aInt64(12, _omitFieldNames ? '' : 'raidResourcesLost')
    ..aOB(13, _omitFieldNames ? '' : 'blizzardTriggered')
    ..aInt64(14, _omitFieldNames ? '' : 'blizzardGoldLost')
    ..aInt64(15, _omitFieldNames ? '' : 'blizzardResourceLost')
    ..aOB(16, _omitFieldNames ? '' : 'resonanceTriggered')
    ..aOB(17, _omitFieldNames ? '' : 'resonancePositive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishExpeditionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishExpeditionResponse copyWith(
          void Function(FinishExpeditionResponse) updates) =>
      super.copyWith((message) => updates(message as FinishExpeditionResponse))
          as FinishExpeditionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinishExpeditionResponse create() => FinishExpeditionResponse._();
  @$core.override
  FinishExpeditionResponse createEmptyInstance() => create();
  static $pb.PbList<FinishExpeditionResponse> createRepeated() =>
      $pb.PbList<FinishExpeditionResponse>();
  @$core.pragma('dart2js:noInline')
  static FinishExpeditionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinishExpeditionResponse>(create);
  static FinishExpeditionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get goldGained => $_getI64(2);
  @$pb.TagNumber(3)
  set goldGained($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGoldGained() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoldGained() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expGained => $_getI64(3);
  @$pb.TagNumber(4)
  set expGained($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpGained() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpGained() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get itemsGained => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get newLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set newLevel($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNewLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearNewLevel() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get echoTriggered => $_getBF(6);
  @$pb.TagNumber(7)
  set echoTriggered($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEchoTriggered() => $_has(6);
  @$pb.TagNumber(7)
  void clearEchoTriggered() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get echoDefeated => $_getBF(7);
  @$pb.TagNumber(8)
  set echoDefeated($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEchoDefeated() => $_has(7);
  @$pb.TagNumber(8)
  void clearEchoDefeated() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get echoGoldLost => $_getI64(8);
  @$pb.TagNumber(9)
  set echoGoldLost($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEchoGoldLost() => $_has(8);
  @$pb.TagNumber(9)
  void clearEchoGoldLost() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get echoExpLost => $_getI64(9);
  @$pb.TagNumber(10)
  set echoExpLost($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasEchoExpLost() => $_has(9);
  @$pb.TagNumber(10)
  void clearEchoExpLost() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get raidTriggered => $_getBF(10);
  @$pb.TagNumber(11)
  set raidTriggered($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRaidTriggered() => $_has(10);
  @$pb.TagNumber(11)
  void clearRaidTriggered() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get raidResourcesLost => $_getI64(11);
  @$pb.TagNumber(12)
  set raidResourcesLost($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRaidResourcesLost() => $_has(11);
  @$pb.TagNumber(12)
  void clearRaidResourcesLost() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get blizzardTriggered => $_getBF(12);
  @$pb.TagNumber(13)
  set blizzardTriggered($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasBlizzardTriggered() => $_has(12);
  @$pb.TagNumber(13)
  void clearBlizzardTriggered() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get blizzardGoldLost => $_getI64(13);
  @$pb.TagNumber(14)
  set blizzardGoldLost($fixnum.Int64 value) => $_setInt64(13, value);
  @$pb.TagNumber(14)
  $core.bool hasBlizzardGoldLost() => $_has(13);
  @$pb.TagNumber(14)
  void clearBlizzardGoldLost() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get blizzardResourceLost => $_getI64(14);
  @$pb.TagNumber(15)
  set blizzardResourceLost($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasBlizzardResourceLost() => $_has(14);
  @$pb.TagNumber(15)
  void clearBlizzardResourceLost() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get resonanceTriggered => $_getBF(15);
  @$pb.TagNumber(16)
  set resonanceTriggered($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasResonanceTriggered() => $_has(15);
  @$pb.TagNumber(16)
  void clearResonanceTriggered() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.bool get resonancePositive => $_getBF(16);
  @$pb.TagNumber(17)
  set resonancePositive($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(17)
  $core.bool hasResonancePositive() => $_has(16);
  @$pb.TagNumber(17)
  void clearResonancePositive() => $_clearField(17);
}

class PauseExpeditionRequest extends $pb.GeneratedMessage {
  factory PauseExpeditionRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  PauseExpeditionRequest._();

  factory PauseExpeditionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PauseExpeditionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseExpeditionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseExpeditionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseExpeditionRequest copyWith(
          void Function(PauseExpeditionRequest) updates) =>
      super.copyWith((message) => updates(message as PauseExpeditionRequest))
          as PauseExpeditionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseExpeditionRequest create() => PauseExpeditionRequest._();
  @$core.override
  PauseExpeditionRequest createEmptyInstance() => create();
  static $pb.PbList<PauseExpeditionRequest> createRepeated() =>
      $pb.PbList<PauseExpeditionRequest>();
  @$core.pragma('dart2js:noInline')
  static PauseExpeditionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseExpeditionRequest>(create);
  static PauseExpeditionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class PauseExpeditionResponse extends $pb.GeneratedMessage {
  factory PauseExpeditionResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  PauseExpeditionResponse._();

  factory PauseExpeditionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PauseExpeditionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseExpeditionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseExpeditionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PauseExpeditionResponse copyWith(
          void Function(PauseExpeditionResponse) updates) =>
      super.copyWith((message) => updates(message as PauseExpeditionResponse))
          as PauseExpeditionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseExpeditionResponse create() => PauseExpeditionResponse._();
  @$core.override
  PauseExpeditionResponse createEmptyInstance() => create();
  static $pb.PbList<PauseExpeditionResponse> createRepeated() =>
      $pb.PbList<PauseExpeditionResponse>();
  @$core.pragma('dart2js:noInline')
  static PauseExpeditionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseExpeditionResponse>(create);
  static PauseExpeditionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class ResumeExpeditionRequest extends $pb.GeneratedMessage {
  factory ResumeExpeditionRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  ResumeExpeditionRequest._();

  factory ResumeExpeditionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResumeExpeditionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResumeExpeditionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeExpeditionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeExpeditionRequest copyWith(
          void Function(ResumeExpeditionRequest) updates) =>
      super.copyWith((message) => updates(message as ResumeExpeditionRequest))
          as ResumeExpeditionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResumeExpeditionRequest create() => ResumeExpeditionRequest._();
  @$core.override
  ResumeExpeditionRequest createEmptyInstance() => create();
  static $pb.PbList<ResumeExpeditionRequest> createRepeated() =>
      $pb.PbList<ResumeExpeditionRequest>();
  @$core.pragma('dart2js:noInline')
  static ResumeExpeditionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResumeExpeditionRequest>(create);
  static ResumeExpeditionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class ResumeExpeditionResponse extends $pb.GeneratedMessage {
  factory ResumeExpeditionResponse({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? remainingSeconds,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (remainingSeconds != null) result.remainingSeconds = remainingSeconds;
    return result;
  }

  ResumeExpeditionResponse._();

  factory ResumeExpeditionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResumeExpeditionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResumeExpeditionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'expedition'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aInt64(3, _omitFieldNames ? '' : 'remainingSeconds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeExpeditionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResumeExpeditionResponse copyWith(
          void Function(ResumeExpeditionResponse) updates) =>
      super.copyWith((message) => updates(message as ResumeExpeditionResponse))
          as ResumeExpeditionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResumeExpeditionResponse create() => ResumeExpeditionResponse._();
  @$core.override
  ResumeExpeditionResponse createEmptyInstance() => create();
  static $pb.PbList<ResumeExpeditionResponse> createRepeated() =>
      $pb.PbList<ResumeExpeditionResponse>();
  @$core.pragma('dart2js:noInline')
  static ResumeExpeditionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResumeExpeditionResponse>(create);
  static ResumeExpeditionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get remainingSeconds => $_getI64(2);
  @$pb.TagNumber(3)
  set remainingSeconds($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemainingSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemainingSeconds() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
