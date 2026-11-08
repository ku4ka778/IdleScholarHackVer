// This is a generated file - do not edit.
//
// Generated from city.proto.

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

class GetCityRequest extends $pb.GeneratedMessage {
  factory GetCityRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetCityRequest._();

  factory GetCityRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCityRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCityRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCityRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCityRequest copyWith(void Function(GetCityRequest) updates) =>
      super.copyWith((message) => updates(message as GetCityRequest))
          as GetCityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCityRequest create() => GetCityRequest._();
  @$core.override
  GetCityRequest createEmptyInstance() => create();
  static $pb.PbList<GetCityRequest> createRepeated() =>
      $pb.PbList<GetCityRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCityRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCityRequest>(create);
  static GetCityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetCityResponse extends $pb.GeneratedMessage {
  factory GetCityResponse({
    $core.bool? success,
    $core.String? message,
    $core.int? cityId,
    $core.int? level,
    $core.Iterable<ResourceEntry>? resources,
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? upgrades,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (cityId != null) result.cityId = cityId;
    if (level != null) result.level = level;
    if (resources != null) result.resources.addAll(resources);
    if (upgrades != null) result.upgrades.addEntries(upgrades);
    return result;
  }

  GetCityResponse._();

  factory GetCityResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCityResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCityResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'cityId')
    ..aI(4, _omitFieldNames ? '' : 'level')
    ..pPM<ResourceEntry>(5, _omitFieldNames ? '' : 'resources',
        subBuilder: ResourceEntry.create)
    ..m<$core.String, $core.int>(6, _omitFieldNames ? '' : 'upgrades',
        entryClassName: 'GetCityResponse.UpgradesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3,
        packageName: const $pb.PackageName('city'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCityResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCityResponse copyWith(void Function(GetCityResponse) updates) =>
      super.copyWith((message) => updates(message as GetCityResponse))
          as GetCityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCityResponse create() => GetCityResponse._();
  @$core.override
  GetCityResponse createEmptyInstance() => create();
  static $pb.PbList<GetCityResponse> createRepeated() =>
      $pb.PbList<GetCityResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCityResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCityResponse>(create);
  static GetCityResponse? _defaultInstance;

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
  $core.int get cityId => $_getIZ(2);
  @$pb.TagNumber(3)
  set cityId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCityId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCityId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<ResourceEntry> get resources => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $core.int> get upgrades => $_getMap(5);
}

class ResourceEntry extends $pb.GeneratedMessage {
  factory ResourceEntry({
    $core.String? resourceType,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (resourceType != null) result.resourceType = resourceType;
    if (amount != null) result.amount = amount;
    return result;
  }

  ResourceEntry._();

  factory ResourceEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResourceEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'resourceType')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResourceEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResourceEntry copyWith(void Function(ResourceEntry) updates) =>
      super.copyWith((message) => updates(message as ResourceEntry))
          as ResourceEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceEntry create() => ResourceEntry._();
  @$core.override
  ResourceEntry createEmptyInstance() => create();
  static $pb.PbList<ResourceEntry> createRepeated() =>
      $pb.PbList<ResourceEntry>();
  @$core.pragma('dart2js:noInline')
  static ResourceEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceEntry>(create);
  static ResourceEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resourceType => $_getSZ(0);
  @$pb.TagNumber(1)
  set resourceType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResourceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

class UpgradeBuildingRequest extends $pb.GeneratedMessage {
  factory UpgradeBuildingRequest({
    $core.int? characterId,
    $core.String? upgradeCode,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (upgradeCode != null) result.upgradeCode = upgradeCode;
    return result;
  }

  UpgradeBuildingRequest._();

  factory UpgradeBuildingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpgradeBuildingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpgradeBuildingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'upgradeCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeBuildingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeBuildingRequest copyWith(
          void Function(UpgradeBuildingRequest) updates) =>
      super.copyWith((message) => updates(message as UpgradeBuildingRequest))
          as UpgradeBuildingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpgradeBuildingRequest create() => UpgradeBuildingRequest._();
  @$core.override
  UpgradeBuildingRequest createEmptyInstance() => create();
  static $pb.PbList<UpgradeBuildingRequest> createRepeated() =>
      $pb.PbList<UpgradeBuildingRequest>();
  @$core.pragma('dart2js:noInline')
  static UpgradeBuildingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgradeBuildingRequest>(create);
  static UpgradeBuildingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get upgradeCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set upgradeCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUpgradeCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpgradeCode() => $_clearField(2);
}

class UpgradeBuildingResponse extends $pb.GeneratedMessage {
  factory UpgradeBuildingResponse({
    $core.bool? success,
    $core.String? message,
    $core.int? newLevel,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (newLevel != null) result.newLevel = newLevel;
    return result;
  }

  UpgradeBuildingResponse._();

  factory UpgradeBuildingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpgradeBuildingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpgradeBuildingResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'newLevel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeBuildingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeBuildingResponse copyWith(
          void Function(UpgradeBuildingResponse) updates) =>
      super.copyWith((message) => updates(message as UpgradeBuildingResponse))
          as UpgradeBuildingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpgradeBuildingResponse create() => UpgradeBuildingResponse._();
  @$core.override
  UpgradeBuildingResponse createEmptyInstance() => create();
  static $pb.PbList<UpgradeBuildingResponse> createRepeated() =>
      $pb.PbList<UpgradeBuildingResponse>();
  @$core.pragma('dart2js:noInline')
  static UpgradeBuildingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgradeBuildingResponse>(create);
  static UpgradeBuildingResponse? _defaultInstance;

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
  $core.int get newLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set newLevel($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewLevel() => $_clearField(3);
}

class GetFoodRecipesRequest extends $pb.GeneratedMessage {
  factory GetFoodRecipesRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetFoodRecipesRequest._();

  factory GetFoodRecipesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFoodRecipesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFoodRecipesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFoodRecipesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFoodRecipesRequest copyWith(
          void Function(GetFoodRecipesRequest) updates) =>
      super.copyWith((message) => updates(message as GetFoodRecipesRequest))
          as GetFoodRecipesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFoodRecipesRequest create() => GetFoodRecipesRequest._();
  @$core.override
  GetFoodRecipesRequest createEmptyInstance() => create();
  static $pb.PbList<GetFoodRecipesRequest> createRepeated() =>
      $pb.PbList<GetFoodRecipesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFoodRecipesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFoodRecipesRequest>(create);
  static GetFoodRecipesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetFoodRecipesResponse extends $pb.GeneratedMessage {
  factory GetFoodRecipesResponse({
    $core.bool? success,
    $core.Iterable<FoodRecipe>? recipes,
    $core.int? activeFoodGoldPct,
    $core.int? activeFoodExpPct,
    $core.int? activeFoodLuckPct,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (recipes != null) result.recipes.addAll(recipes);
    if (activeFoodGoldPct != null) result.activeFoodGoldPct = activeFoodGoldPct;
    if (activeFoodExpPct != null) result.activeFoodExpPct = activeFoodExpPct;
    if (activeFoodLuckPct != null) result.activeFoodLuckPct = activeFoodLuckPct;
    return result;
  }

  GetFoodRecipesResponse._();

  factory GetFoodRecipesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFoodRecipesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFoodRecipesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pPM<FoodRecipe>(2, _omitFieldNames ? '' : 'recipes',
        subBuilder: FoodRecipe.create)
    ..aI(3, _omitFieldNames ? '' : 'activeFoodGoldPct')
    ..aI(4, _omitFieldNames ? '' : 'activeFoodExpPct')
    ..aI(5, _omitFieldNames ? '' : 'activeFoodLuckPct')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFoodRecipesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFoodRecipesResponse copyWith(
          void Function(GetFoodRecipesResponse) updates) =>
      super.copyWith((message) => updates(message as GetFoodRecipesResponse))
          as GetFoodRecipesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFoodRecipesResponse create() => GetFoodRecipesResponse._();
  @$core.override
  GetFoodRecipesResponse createEmptyInstance() => create();
  static $pb.PbList<GetFoodRecipesResponse> createRepeated() =>
      $pb.PbList<GetFoodRecipesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFoodRecipesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFoodRecipesResponse>(create);
  static GetFoodRecipesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<FoodRecipe> get recipes => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get activeFoodGoldPct => $_getIZ(2);
  @$pb.TagNumber(3)
  set activeFoodGoldPct($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasActiveFoodGoldPct() => $_has(2);
  @$pb.TagNumber(3)
  void clearActiveFoodGoldPct() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get activeFoodExpPct => $_getIZ(3);
  @$pb.TagNumber(4)
  set activeFoodExpPct($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasActiveFoodExpPct() => $_has(3);
  @$pb.TagNumber(4)
  void clearActiveFoodExpPct() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get activeFoodLuckPct => $_getIZ(4);
  @$pb.TagNumber(5)
  set activeFoodLuckPct($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasActiveFoodLuckPct() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveFoodLuckPct() => $_clearField(5);
}

class FoodRecipe extends $pb.GeneratedMessage {
  factory FoodRecipe({
    $core.int? id,
    $core.String? code,
    $core.String? name,
    $core.String? description,
    $core.String? costResource,
    $core.int? costAmount,
    $core.int? buffGoldPct,
    $core.int? buffExpPct,
    $core.int? buffLuckPct,
    $core.int? tier,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (costResource != null) result.costResource = costResource;
    if (costAmount != null) result.costAmount = costAmount;
    if (buffGoldPct != null) result.buffGoldPct = buffGoldPct;
    if (buffExpPct != null) result.buffExpPct = buffExpPct;
    if (buffLuckPct != null) result.buffLuckPct = buffLuckPct;
    if (tier != null) result.tier = tier;
    return result;
  }

  FoodRecipe._();

  factory FoodRecipe.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FoodRecipe.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FoodRecipe',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOS(5, _omitFieldNames ? '' : 'costResource')
    ..aI(6, _omitFieldNames ? '' : 'costAmount')
    ..aI(7, _omitFieldNames ? '' : 'buffGoldPct')
    ..aI(8, _omitFieldNames ? '' : 'buffExpPct')
    ..aI(9, _omitFieldNames ? '' : 'buffLuckPct')
    ..aI(10, _omitFieldNames ? '' : 'tier')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FoodRecipe clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FoodRecipe copyWith(void Function(FoodRecipe) updates) =>
      super.copyWith((message) => updates(message as FoodRecipe)) as FoodRecipe;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FoodRecipe create() => FoodRecipe._();
  @$core.override
  FoodRecipe createEmptyInstance() => create();
  static $pb.PbList<FoodRecipe> createRepeated() => $pb.PbList<FoodRecipe>();
  @$core.pragma('dart2js:noInline')
  static FoodRecipe getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FoodRecipe>(create);
  static FoodRecipe? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get costResource => $_getSZ(4);
  @$pb.TagNumber(5)
  set costResource($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCostResource() => $_has(4);
  @$pb.TagNumber(5)
  void clearCostResource() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get costAmount => $_getIZ(5);
  @$pb.TagNumber(6)
  set costAmount($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCostAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCostAmount() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get buffGoldPct => $_getIZ(6);
  @$pb.TagNumber(7)
  set buffGoldPct($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBuffGoldPct() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuffGoldPct() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get buffExpPct => $_getIZ(7);
  @$pb.TagNumber(8)
  set buffExpPct($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBuffExpPct() => $_has(7);
  @$pb.TagNumber(8)
  void clearBuffExpPct() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get buffLuckPct => $_getIZ(8);
  @$pb.TagNumber(9)
  set buffLuckPct($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasBuffLuckPct() => $_has(8);
  @$pb.TagNumber(9)
  void clearBuffLuckPct() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get tier => $_getIZ(9);
  @$pb.TagNumber(10)
  set tier($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTier() => $_has(9);
  @$pb.TagNumber(10)
  void clearTier() => $_clearField(10);
}

class BuyFoodRequest extends $pb.GeneratedMessage {
  factory BuyFoodRequest({
    $core.int? characterId,
    $core.String? foodCode,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (foodCode != null) result.foodCode = foodCode;
    return result;
  }

  BuyFoodRequest._();

  factory BuyFoodRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuyFoodRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuyFoodRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'foodCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyFoodRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyFoodRequest copyWith(void Function(BuyFoodRequest) updates) =>
      super.copyWith((message) => updates(message as BuyFoodRequest))
          as BuyFoodRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyFoodRequest create() => BuyFoodRequest._();
  @$core.override
  BuyFoodRequest createEmptyInstance() => create();
  static $pb.PbList<BuyFoodRequest> createRepeated() =>
      $pb.PbList<BuyFoodRequest>();
  @$core.pragma('dart2js:noInline')
  static BuyFoodRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyFoodRequest>(create);
  static BuyFoodRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get foodCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set foodCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFoodCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearFoodCode() => $_clearField(2);
}

class BuyFoodResponse extends $pb.GeneratedMessage {
  factory BuyFoodResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  BuyFoodResponse._();

  factory BuyFoodResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuyFoodResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuyFoodResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyFoodResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyFoodResponse copyWith(void Function(BuyFoodResponse) updates) =>
      super.copyWith((message) => updates(message as BuyFoodResponse))
          as BuyFoodResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyFoodResponse create() => BuyFoodResponse._();
  @$core.override
  BuyFoodResponse createEmptyInstance() => create();
  static $pb.PbList<BuyFoodResponse> createRepeated() =>
      $pb.PbList<BuyFoodResponse>();
  @$core.pragma('dart2js:noInline')
  static BuyFoodResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyFoodResponse>(create);
  static BuyFoodResponse? _defaultInstance;

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

class GetPotionRecipesRequest extends $pb.GeneratedMessage {
  factory GetPotionRecipesRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetPotionRecipesRequest._();

  factory GetPotionRecipesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPotionRecipesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPotionRecipesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPotionRecipesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPotionRecipesRequest copyWith(
          void Function(GetPotionRecipesRequest) updates) =>
      super.copyWith((message) => updates(message as GetPotionRecipesRequest))
          as GetPotionRecipesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPotionRecipesRequest create() => GetPotionRecipesRequest._();
  @$core.override
  GetPotionRecipesRequest createEmptyInstance() => create();
  static $pb.PbList<GetPotionRecipesRequest> createRepeated() =>
      $pb.PbList<GetPotionRecipesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPotionRecipesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPotionRecipesRequest>(create);
  static GetPotionRecipesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetPotionRecipesResponse extends $pb.GeneratedMessage {
  factory GetPotionRecipesResponse({
    $core.bool? success,
    $core.Iterable<PotionRecipe>? recipes,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (recipes != null) result.recipes.addAll(recipes);
    return result;
  }

  GetPotionRecipesResponse._();

  factory GetPotionRecipesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPotionRecipesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPotionRecipesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pPM<PotionRecipe>(2, _omitFieldNames ? '' : 'recipes',
        subBuilder: PotionRecipe.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPotionRecipesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPotionRecipesResponse copyWith(
          void Function(GetPotionRecipesResponse) updates) =>
      super.copyWith((message) => updates(message as GetPotionRecipesResponse))
          as GetPotionRecipesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPotionRecipesResponse create() => GetPotionRecipesResponse._();
  @$core.override
  GetPotionRecipesResponse createEmptyInstance() => create();
  static $pb.PbList<GetPotionRecipesResponse> createRepeated() =>
      $pb.PbList<GetPotionRecipesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPotionRecipesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPotionRecipesResponse>(create);
  static GetPotionRecipesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PotionRecipe> get recipes => $_getList(1);
}

class PotionRecipe extends $pb.GeneratedMessage {
  factory PotionRecipe({
    $core.int? id,
    $core.String? code,
    $core.String? name,
    $core.String? description,
    $core.int? tier,
    $core.String? costResource,
    $core.int? costAmount,
    $core.int? costGold,
    $core.int? rewardGold,
    $core.int? rewardExp,
    $core.String? rewardResource,
    $core.int? rewardResourceAmount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (tier != null) result.tier = tier;
    if (costResource != null) result.costResource = costResource;
    if (costAmount != null) result.costAmount = costAmount;
    if (costGold != null) result.costGold = costGold;
    if (rewardGold != null) result.rewardGold = rewardGold;
    if (rewardExp != null) result.rewardExp = rewardExp;
    if (rewardResource != null) result.rewardResource = rewardResource;
    if (rewardResourceAmount != null)
      result.rewardResourceAmount = rewardResourceAmount;
    return result;
  }

  PotionRecipe._();

  factory PotionRecipe.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PotionRecipe.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PotionRecipe',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aI(5, _omitFieldNames ? '' : 'tier')
    ..aOS(6, _omitFieldNames ? '' : 'costResource')
    ..aI(7, _omitFieldNames ? '' : 'costAmount')
    ..aI(8, _omitFieldNames ? '' : 'costGold')
    ..aI(9, _omitFieldNames ? '' : 'rewardGold')
    ..aI(10, _omitFieldNames ? '' : 'rewardExp')
    ..aOS(11, _omitFieldNames ? '' : 'rewardResource')
    ..aI(12, _omitFieldNames ? '' : 'rewardResourceAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PotionRecipe clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PotionRecipe copyWith(void Function(PotionRecipe) updates) =>
      super.copyWith((message) => updates(message as PotionRecipe))
          as PotionRecipe;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PotionRecipe create() => PotionRecipe._();
  @$core.override
  PotionRecipe createEmptyInstance() => create();
  static $pb.PbList<PotionRecipe> createRepeated() =>
      $pb.PbList<PotionRecipe>();
  @$core.pragma('dart2js:noInline')
  static PotionRecipe getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PotionRecipe>(create);
  static PotionRecipe? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get tier => $_getIZ(4);
  @$pb.TagNumber(5)
  set tier($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTier() => $_has(4);
  @$pb.TagNumber(5)
  void clearTier() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get costResource => $_getSZ(5);
  @$pb.TagNumber(6)
  set costResource($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCostResource() => $_has(5);
  @$pb.TagNumber(6)
  void clearCostResource() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get costAmount => $_getIZ(6);
  @$pb.TagNumber(7)
  set costAmount($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCostAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearCostAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get costGold => $_getIZ(7);
  @$pb.TagNumber(8)
  set costGold($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCostGold() => $_has(7);
  @$pb.TagNumber(8)
  void clearCostGold() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get rewardGold => $_getIZ(8);
  @$pb.TagNumber(9)
  set rewardGold($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRewardGold() => $_has(8);
  @$pb.TagNumber(9)
  void clearRewardGold() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get rewardExp => $_getIZ(9);
  @$pb.TagNumber(10)
  set rewardExp($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRewardExp() => $_has(9);
  @$pb.TagNumber(10)
  void clearRewardExp() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get rewardResource => $_getSZ(10);
  @$pb.TagNumber(11)
  set rewardResource($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRewardResource() => $_has(10);
  @$pb.TagNumber(11)
  void clearRewardResource() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get rewardResourceAmount => $_getIZ(11);
  @$pb.TagNumber(12)
  set rewardResourceAmount($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRewardResourceAmount() => $_has(11);
  @$pb.TagNumber(12)
  void clearRewardResourceAmount() => $_clearField(12);
}

class DrinkPotionRequest extends $pb.GeneratedMessage {
  factory DrinkPotionRequest({
    $core.int? characterId,
    $core.String? potionCode,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (potionCode != null) result.potionCode = potionCode;
    return result;
  }

  DrinkPotionRequest._();

  factory DrinkPotionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrinkPotionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrinkPotionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'potionCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrinkPotionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrinkPotionRequest copyWith(void Function(DrinkPotionRequest) updates) =>
      super.copyWith((message) => updates(message as DrinkPotionRequest))
          as DrinkPotionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrinkPotionRequest create() => DrinkPotionRequest._();
  @$core.override
  DrinkPotionRequest createEmptyInstance() => create();
  static $pb.PbList<DrinkPotionRequest> createRepeated() =>
      $pb.PbList<DrinkPotionRequest>();
  @$core.pragma('dart2js:noInline')
  static DrinkPotionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrinkPotionRequest>(create);
  static DrinkPotionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get potionCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set potionCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPotionCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearPotionCode() => $_clearField(2);
}

class DrinkPotionResponse extends $pb.GeneratedMessage {
  factory DrinkPotionResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  DrinkPotionResponse._();

  factory DrinkPotionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrinkPotionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrinkPotionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrinkPotionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrinkPotionResponse copyWith(void Function(DrinkPotionResponse) updates) =>
      super.copyWith((message) => updates(message as DrinkPotionResponse))
          as DrinkPotionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrinkPotionResponse create() => DrinkPotionResponse._();
  @$core.override
  DrinkPotionResponse createEmptyInstance() => create();
  static $pb.PbList<DrinkPotionResponse> createRepeated() =>
      $pb.PbList<DrinkPotionResponse>();
  @$core.pragma('dart2js:noInline')
  static DrinkPotionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrinkPotionResponse>(create);
  static DrinkPotionResponse? _defaultInstance;

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

class StartBarracksRequest extends $pb.GeneratedMessage {
  factory StartBarracksRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  StartBarracksRequest._();

  factory StartBarracksRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartBarracksRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartBarracksRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBarracksRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBarracksRequest copyWith(void Function(StartBarracksRequest) updates) =>
      super.copyWith((message) => updates(message as StartBarracksRequest))
          as StartBarracksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartBarracksRequest create() => StartBarracksRequest._();
  @$core.override
  StartBarracksRequest createEmptyInstance() => create();
  static $pb.PbList<StartBarracksRequest> createRepeated() =>
      $pb.PbList<StartBarracksRequest>();
  @$core.pragma('dart2js:noInline')
  static StartBarracksRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartBarracksRequest>(create);
  static StartBarracksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class StartBarracksResponse extends $pb.GeneratedMessage {
  factory StartBarracksResponse({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? endTime,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (endTime != null) result.endTime = endTime;
    return result;
  }

  StartBarracksResponse._();

  factory StartBarracksResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartBarracksResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartBarracksResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aInt64(3, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBarracksResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBarracksResponse copyWith(
          void Function(StartBarracksResponse) updates) =>
      super.copyWith((message) => updates(message as StartBarracksResponse))
          as StartBarracksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartBarracksResponse create() => StartBarracksResponse._();
  @$core.override
  StartBarracksResponse createEmptyInstance() => create();
  static $pb.PbList<StartBarracksResponse> createRepeated() =>
      $pb.PbList<StartBarracksResponse>();
  @$core.pragma('dart2js:noInline')
  static StartBarracksResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartBarracksResponse>(create);
  static StartBarracksResponse? _defaultInstance;

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
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => $_clearField(3);
}

class ClaimBarracksRequest extends $pb.GeneratedMessage {
  factory ClaimBarracksRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  ClaimBarracksRequest._();

  factory ClaimBarracksRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimBarracksRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimBarracksRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimBarracksRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimBarracksRequest copyWith(void Function(ClaimBarracksRequest) updates) =>
      super.copyWith((message) => updates(message as ClaimBarracksRequest))
          as ClaimBarracksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimBarracksRequest create() => ClaimBarracksRequest._();
  @$core.override
  ClaimBarracksRequest createEmptyInstance() => create();
  static $pb.PbList<ClaimBarracksRequest> createRepeated() =>
      $pb.PbList<ClaimBarracksRequest>();
  @$core.pragma('dart2js:noInline')
  static ClaimBarracksRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimBarracksRequest>(create);
  static ClaimBarracksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class ClaimBarracksResponse extends $pb.GeneratedMessage {
  factory ClaimBarracksResponse({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? goldEarned,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (goldEarned != null) result.goldEarned = goldEarned;
    return result;
  }

  ClaimBarracksResponse._();

  factory ClaimBarracksResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimBarracksResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimBarracksResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aInt64(3, _omitFieldNames ? '' : 'goldEarned')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimBarracksResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimBarracksResponse copyWith(
          void Function(ClaimBarracksResponse) updates) =>
      super.copyWith((message) => updates(message as ClaimBarracksResponse))
          as ClaimBarracksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimBarracksResponse create() => ClaimBarracksResponse._();
  @$core.override
  ClaimBarracksResponse createEmptyInstance() => create();
  static $pb.PbList<ClaimBarracksResponse> createRepeated() =>
      $pb.PbList<ClaimBarracksResponse>();
  @$core.pragma('dart2js:noInline')
  static ClaimBarracksResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimBarracksResponse>(create);
  static ClaimBarracksResponse? _defaultInstance;

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
  $fixnum.Int64 get goldEarned => $_getI64(2);
  @$pb.TagNumber(3)
  set goldEarned($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGoldEarned() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoldEarned() => $_clearField(3);
}

class GetRaidLogsRequest extends $pb.GeneratedMessage {
  factory GetRaidLogsRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetRaidLogsRequest._();

  factory GetRaidLogsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRaidLogsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRaidLogsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRaidLogsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRaidLogsRequest copyWith(void Function(GetRaidLogsRequest) updates) =>
      super.copyWith((message) => updates(message as GetRaidLogsRequest))
          as GetRaidLogsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRaidLogsRequest create() => GetRaidLogsRequest._();
  @$core.override
  GetRaidLogsRequest createEmptyInstance() => create();
  static $pb.PbList<GetRaidLogsRequest> createRepeated() =>
      $pb.PbList<GetRaidLogsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRaidLogsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRaidLogsRequest>(create);
  static GetRaidLogsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class RaidLog extends $pb.GeneratedMessage {
  factory RaidLog({
    $core.int? id,
    $core.int? raidPower,
    $core.int? wallDefense,
    $fixnum.Int64? resourcesLost,
    $core.String? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (raidPower != null) result.raidPower = raidPower;
    if (wallDefense != null) result.wallDefense = wallDefense;
    if (resourcesLost != null) result.resourcesLost = resourcesLost;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  RaidLog._();

  factory RaidLog.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RaidLog.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RaidLog',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'raidPower')
    ..aI(3, _omitFieldNames ? '' : 'wallDefense')
    ..aInt64(4, _omitFieldNames ? '' : 'resourcesLost')
    ..aOS(5, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaidLog clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaidLog copyWith(void Function(RaidLog) updates) =>
      super.copyWith((message) => updates(message as RaidLog)) as RaidLog;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaidLog create() => RaidLog._();
  @$core.override
  RaidLog createEmptyInstance() => create();
  static $pb.PbList<RaidLog> createRepeated() => $pb.PbList<RaidLog>();
  @$core.pragma('dart2js:noInline')
  static RaidLog getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RaidLog>(create);
  static RaidLog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get raidPower => $_getIZ(1);
  @$pb.TagNumber(2)
  set raidPower($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRaidPower() => $_has(1);
  @$pb.TagNumber(2)
  void clearRaidPower() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get wallDefense => $_getIZ(2);
  @$pb.TagNumber(3)
  set wallDefense($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWallDefense() => $_has(2);
  @$pb.TagNumber(3)
  void clearWallDefense() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get resourcesLost => $_getI64(3);
  @$pb.TagNumber(4)
  set resourcesLost($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasResourcesLost() => $_has(3);
  @$pb.TagNumber(4)
  void clearResourcesLost() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get createdAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set createdAt($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);
}

class GetRaidLogsResponse extends $pb.GeneratedMessage {
  factory GetRaidLogsResponse({
    $core.bool? success,
    $core.Iterable<RaidLog>? logs,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (logs != null) result.logs.addAll(logs);
    return result;
  }

  GetRaidLogsResponse._();

  factory GetRaidLogsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRaidLogsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRaidLogsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pPM<RaidLog>(2, _omitFieldNames ? '' : 'logs', subBuilder: RaidLog.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRaidLogsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRaidLogsResponse copyWith(void Function(GetRaidLogsResponse) updates) =>
      super.copyWith((message) => updates(message as GetRaidLogsResponse))
          as GetRaidLogsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRaidLogsResponse create() => GetRaidLogsResponse._();
  @$core.override
  GetRaidLogsResponse createEmptyInstance() => create();
  static $pb.PbList<GetRaidLogsResponse> createRepeated() =>
      $pb.PbList<GetRaidLogsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRaidLogsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRaidLogsResponse>(create);
  static GetRaidLogsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RaidLog> get logs => $_getList(1);
}

class GetLeaderboardRequest extends $pb.GeneratedMessage {
  factory GetLeaderboardRequest({
    $core.String? sortBy,
  }) {
    final result = create();
    if (sortBy != null) result.sortBy = sortBy;
    return result;
  }

  GetLeaderboardRequest._();

  factory GetLeaderboardRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLeaderboardRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLeaderboardRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sortBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLeaderboardRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLeaderboardRequest copyWith(
          void Function(GetLeaderboardRequest) updates) =>
      super.copyWith((message) => updates(message as GetLeaderboardRequest))
          as GetLeaderboardRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLeaderboardRequest create() => GetLeaderboardRequest._();
  @$core.override
  GetLeaderboardRequest createEmptyInstance() => create();
  static $pb.PbList<GetLeaderboardRequest> createRepeated() =>
      $pb.PbList<GetLeaderboardRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLeaderboardRequest>(create);
  static GetLeaderboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sortBy => $_getSZ(0);
  @$pb.TagNumber(1)
  set sortBy($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSortBy() => $_has(0);
  @$pb.TagNumber(1)
  void clearSortBy() => $_clearField(1);
}

class GetLeaderboardResponse extends $pb.GeneratedMessage {
  factory GetLeaderboardResponse({
    $core.bool? success,
    $core.Iterable<LeaderboardEntry>? entries,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (entries != null) result.entries.addAll(entries);
    return result;
  }

  GetLeaderboardResponse._();

  factory GetLeaderboardResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLeaderboardResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLeaderboardResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pPM<LeaderboardEntry>(2, _omitFieldNames ? '' : 'entries',
        subBuilder: LeaderboardEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLeaderboardResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLeaderboardResponse copyWith(
          void Function(GetLeaderboardResponse) updates) =>
      super.copyWith((message) => updates(message as GetLeaderboardResponse))
          as GetLeaderboardResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLeaderboardResponse create() => GetLeaderboardResponse._();
  @$core.override
  GetLeaderboardResponse createEmptyInstance() => create();
  static $pb.PbList<GetLeaderboardResponse> createRepeated() =>
      $pb.PbList<GetLeaderboardResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLeaderboardResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLeaderboardResponse>(create);
  static GetLeaderboardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<LeaderboardEntry> get entries => $_getList(1);
}

class LeaderboardEntry extends $pb.GeneratedMessage {
  factory LeaderboardEntry({
    $core.int? rank,
    $core.String? name,
    $core.int? level,
    $fixnum.Int64? totalTime,
    $core.String? classType,
    $core.int? characterId,
  }) {
    final result = create();
    if (rank != null) result.rank = rank;
    if (name != null) result.name = name;
    if (level != null) result.level = level;
    if (totalTime != null) result.totalTime = totalTime;
    if (classType != null) result.classType = classType;
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  LeaderboardEntry._();

  factory LeaderboardEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LeaderboardEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LeaderboardEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'rank')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'level')
    ..aInt64(4, _omitFieldNames ? '' : 'totalTime')
    ..aOS(5, _omitFieldNames ? '' : 'classType')
    ..aI(6, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaderboardEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaderboardEntry copyWith(void Function(LeaderboardEntry) updates) =>
      super.copyWith((message) => updates(message as LeaderboardEntry))
          as LeaderboardEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaderboardEntry create() => LeaderboardEntry._();
  @$core.override
  LeaderboardEntry createEmptyInstance() => create();
  static $pb.PbList<LeaderboardEntry> createRepeated() =>
      $pb.PbList<LeaderboardEntry>();
  @$core.pragma('dart2js:noInline')
  static LeaderboardEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaderboardEntry>(create);
  static LeaderboardEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalTime => $_getI64(3);
  @$pb.TagNumber(4)
  set totalTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get classType => $_getSZ(4);
  @$pb.TagNumber(5)
  set classType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClassType() => $_has(4);
  @$pb.TagNumber(5)
  void clearClassType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get characterId => $_getIZ(5);
  @$pb.TagNumber(6)
  set characterId($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCharacterId() => $_has(5);
  @$pb.TagNumber(6)
  void clearCharacterId() => $_clearField(6);
}

class SearchPlayerRequest extends $pb.GeneratedMessage {
  factory SearchPlayerRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  SearchPlayerRequest._();

  factory SearchPlayerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchPlayerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchPlayerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchPlayerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchPlayerRequest copyWith(void Function(SearchPlayerRequest) updates) =>
      super.copyWith((message) => updates(message as SearchPlayerRequest))
          as SearchPlayerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchPlayerRequest create() => SearchPlayerRequest._();
  @$core.override
  SearchPlayerRequest createEmptyInstance() => create();
  static $pb.PbList<SearchPlayerRequest> createRepeated() =>
      $pb.PbList<SearchPlayerRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchPlayerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchPlayerRequest>(create);
  static SearchPlayerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class SearchPlayerResponse extends $pb.GeneratedMessage {
  factory SearchPlayerResponse({
    $core.bool? success,
    $core.int? characterId,
    $core.String? name,
    $core.int? level,
    $core.String? classType,
    $core.int? clanId,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (characterId != null) result.characterId = characterId;
    if (name != null) result.name = name;
    if (level != null) result.level = level;
    if (classType != null) result.classType = classType;
    if (clanId != null) result.clanId = clanId;
    return result;
  }

  SearchPlayerResponse._();

  factory SearchPlayerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchPlayerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchPlayerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'characterId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aI(4, _omitFieldNames ? '' : 'level')
    ..aOS(5, _omitFieldNames ? '' : 'classType')
    ..aI(6, _omitFieldNames ? '' : 'clanId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchPlayerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchPlayerResponse copyWith(void Function(SearchPlayerResponse) updates) =>
      super.copyWith((message) => updates(message as SearchPlayerResponse))
          as SearchPlayerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchPlayerResponse create() => SearchPlayerResponse._();
  @$core.override
  SearchPlayerResponse createEmptyInstance() => create();
  static $pb.PbList<SearchPlayerResponse> createRepeated() =>
      $pb.PbList<SearchPlayerResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchPlayerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchPlayerResponse>(create);
  static SearchPlayerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get characterId => $_getIZ(1);
  @$pb.TagNumber(2)
  set characterId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCharacterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacterId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get classType => $_getSZ(4);
  @$pb.TagNumber(5)
  set classType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClassType() => $_has(4);
  @$pb.TagNumber(5)
  void clearClassType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get clanId => $_getIZ(5);
  @$pb.TagNumber(6)
  set clanId($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasClanId() => $_has(5);
  @$pb.TagNumber(6)
  void clearClanId() => $_clearField(6);
}

class AddFriendRequest extends $pb.GeneratedMessage {
  factory AddFriendRequest({
    $core.int? characterId,
    $core.int? targetId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (targetId != null) result.targetId = targetId;
    return result;
  }

  AddFriendRequest._();

  factory AddFriendRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddFriendRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddFriendRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'targetId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddFriendRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddFriendRequest copyWith(void Function(AddFriendRequest) updates) =>
      super.copyWith((message) => updates(message as AddFriendRequest))
          as AddFriendRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddFriendRequest create() => AddFriendRequest._();
  @$core.override
  AddFriendRequest createEmptyInstance() => create();
  static $pb.PbList<AddFriendRequest> createRepeated() =>
      $pb.PbList<AddFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static AddFriendRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddFriendRequest>(create);
  static AddFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetId => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => $_clearField(2);
}

class AddFriendResponse extends $pb.GeneratedMessage {
  factory AddFriendResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  AddFriendResponse._();

  factory AddFriendResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddFriendResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddFriendResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddFriendResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddFriendResponse copyWith(void Function(AddFriendResponse) updates) =>
      super.copyWith((message) => updates(message as AddFriendResponse))
          as AddFriendResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddFriendResponse create() => AddFriendResponse._();
  @$core.override
  AddFriendResponse createEmptyInstance() => create();
  static $pb.PbList<AddFriendResponse> createRepeated() =>
      $pb.PbList<AddFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static AddFriendResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddFriendResponse>(create);
  static AddFriendResponse? _defaultInstance;

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

class FriendEntry extends $pb.GeneratedMessage {
  factory FriendEntry({
    $core.int? characterId,
    $core.String? name,
    $core.int? level,
    $core.String? status,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (name != null) result.name = name;
    if (level != null) result.level = level;
    if (status != null) result.status = status;
    return result;
  }

  FriendEntry._();

  factory FriendEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FriendEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FriendEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'level')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendEntry copyWith(void Function(FriendEntry) updates) =>
      super.copyWith((message) => updates(message as FriendEntry))
          as FriendEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FriendEntry create() => FriendEntry._();
  @$core.override
  FriendEntry createEmptyInstance() => create();
  static $pb.PbList<FriendEntry> createRepeated() => $pb.PbList<FriendEntry>();
  @$core.pragma('dart2js:noInline')
  static FriendEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendEntry>(create);
  static FriendEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);
}

class GetFriendsRequest extends $pb.GeneratedMessage {
  factory GetFriendsRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetFriendsRequest._();

  factory GetFriendsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFriendsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFriendsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFriendsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFriendsRequest copyWith(void Function(GetFriendsRequest) updates) =>
      super.copyWith((message) => updates(message as GetFriendsRequest))
          as GetFriendsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFriendsRequest create() => GetFriendsRequest._();
  @$core.override
  GetFriendsRequest createEmptyInstance() => create();
  static $pb.PbList<GetFriendsRequest> createRepeated() =>
      $pb.PbList<GetFriendsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFriendsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFriendsRequest>(create);
  static GetFriendsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetFriendsResponse extends $pb.GeneratedMessage {
  factory GetFriendsResponse({
    $core.bool? success,
    $core.Iterable<FriendEntry>? friends,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (friends != null) result.friends.addAll(friends);
    return result;
  }

  GetFriendsResponse._();

  factory GetFriendsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetFriendsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFriendsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pPM<FriendEntry>(2, _omitFieldNames ? '' : 'friends',
        subBuilder: FriendEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFriendsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetFriendsResponse copyWith(void Function(GetFriendsResponse) updates) =>
      super.copyWith((message) => updates(message as GetFriendsResponse))
          as GetFriendsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFriendsResponse create() => GetFriendsResponse._();
  @$core.override
  GetFriendsResponse createEmptyInstance() => create();
  static $pb.PbList<GetFriendsResponse> createRepeated() =>
      $pb.PbList<GetFriendsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFriendsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFriendsResponse>(create);
  static GetFriendsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<FriendEntry> get friends => $_getList(1);
}

class AcceptFriendRequest extends $pb.GeneratedMessage {
  factory AcceptFriendRequest({
    $core.int? characterId,
    $core.int? requesterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (requesterId != null) result.requesterId = requesterId;
    return result;
  }

  AcceptFriendRequest._();

  factory AcceptFriendRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AcceptFriendRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AcceptFriendRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'requesterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptFriendRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptFriendRequest copyWith(void Function(AcceptFriendRequest) updates) =>
      super.copyWith((message) => updates(message as AcceptFriendRequest))
          as AcceptFriendRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptFriendRequest create() => AcceptFriendRequest._();
  @$core.override
  AcceptFriendRequest createEmptyInstance() => create();
  static $pb.PbList<AcceptFriendRequest> createRepeated() =>
      $pb.PbList<AcceptFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static AcceptFriendRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AcceptFriendRequest>(create);
  static AcceptFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get requesterId => $_getIZ(1);
  @$pb.TagNumber(2)
  set requesterId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequesterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequesterId() => $_clearField(2);
}

class AcceptFriendResponse extends $pb.GeneratedMessage {
  factory AcceptFriendResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  AcceptFriendResponse._();

  factory AcceptFriendResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AcceptFriendResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AcceptFriendResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptFriendResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptFriendResponse copyWith(void Function(AcceptFriendResponse) updates) =>
      super.copyWith((message) => updates(message as AcceptFriendResponse))
          as AcceptFriendResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptFriendResponse create() => AcceptFriendResponse._();
  @$core.override
  AcceptFriendResponse createEmptyInstance() => create();
  static $pb.PbList<AcceptFriendResponse> createRepeated() =>
      $pb.PbList<AcceptFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static AcceptFriendResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AcceptFriendResponse>(create);
  static AcceptFriendResponse? _defaultInstance;

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

class CreateClanRequest extends $pb.GeneratedMessage {
  factory CreateClanRequest({
    $core.int? characterId,
    $core.String? clanName,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (clanName != null) result.clanName = clanName;
    return result;
  }

  CreateClanRequest._();

  factory CreateClanRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateClanRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateClanRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'clanName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateClanRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateClanRequest copyWith(void Function(CreateClanRequest) updates) =>
      super.copyWith((message) => updates(message as CreateClanRequest))
          as CreateClanRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateClanRequest create() => CreateClanRequest._();
  @$core.override
  CreateClanRequest createEmptyInstance() => create();
  static $pb.PbList<CreateClanRequest> createRepeated() =>
      $pb.PbList<CreateClanRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateClanRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateClanRequest>(create);
  static CreateClanRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clanName => $_getSZ(1);
  @$pb.TagNumber(2)
  set clanName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClanName() => $_has(1);
  @$pb.TagNumber(2)
  void clearClanName() => $_clearField(2);
}

class CreateClanResponse extends $pb.GeneratedMessage {
  factory CreateClanResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  CreateClanResponse._();

  factory CreateClanResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateClanResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateClanResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateClanResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateClanResponse copyWith(void Function(CreateClanResponse) updates) =>
      super.copyWith((message) => updates(message as CreateClanResponse))
          as CreateClanResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateClanResponse create() => CreateClanResponse._();
  @$core.override
  CreateClanResponse createEmptyInstance() => create();
  static $pb.PbList<CreateClanResponse> createRepeated() =>
      $pb.PbList<CreateClanResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateClanResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateClanResponse>(create);
  static CreateClanResponse? _defaultInstance;

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

class JoinClanRequest extends $pb.GeneratedMessage {
  factory JoinClanRequest({
    $core.int? characterId,
    $core.int? clanId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (clanId != null) result.clanId = clanId;
    return result;
  }

  JoinClanRequest._();

  factory JoinClanRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinClanRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinClanRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'clanId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinClanRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinClanRequest copyWith(void Function(JoinClanRequest) updates) =>
      super.copyWith((message) => updates(message as JoinClanRequest))
          as JoinClanRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinClanRequest create() => JoinClanRequest._();
  @$core.override
  JoinClanRequest createEmptyInstance() => create();
  static $pb.PbList<JoinClanRequest> createRepeated() =>
      $pb.PbList<JoinClanRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinClanRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinClanRequest>(create);
  static JoinClanRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get clanId => $_getIZ(1);
  @$pb.TagNumber(2)
  set clanId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClanId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClanId() => $_clearField(2);
}

class JoinClanResponse extends $pb.GeneratedMessage {
  factory JoinClanResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  JoinClanResponse._();

  factory JoinClanResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinClanResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinClanResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinClanResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinClanResponse copyWith(void Function(JoinClanResponse) updates) =>
      super.copyWith((message) => updates(message as JoinClanResponse))
          as JoinClanResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinClanResponse create() => JoinClanResponse._();
  @$core.override
  JoinClanResponse createEmptyInstance() => create();
  static $pb.PbList<JoinClanResponse> createRepeated() =>
      $pb.PbList<JoinClanResponse>();
  @$core.pragma('dart2js:noInline')
  static JoinClanResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinClanResponse>(create);
  static JoinClanResponse? _defaultInstance;

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

class GetClanInfoRequest extends $pb.GeneratedMessage {
  factory GetClanInfoRequest({
    $core.int? clanId,
  }) {
    final result = create();
    if (clanId != null) result.clanId = clanId;
    return result;
  }

  GetClanInfoRequest._();

  factory GetClanInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetClanInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetClanInfoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'clanId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanInfoRequest copyWith(void Function(GetClanInfoRequest) updates) =>
      super.copyWith((message) => updates(message as GetClanInfoRequest))
          as GetClanInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClanInfoRequest create() => GetClanInfoRequest._();
  @$core.override
  GetClanInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetClanInfoRequest> createRepeated() =>
      $pb.PbList<GetClanInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetClanInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetClanInfoRequest>(create);
  static GetClanInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clanId => $_getIZ(0);
  @$pb.TagNumber(1)
  set clanId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClanId() => $_clearField(1);
}

class GetClanInfoResponse extends $pb.GeneratedMessage {
  factory GetClanInfoResponse({
    $core.bool? success,
    $core.String? name,
    $core.String? leaderName,
    $core.Iterable<FriendEntry>? members,
    $fixnum.Int64? bankGold,
    $core.String? activeBuff,
    $fixnum.Int64? buffExpiresAt,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (name != null) result.name = name;
    if (leaderName != null) result.leaderName = leaderName;
    if (members != null) result.members.addAll(members);
    if (bankGold != null) result.bankGold = bankGold;
    if (activeBuff != null) result.activeBuff = activeBuff;
    if (buffExpiresAt != null) result.buffExpiresAt = buffExpiresAt;
    return result;
  }

  GetClanInfoResponse._();

  factory GetClanInfoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetClanInfoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetClanInfoResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'leaderName')
    ..pPM<FriendEntry>(4, _omitFieldNames ? '' : 'members',
        subBuilder: FriendEntry.create)
    ..aInt64(5, _omitFieldNames ? '' : 'bankGold')
    ..aOS(6, _omitFieldNames ? '' : 'activeBuff')
    ..aInt64(7, _omitFieldNames ? '' : 'buffExpiresAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanInfoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanInfoResponse copyWith(void Function(GetClanInfoResponse) updates) =>
      super.copyWith((message) => updates(message as GetClanInfoResponse))
          as GetClanInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClanInfoResponse create() => GetClanInfoResponse._();
  @$core.override
  GetClanInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetClanInfoResponse> createRepeated() =>
      $pb.PbList<GetClanInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetClanInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetClanInfoResponse>(create);
  static GetClanInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get leaderName => $_getSZ(2);
  @$pb.TagNumber(3)
  set leaderName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaderName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<FriendEntry> get members => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get bankGold => $_getI64(4);
  @$pb.TagNumber(5)
  set bankGold($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBankGold() => $_has(4);
  @$pb.TagNumber(5)
  void clearBankGold() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get activeBuff => $_getSZ(5);
  @$pb.TagNumber(6)
  set activeBuff($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasActiveBuff() => $_has(5);
  @$pb.TagNumber(6)
  void clearActiveBuff() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get buffExpiresAt => $_getI64(6);
  @$pb.TagNumber(7)
  set buffExpiresAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBuffExpiresAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuffExpiresAt() => $_clearField(7);
}

class SearchClanRequest extends $pb.GeneratedMessage {
  factory SearchClanRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  SearchClanRequest._();

  factory SearchClanRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchClanRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchClanRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchClanRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchClanRequest copyWith(void Function(SearchClanRequest) updates) =>
      super.copyWith((message) => updates(message as SearchClanRequest))
          as SearchClanRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchClanRequest create() => SearchClanRequest._();
  @$core.override
  SearchClanRequest createEmptyInstance() => create();
  static $pb.PbList<SearchClanRequest> createRepeated() =>
      $pb.PbList<SearchClanRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchClanRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchClanRequest>(create);
  static SearchClanRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class SearchClanResponse extends $pb.GeneratedMessage {
  factory SearchClanResponse({
    $core.bool? success,
    $core.int? clanId,
    $core.String? name,
    $core.String? leaderName,
    $core.int? memberCount,
    $fixnum.Int64? totalLevels,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (clanId != null) result.clanId = clanId;
    if (name != null) result.name = name;
    if (leaderName != null) result.leaderName = leaderName;
    if (memberCount != null) result.memberCount = memberCount;
    if (totalLevels != null) result.totalLevels = totalLevels;
    return result;
  }

  SearchClanResponse._();

  factory SearchClanResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchClanResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchClanResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'clanId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'leaderName')
    ..aI(5, _omitFieldNames ? '' : 'memberCount')
    ..aInt64(6, _omitFieldNames ? '' : 'totalLevels')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchClanResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchClanResponse copyWith(void Function(SearchClanResponse) updates) =>
      super.copyWith((message) => updates(message as SearchClanResponse))
          as SearchClanResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchClanResponse create() => SearchClanResponse._();
  @$core.override
  SearchClanResponse createEmptyInstance() => create();
  static $pb.PbList<SearchClanResponse> createRepeated() =>
      $pb.PbList<SearchClanResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchClanResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchClanResponse>(create);
  static SearchClanResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get clanId => $_getIZ(1);
  @$pb.TagNumber(2)
  set clanId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClanId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClanId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get leaderName => $_getSZ(3);
  @$pb.TagNumber(4)
  set leaderName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeaderName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeaderName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get memberCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set memberCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMemberCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearMemberCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalLevels => $_getI64(5);
  @$pb.TagNumber(6)
  set totalLevels($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalLevels() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalLevels() => $_clearField(6);
}

class GetClanLeaderboardRequest extends $pb.GeneratedMessage {
  factory GetClanLeaderboardRequest() => create();

  GetClanLeaderboardRequest._();

  factory GetClanLeaderboardRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetClanLeaderboardRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetClanLeaderboardRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanLeaderboardRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanLeaderboardRequest copyWith(
          void Function(GetClanLeaderboardRequest) updates) =>
      super.copyWith((message) => updates(message as GetClanLeaderboardRequest))
          as GetClanLeaderboardRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClanLeaderboardRequest create() => GetClanLeaderboardRequest._();
  @$core.override
  GetClanLeaderboardRequest createEmptyInstance() => create();
  static $pb.PbList<GetClanLeaderboardRequest> createRepeated() =>
      $pb.PbList<GetClanLeaderboardRequest>();
  @$core.pragma('dart2js:noInline')
  static GetClanLeaderboardRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetClanLeaderboardRequest>(create);
  static GetClanLeaderboardRequest? _defaultInstance;
}

class ClanEntry extends $pb.GeneratedMessage {
  factory ClanEntry({
    $core.int? clanId,
    $core.String? name,
    $core.int? memberCount,
    $fixnum.Int64? totalLevels,
  }) {
    final result = create();
    if (clanId != null) result.clanId = clanId;
    if (name != null) result.name = name;
    if (memberCount != null) result.memberCount = memberCount;
    if (totalLevels != null) result.totalLevels = totalLevels;
    return result;
  }

  ClanEntry._();

  factory ClanEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClanEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClanEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'clanId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'memberCount')
    ..aInt64(4, _omitFieldNames ? '' : 'totalLevels')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClanEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClanEntry copyWith(void Function(ClanEntry) updates) =>
      super.copyWith((message) => updates(message as ClanEntry)) as ClanEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClanEntry create() => ClanEntry._();
  @$core.override
  ClanEntry createEmptyInstance() => create();
  static $pb.PbList<ClanEntry> createRepeated() => $pb.PbList<ClanEntry>();
  @$core.pragma('dart2js:noInline')
  static ClanEntry getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClanEntry>(create);
  static ClanEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clanId => $_getIZ(0);
  @$pb.TagNumber(1)
  set clanId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClanId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClanId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get memberCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set memberCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMemberCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemberCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalLevels => $_getI64(3);
  @$pb.TagNumber(4)
  set totalLevels($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalLevels() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalLevels() => $_clearField(4);
}

class GetClanLeaderboardResponse extends $pb.GeneratedMessage {
  factory GetClanLeaderboardResponse({
    $core.bool? success,
    $core.Iterable<ClanEntry>? clans,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (clans != null) result.clans.addAll(clans);
    return result;
  }

  GetClanLeaderboardResponse._();

  factory GetClanLeaderboardResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetClanLeaderboardResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetClanLeaderboardResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pPM<ClanEntry>(2, _omitFieldNames ? '' : 'clans',
        subBuilder: ClanEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanLeaderboardResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClanLeaderboardResponse copyWith(
          void Function(GetClanLeaderboardResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetClanLeaderboardResponse))
          as GetClanLeaderboardResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClanLeaderboardResponse create() => GetClanLeaderboardResponse._();
  @$core.override
  GetClanLeaderboardResponse createEmptyInstance() => create();
  static $pb.PbList<GetClanLeaderboardResponse> createRepeated() =>
      $pb.PbList<GetClanLeaderboardResponse>();
  @$core.pragma('dart2js:noInline')
  static GetClanLeaderboardResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetClanLeaderboardResponse>(create);
  static GetClanLeaderboardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ClanEntry> get clans => $_getList(1);
}

class CreateCoopGroupRequest extends $pb.GeneratedMessage {
  factory CreateCoopGroupRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  CreateCoopGroupRequest._();

  factory CreateCoopGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCoopGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCoopGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCoopGroupRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCoopGroupRequest copyWith(
          void Function(CreateCoopGroupRequest) updates) =>
      super.copyWith((message) => updates(message as CreateCoopGroupRequest))
          as CreateCoopGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCoopGroupRequest create() => CreateCoopGroupRequest._();
  @$core.override
  CreateCoopGroupRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCoopGroupRequest> createRepeated() =>
      $pb.PbList<CreateCoopGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCoopGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCoopGroupRequest>(create);
  static CreateCoopGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class CreateCoopGroupResponse extends $pb.GeneratedMessage {
  factory CreateCoopGroupResponse({
    $core.bool? success,
    $core.String? message,
    $core.int? groupId,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  CreateCoopGroupResponse._();

  factory CreateCoopGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCoopGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCoopGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCoopGroupResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCoopGroupResponse copyWith(
          void Function(CreateCoopGroupResponse) updates) =>
      super.copyWith((message) => updates(message as CreateCoopGroupResponse))
          as CreateCoopGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCoopGroupResponse create() => CreateCoopGroupResponse._();
  @$core.override
  CreateCoopGroupResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCoopGroupResponse> createRepeated() =>
      $pb.PbList<CreateCoopGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCoopGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCoopGroupResponse>(create);
  static CreateCoopGroupResponse? _defaultInstance;

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
  $core.int get groupId => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => $_clearField(3);
}

class JoinCoopGroupRequest extends $pb.GeneratedMessage {
  factory JoinCoopGroupRequest({
    $core.int? characterId,
    $core.int? leaderId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (leaderId != null) result.leaderId = leaderId;
    return result;
  }

  JoinCoopGroupRequest._();

  factory JoinCoopGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinCoopGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinCoopGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'leaderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinCoopGroupRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinCoopGroupRequest copyWith(void Function(JoinCoopGroupRequest) updates) =>
      super.copyWith((message) => updates(message as JoinCoopGroupRequest))
          as JoinCoopGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinCoopGroupRequest create() => JoinCoopGroupRequest._();
  @$core.override
  JoinCoopGroupRequest createEmptyInstance() => create();
  static $pb.PbList<JoinCoopGroupRequest> createRepeated() =>
      $pb.PbList<JoinCoopGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinCoopGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinCoopGroupRequest>(create);
  static JoinCoopGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get leaderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set leaderId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLeaderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeaderId() => $_clearField(2);
}

class JoinCoopGroupResponse extends $pb.GeneratedMessage {
  factory JoinCoopGroupResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  JoinCoopGroupResponse._();

  factory JoinCoopGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinCoopGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinCoopGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinCoopGroupResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinCoopGroupResponse copyWith(
          void Function(JoinCoopGroupResponse) updates) =>
      super.copyWith((message) => updates(message as JoinCoopGroupResponse))
          as JoinCoopGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinCoopGroupResponse create() => JoinCoopGroupResponse._();
  @$core.override
  JoinCoopGroupResponse createEmptyInstance() => create();
  static $pb.PbList<JoinCoopGroupResponse> createRepeated() =>
      $pb.PbList<JoinCoopGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static JoinCoopGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinCoopGroupResponse>(create);
  static JoinCoopGroupResponse? _defaultInstance;

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

class LeaveCoopGroupRequest extends $pb.GeneratedMessage {
  factory LeaveCoopGroupRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  LeaveCoopGroupRequest._();

  factory LeaveCoopGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LeaveCoopGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LeaveCoopGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaveCoopGroupRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaveCoopGroupRequest copyWith(
          void Function(LeaveCoopGroupRequest) updates) =>
      super.copyWith((message) => updates(message as LeaveCoopGroupRequest))
          as LeaveCoopGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveCoopGroupRequest create() => LeaveCoopGroupRequest._();
  @$core.override
  LeaveCoopGroupRequest createEmptyInstance() => create();
  static $pb.PbList<LeaveCoopGroupRequest> createRepeated() =>
      $pb.PbList<LeaveCoopGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaveCoopGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaveCoopGroupRequest>(create);
  static LeaveCoopGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class LeaveCoopGroupResponse extends $pb.GeneratedMessage {
  factory LeaveCoopGroupResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  LeaveCoopGroupResponse._();

  factory LeaveCoopGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LeaveCoopGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LeaveCoopGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaveCoopGroupResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaveCoopGroupResponse copyWith(
          void Function(LeaveCoopGroupResponse) updates) =>
      super.copyWith((message) => updates(message as LeaveCoopGroupResponse))
          as LeaveCoopGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveCoopGroupResponse create() => LeaveCoopGroupResponse._();
  @$core.override
  LeaveCoopGroupResponse createEmptyInstance() => create();
  static $pb.PbList<LeaveCoopGroupResponse> createRepeated() =>
      $pb.PbList<LeaveCoopGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static LeaveCoopGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaveCoopGroupResponse>(create);
  static LeaveCoopGroupResponse? _defaultInstance;

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

class CoopMember extends $pb.GeneratedMessage {
  factory CoopMember({
    $core.int? characterId,
    $core.String? name,
    $core.int? level,
    $core.bool? isReady,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (name != null) result.name = name;
    if (level != null) result.level = level;
    if (isReady != null) result.isReady = isReady;
    return result;
  }

  CoopMember._();

  factory CoopMember.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CoopMember.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CoopMember',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'level')
    ..aOB(4, _omitFieldNames ? '' : 'isReady')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CoopMember clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CoopMember copyWith(void Function(CoopMember) updates) =>
      super.copyWith((message) => updates(message as CoopMember)) as CoopMember;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CoopMember create() => CoopMember._();
  @$core.override
  CoopMember createEmptyInstance() => create();
  static $pb.PbList<CoopMember> createRepeated() => $pb.PbList<CoopMember>();
  @$core.pragma('dart2js:noInline')
  static CoopMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CoopMember>(create);
  static CoopMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isReady => $_getBF(3);
  @$pb.TagNumber(4)
  set isReady($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsReady() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsReady() => $_clearField(4);
}

class GetCoopGroupRequest extends $pb.GeneratedMessage {
  factory GetCoopGroupRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetCoopGroupRequest._();

  factory GetCoopGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCoopGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCoopGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoopGroupRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoopGroupRequest copyWith(void Function(GetCoopGroupRequest) updates) =>
      super.copyWith((message) => updates(message as GetCoopGroupRequest))
          as GetCoopGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCoopGroupRequest create() => GetCoopGroupRequest._();
  @$core.override
  GetCoopGroupRequest createEmptyInstance() => create();
  static $pb.PbList<GetCoopGroupRequest> createRepeated() =>
      $pb.PbList<GetCoopGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCoopGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCoopGroupRequest>(create);
  static GetCoopGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetCoopGroupResponse extends $pb.GeneratedMessage {
  factory GetCoopGroupResponse({
    $core.bool? success,
    $core.bool? inGroup,
    $core.int? groupId,
    $core.int? leaderId,
    $core.Iterable<CoopMember>? members,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (inGroup != null) result.inGroup = inGroup;
    if (groupId != null) result.groupId = groupId;
    if (leaderId != null) result.leaderId = leaderId;
    if (members != null) result.members.addAll(members);
    return result;
  }

  GetCoopGroupResponse._();

  factory GetCoopGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCoopGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCoopGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOB(2, _omitFieldNames ? '' : 'inGroup')
    ..aI(3, _omitFieldNames ? '' : 'groupId')
    ..aI(4, _omitFieldNames ? '' : 'leaderId')
    ..pPM<CoopMember>(5, _omitFieldNames ? '' : 'members',
        subBuilder: CoopMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoopGroupResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCoopGroupResponse copyWith(void Function(GetCoopGroupResponse) updates) =>
      super.copyWith((message) => updates(message as GetCoopGroupResponse))
          as GetCoopGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCoopGroupResponse create() => GetCoopGroupResponse._();
  @$core.override
  GetCoopGroupResponse createEmptyInstance() => create();
  static $pb.PbList<GetCoopGroupResponse> createRepeated() =>
      $pb.PbList<GetCoopGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCoopGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCoopGroupResponse>(create);
  static GetCoopGroupResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get inGroup => $_getBF(1);
  @$pb.TagNumber(2)
  set inGroup($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearInGroup() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get groupId => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get leaderId => $_getIZ(3);
  @$pb.TagNumber(4)
  set leaderId($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeaderId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeaderId() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<CoopMember> get members => $_getList(4);
}

class SetReadyRequest extends $pb.GeneratedMessage {
  factory SetReadyRequest({
    $core.int? characterId,
    $core.bool? isReady,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (isReady != null) result.isReady = isReady;
    return result;
  }

  SetReadyRequest._();

  factory SetReadyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetReadyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetReadyRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOB(2, _omitFieldNames ? '' : 'isReady')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetReadyRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetReadyRequest copyWith(void Function(SetReadyRequest) updates) =>
      super.copyWith((message) => updates(message as SetReadyRequest))
          as SetReadyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetReadyRequest create() => SetReadyRequest._();
  @$core.override
  SetReadyRequest createEmptyInstance() => create();
  static $pb.PbList<SetReadyRequest> createRepeated() =>
      $pb.PbList<SetReadyRequest>();
  @$core.pragma('dart2js:noInline')
  static SetReadyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetReadyRequest>(create);
  static SetReadyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isReady => $_getBF(1);
  @$pb.TagNumber(2)
  set isReady($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsReady() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsReady() => $_clearField(2);
}

class SetReadyResponse extends $pb.GeneratedMessage {
  factory SetReadyResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  SetReadyResponse._();

  factory SetReadyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetReadyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetReadyResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetReadyResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetReadyResponse copyWith(void Function(SetReadyResponse) updates) =>
      super.copyWith((message) => updates(message as SetReadyResponse))
          as SetReadyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetReadyResponse create() => SetReadyResponse._();
  @$core.override
  SetReadyResponse createEmptyInstance() => create();
  static $pb.PbList<SetReadyResponse> createRepeated() =>
      $pb.PbList<SetReadyResponse>();
  @$core.pragma('dart2js:noInline')
  static SetReadyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetReadyResponse>(create);
  static SetReadyResponse? _defaultInstance;

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

class DepositClanGoldRequest extends $pb.GeneratedMessage {
  factory DepositClanGoldRequest({
    $core.int? characterId,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (amount != null) result.amount = amount;
    return result;
  }

  DepositClanGoldRequest._();

  factory DepositClanGoldRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DepositClanGoldRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DepositClanGoldRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositClanGoldRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositClanGoldRequest copyWith(
          void Function(DepositClanGoldRequest) updates) =>
      super.copyWith((message) => updates(message as DepositClanGoldRequest))
          as DepositClanGoldRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DepositClanGoldRequest create() => DepositClanGoldRequest._();
  @$core.override
  DepositClanGoldRequest createEmptyInstance() => create();
  static $pb.PbList<DepositClanGoldRequest> createRepeated() =>
      $pb.PbList<DepositClanGoldRequest>();
  @$core.pragma('dart2js:noInline')
  static DepositClanGoldRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DepositClanGoldRequest>(create);
  static DepositClanGoldRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

class DepositClanGoldResponse extends $pb.GeneratedMessage {
  factory DepositClanGoldResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  DepositClanGoldResponse._();

  factory DepositClanGoldResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DepositClanGoldResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DepositClanGoldResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositClanGoldResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositClanGoldResponse copyWith(
          void Function(DepositClanGoldResponse) updates) =>
      super.copyWith((message) => updates(message as DepositClanGoldResponse))
          as DepositClanGoldResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DepositClanGoldResponse create() => DepositClanGoldResponse._();
  @$core.override
  DepositClanGoldResponse createEmptyInstance() => create();
  static $pb.PbList<DepositClanGoldResponse> createRepeated() =>
      $pb.PbList<DepositClanGoldResponse>();
  @$core.pragma('dart2js:noInline')
  static DepositClanGoldResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DepositClanGoldResponse>(create);
  static DepositClanGoldResponse? _defaultInstance;

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

class BuyClanBuffRequest extends $pb.GeneratedMessage {
  factory BuyClanBuffRequest({
    $core.int? characterId,
    $core.String? buffCode,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (buffCode != null) result.buffCode = buffCode;
    return result;
  }

  BuyClanBuffRequest._();

  factory BuyClanBuffRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuyClanBuffRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuyClanBuffRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aOS(2, _omitFieldNames ? '' : 'buffCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyClanBuffRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyClanBuffRequest copyWith(void Function(BuyClanBuffRequest) updates) =>
      super.copyWith((message) => updates(message as BuyClanBuffRequest))
          as BuyClanBuffRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyClanBuffRequest create() => BuyClanBuffRequest._();
  @$core.override
  BuyClanBuffRequest createEmptyInstance() => create();
  static $pb.PbList<BuyClanBuffRequest> createRepeated() =>
      $pb.PbList<BuyClanBuffRequest>();
  @$core.pragma('dart2js:noInline')
  static BuyClanBuffRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyClanBuffRequest>(create);
  static BuyClanBuffRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get buffCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set buffCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBuffCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuffCode() => $_clearField(2);
}

class BuyClanBuffResponse extends $pb.GeneratedMessage {
  factory BuyClanBuffResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  BuyClanBuffResponse._();

  factory BuyClanBuffResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuyClanBuffResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuyClanBuffResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyClanBuffResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyClanBuffResponse copyWith(void Function(BuyClanBuffResponse) updates) =>
      super.copyWith((message) => updates(message as BuyClanBuffResponse))
          as BuyClanBuffResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyClanBuffResponse create() => BuyClanBuffResponse._();
  @$core.override
  BuyClanBuffResponse createEmptyInstance() => create();
  static $pb.PbList<BuyClanBuffResponse> createRepeated() =>
      $pb.PbList<BuyClanBuffResponse>();
  @$core.pragma('dart2js:noInline')
  static BuyClanBuffResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyClanBuffResponse>(create);
  static BuyClanBuffResponse? _defaultInstance;

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

class GetPlayerProfileRequest extends $pb.GeneratedMessage {
  factory GetPlayerProfileRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetPlayerProfileRequest._();

  factory GetPlayerProfileRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPlayerProfileRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPlayerProfileRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPlayerProfileRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPlayerProfileRequest copyWith(
          void Function(GetPlayerProfileRequest) updates) =>
      super.copyWith((message) => updates(message as GetPlayerProfileRequest))
          as GetPlayerProfileRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPlayerProfileRequest create() => GetPlayerProfileRequest._();
  @$core.override
  GetPlayerProfileRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlayerProfileRequest> createRepeated() =>
      $pb.PbList<GetPlayerProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlayerProfileRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPlayerProfileRequest>(create);
  static GetPlayerProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetPlayerProfileResponse extends $pb.GeneratedMessage {
  factory GetPlayerProfileResponse({
    $core.bool? success,
    $core.int? characterId,
    $core.String? name,
    $core.int? level,
    $core.String? classType,
    $core.int? clanId,
    $core.String? clanName,
    $core.int? strength,
    $core.int? dexterity,
    $core.int? intelligence,
    $core.int? luck,
    $core.Iterable<PlayerEquipItem>? equippedItems,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (characterId != null) result.characterId = characterId;
    if (name != null) result.name = name;
    if (level != null) result.level = level;
    if (classType != null) result.classType = classType;
    if (clanId != null) result.clanId = clanId;
    if (clanName != null) result.clanName = clanName;
    if (strength != null) result.strength = strength;
    if (dexterity != null) result.dexterity = dexterity;
    if (intelligence != null) result.intelligence = intelligence;
    if (luck != null) result.luck = luck;
    if (equippedItems != null) result.equippedItems.addAll(equippedItems);
    return result;
  }

  GetPlayerProfileResponse._();

  factory GetPlayerProfileResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPlayerProfileResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPlayerProfileResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'characterId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aI(4, _omitFieldNames ? '' : 'level')
    ..aOS(5, _omitFieldNames ? '' : 'classType')
    ..aI(6, _omitFieldNames ? '' : 'clanId')
    ..aOS(7, _omitFieldNames ? '' : 'clanName')
    ..aI(8, _omitFieldNames ? '' : 'strength')
    ..aI(9, _omitFieldNames ? '' : 'dexterity')
    ..aI(10, _omitFieldNames ? '' : 'intelligence')
    ..aI(11, _omitFieldNames ? '' : 'luck')
    ..pPM<PlayerEquipItem>(12, _omitFieldNames ? '' : 'equippedItems',
        subBuilder: PlayerEquipItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPlayerProfileResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPlayerProfileResponse copyWith(
          void Function(GetPlayerProfileResponse) updates) =>
      super.copyWith((message) => updates(message as GetPlayerProfileResponse))
          as GetPlayerProfileResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPlayerProfileResponse create() => GetPlayerProfileResponse._();
  @$core.override
  GetPlayerProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetPlayerProfileResponse> createRepeated() =>
      $pb.PbList<GetPlayerProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPlayerProfileResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPlayerProfileResponse>(create);
  static GetPlayerProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get characterId => $_getIZ(1);
  @$pb.TagNumber(2)
  set characterId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCharacterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacterId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get classType => $_getSZ(4);
  @$pb.TagNumber(5)
  set classType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClassType() => $_has(4);
  @$pb.TagNumber(5)
  void clearClassType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get clanId => $_getIZ(5);
  @$pb.TagNumber(6)
  set clanId($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasClanId() => $_has(5);
  @$pb.TagNumber(6)
  void clearClanId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get clanName => $_getSZ(6);
  @$pb.TagNumber(7)
  set clanName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasClanName() => $_has(6);
  @$pb.TagNumber(7)
  void clearClanName() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get strength => $_getIZ(7);
  @$pb.TagNumber(8)
  set strength($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStrength() => $_has(7);
  @$pb.TagNumber(8)
  void clearStrength() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get dexterity => $_getIZ(8);
  @$pb.TagNumber(9)
  set dexterity($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDexterity() => $_has(8);
  @$pb.TagNumber(9)
  void clearDexterity() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get intelligence => $_getIZ(9);
  @$pb.TagNumber(10)
  set intelligence($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIntelligence() => $_has(9);
  @$pb.TagNumber(10)
  void clearIntelligence() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get luck => $_getIZ(10);
  @$pb.TagNumber(11)
  set luck($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLuck() => $_has(10);
  @$pb.TagNumber(11)
  void clearLuck() => $_clearField(11);

  @$pb.TagNumber(12)
  $pb.PbList<PlayerEquipItem> get equippedItems => $_getList(11);
}

class PlayerEquipItem extends $pb.GeneratedMessage {
  factory PlayerEquipItem({
    $core.String? slot,
    $core.String? name,
    $core.int? attack,
    $core.int? defense,
    $core.int? luck,
  }) {
    final result = create();
    if (slot != null) result.slot = slot;
    if (name != null) result.name = name;
    if (attack != null) result.attack = attack;
    if (defense != null) result.defense = defense;
    if (luck != null) result.luck = luck;
    return result;
  }

  PlayerEquipItem._();

  factory PlayerEquipItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlayerEquipItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlayerEquipItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'slot')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'attack')
    ..aI(4, _omitFieldNames ? '' : 'defense')
    ..aI(5, _omitFieldNames ? '' : 'luck')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerEquipItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerEquipItem copyWith(void Function(PlayerEquipItem) updates) =>
      super.copyWith((message) => updates(message as PlayerEquipItem))
          as PlayerEquipItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerEquipItem create() => PlayerEquipItem._();
  @$core.override
  PlayerEquipItem createEmptyInstance() => create();
  static $pb.PbList<PlayerEquipItem> createRepeated() =>
      $pb.PbList<PlayerEquipItem>();
  @$core.pragma('dart2js:noInline')
  static PlayerEquipItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlayerEquipItem>(create);
  static PlayerEquipItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get slot => $_getSZ(0);
  @$pb.TagNumber(1)
  set slot($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlot() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get attack => $_getIZ(2);
  @$pb.TagNumber(3)
  set attack($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAttack() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttack() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get defense => $_getIZ(3);
  @$pb.TagNumber(4)
  set defense($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDefense() => $_has(3);
  @$pb.TagNumber(4)
  void clearDefense() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get luck => $_getIZ(4);
  @$pb.TagNumber(5)
  set luck($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLuck() => $_has(4);
  @$pb.TagNumber(5)
  void clearLuck() => $_clearField(5);
}

class FindRaidTargetRequest extends $pb.GeneratedMessage {
  factory FindRaidTargetRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  FindRaidTargetRequest._();

  factory FindRaidTargetRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindRaidTargetRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindRaidTargetRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindRaidTargetRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindRaidTargetRequest copyWith(
          void Function(FindRaidTargetRequest) updates) =>
      super.copyWith((message) => updates(message as FindRaidTargetRequest))
          as FindRaidTargetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindRaidTargetRequest create() => FindRaidTargetRequest._();
  @$core.override
  FindRaidTargetRequest createEmptyInstance() => create();
  static $pb.PbList<FindRaidTargetRequest> createRepeated() =>
      $pb.PbList<FindRaidTargetRequest>();
  @$core.pragma('dart2js:noInline')
  static FindRaidTargetRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindRaidTargetRequest>(create);
  static FindRaidTargetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class FindRaidTargetResponse extends $pb.GeneratedMessage {
  factory FindRaidTargetResponse({
    $core.bool? success,
    $core.int? targetId,
    $core.String? targetName,
    $core.int? targetLevel,
    $core.int? targetWallLevel,
    $fixnum.Int64? targetGold,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (targetId != null) result.targetId = targetId;
    if (targetName != null) result.targetName = targetName;
    if (targetLevel != null) result.targetLevel = targetLevel;
    if (targetWallLevel != null) result.targetWallLevel = targetWallLevel;
    if (targetGold != null) result.targetGold = targetGold;
    return result;
  }

  FindRaidTargetResponse._();

  factory FindRaidTargetResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindRaidTargetResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindRaidTargetResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'targetId')
    ..aOS(3, _omitFieldNames ? '' : 'targetName')
    ..aI(4, _omitFieldNames ? '' : 'targetLevel')
    ..aI(5, _omitFieldNames ? '' : 'targetWallLevel')
    ..aInt64(6, _omitFieldNames ? '' : 'targetGold')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindRaidTargetResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindRaidTargetResponse copyWith(
          void Function(FindRaidTargetResponse) updates) =>
      super.copyWith((message) => updates(message as FindRaidTargetResponse))
          as FindRaidTargetResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindRaidTargetResponse create() => FindRaidTargetResponse._();
  @$core.override
  FindRaidTargetResponse createEmptyInstance() => create();
  static $pb.PbList<FindRaidTargetResponse> createRepeated() =>
      $pb.PbList<FindRaidTargetResponse>();
  @$core.pragma('dart2js:noInline')
  static FindRaidTargetResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindRaidTargetResponse>(create);
  static FindRaidTargetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetId => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get targetName => $_getSZ(2);
  @$pb.TagNumber(3)
  set targetName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTargetName() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get targetLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set targetLevel($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTargetLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearTargetLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get targetWallLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set targetWallLevel($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTargetWallLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearTargetWallLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get targetGold => $_getI64(5);
  @$pb.TagNumber(6)
  set targetGold($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTargetGold() => $_has(5);
  @$pb.TagNumber(6)
  void clearTargetGold() => $_clearField(6);
}

class AttackPlayerRequest extends $pb.GeneratedMessage {
  factory AttackPlayerRequest({
    $core.int? characterId,
    $core.int? targetId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (targetId != null) result.targetId = targetId;
    return result;
  }

  AttackPlayerRequest._();

  factory AttackPlayerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AttackPlayerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttackPlayerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'targetId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttackPlayerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttackPlayerRequest copyWith(void Function(AttackPlayerRequest) updates) =>
      super.copyWith((message) => updates(message as AttackPlayerRequest))
          as AttackPlayerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttackPlayerRequest create() => AttackPlayerRequest._();
  @$core.override
  AttackPlayerRequest createEmptyInstance() => create();
  static $pb.PbList<AttackPlayerRequest> createRepeated() =>
      $pb.PbList<AttackPlayerRequest>();
  @$core.pragma('dart2js:noInline')
  static AttackPlayerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttackPlayerRequest>(create);
  static AttackPlayerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetId => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => $_clearField(2);
}

class AttackPlayerResponse extends $pb.GeneratedMessage {
  factory AttackPlayerResponse({
    $core.bool? success,
    $core.String? message,
    $core.bool? victory,
    $fixnum.Int64? goldStolen,
    $core.int? myWallLevel,
    $core.int? enemyWallLevel,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (victory != null) result.victory = victory;
    if (goldStolen != null) result.goldStolen = goldStolen;
    if (myWallLevel != null) result.myWallLevel = myWallLevel;
    if (enemyWallLevel != null) result.enemyWallLevel = enemyWallLevel;
    return result;
  }

  AttackPlayerResponse._();

  factory AttackPlayerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AttackPlayerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttackPlayerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOB(3, _omitFieldNames ? '' : 'victory')
    ..aInt64(4, _omitFieldNames ? '' : 'goldStolen')
    ..aI(5, _omitFieldNames ? '' : 'myWallLevel')
    ..aI(6, _omitFieldNames ? '' : 'enemyWallLevel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttackPlayerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttackPlayerResponse copyWith(void Function(AttackPlayerResponse) updates) =>
      super.copyWith((message) => updates(message as AttackPlayerResponse))
          as AttackPlayerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttackPlayerResponse create() => AttackPlayerResponse._();
  @$core.override
  AttackPlayerResponse createEmptyInstance() => create();
  static $pb.PbList<AttackPlayerResponse> createRepeated() =>
      $pb.PbList<AttackPlayerResponse>();
  @$core.pragma('dart2js:noInline')
  static AttackPlayerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttackPlayerResponse>(create);
  static AttackPlayerResponse? _defaultInstance;

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
  $core.bool get victory => $_getBF(2);
  @$pb.TagNumber(3)
  set victory($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVictory() => $_has(2);
  @$pb.TagNumber(3)
  void clearVictory() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get goldStolen => $_getI64(3);
  @$pb.TagNumber(4)
  set goldStolen($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGoldStolen() => $_has(3);
  @$pb.TagNumber(4)
  void clearGoldStolen() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get myWallLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set myWallLevel($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMyWallLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearMyWallLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get enemyWallLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set enemyWallLevel($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEnemyWallLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnemyWallLevel() => $_clearField(6);
}

class GetAchievementsRequest extends $pb.GeneratedMessage {
  factory GetAchievementsRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetAchievementsRequest._();

  factory GetAchievementsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAchievementsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAchievementsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAchievementsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAchievementsRequest copyWith(
          void Function(GetAchievementsRequest) updates) =>
      super.copyWith((message) => updates(message as GetAchievementsRequest))
          as GetAchievementsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAchievementsRequest create() => GetAchievementsRequest._();
  @$core.override
  GetAchievementsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAchievementsRequest> createRepeated() =>
      $pb.PbList<GetAchievementsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAchievementsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAchievementsRequest>(create);
  static GetAchievementsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetAchievementsResponse extends $pb.GeneratedMessage {
  factory GetAchievementsResponse({
    $core.bool? success,
    $core.Iterable<AchievementEntry>? achievements,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (achievements != null) result.achievements.addAll(achievements);
    return result;
  }

  GetAchievementsResponse._();

  factory GetAchievementsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAchievementsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAchievementsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pPM<AchievementEntry>(2, _omitFieldNames ? '' : 'achievements',
        subBuilder: AchievementEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAchievementsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAchievementsResponse copyWith(
          void Function(GetAchievementsResponse) updates) =>
      super.copyWith((message) => updates(message as GetAchievementsResponse))
          as GetAchievementsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAchievementsResponse create() => GetAchievementsResponse._();
  @$core.override
  GetAchievementsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAchievementsResponse> createRepeated() =>
      $pb.PbList<GetAchievementsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAchievementsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAchievementsResponse>(create);
  static GetAchievementsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<AchievementEntry> get achievements => $_getList(1);
}

class AchievementEntry extends $pb.GeneratedMessage {
  factory AchievementEntry({
    $core.String? code,
    $core.String? name,
    $core.String? description,
    $core.int? tier,
    $core.bool? isCompleted,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (tier != null) result.tier = tier;
    if (isCompleted != null) result.isCompleted = isCompleted;
    return result;
  }

  AchievementEntry._();

  factory AchievementEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AchievementEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AchievementEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aI(4, _omitFieldNames ? '' : 'tier')
    ..aOB(5, _omitFieldNames ? '' : 'isCompleted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AchievementEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AchievementEntry copyWith(void Function(AchievementEntry) updates) =>
      super.copyWith((message) => updates(message as AchievementEntry))
          as AchievementEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AchievementEntry create() => AchievementEntry._();
  @$core.override
  AchievementEntry createEmptyInstance() => create();
  static $pb.PbList<AchievementEntry> createRepeated() =>
      $pb.PbList<AchievementEntry>();
  @$core.pragma('dart2js:noInline')
  static AchievementEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AchievementEntry>(create);
  static AchievementEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get tier => $_getIZ(3);
  @$pb.TagNumber(4)
  set tier($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTier() => $_has(3);
  @$pb.TagNumber(4)
  void clearTier() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isCompleted => $_getBF(4);
  @$pb.TagNumber(5)
  set isCompleted($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsCompleted() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsCompleted() => $_clearField(5);
}

class CheatGiveAllRequest extends $pb.GeneratedMessage {
  factory CheatGiveAllRequest({
    $core.int? characterId,
    $core.int? level,
    $fixnum.Int64? gold,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (level != null) result.level = level;
    if (gold != null) result.gold = gold;
    return result;
  }

  CheatGiveAllRequest._();

  factory CheatGiveAllRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheatGiveAllRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheatGiveAllRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'level')
    ..aInt64(3, _omitFieldNames ? '' : 'gold')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheatGiveAllRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheatGiveAllRequest copyWith(void Function(CheatGiveAllRequest) updates) =>
      super.copyWith((message) => updates(message as CheatGiveAllRequest))
          as CheatGiveAllRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheatGiveAllRequest create() => CheatGiveAllRequest._();
  @$core.override
  CheatGiveAllRequest createEmptyInstance() => create();
  static $pb.PbList<CheatGiveAllRequest> createRepeated() =>
      $pb.PbList<CheatGiveAllRequest>();
  @$core.pragma('dart2js:noInline')
  static CheatGiveAllRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheatGiveAllRequest>(create);
  static CheatGiveAllRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get gold => $_getI64(2);
  @$pb.TagNumber(3)
  set gold($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGold() => $_has(2);
  @$pb.TagNumber(3)
  void clearGold() => $_clearField(3);
}

class CheatGiveAllResponse extends $pb.GeneratedMessage {
  factory CheatGiveAllResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  CheatGiveAllResponse._();

  factory CheatGiveAllResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheatGiveAllResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheatGiveAllResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'city'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheatGiveAllResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheatGiveAllResponse copyWith(void Function(CheatGiveAllResponse) updates) =>
      super.copyWith((message) => updates(message as CheatGiveAllResponse))
          as CheatGiveAllResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheatGiveAllResponse create() => CheatGiveAllResponse._();
  @$core.override
  CheatGiveAllResponse createEmptyInstance() => create();
  static $pb.PbList<CheatGiveAllResponse> createRepeated() =>
      $pb.PbList<CheatGiveAllResponse>();
  @$core.pragma('dart2js:noInline')
  static CheatGiveAllResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheatGiveAllResponse>(create);
  static CheatGiveAllResponse? _defaultInstance;

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
