// This is a generated file - do not edit.
//
// Generated from craft.proto.

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

class GetRecipesRequest extends $pb.GeneratedMessage {
  factory GetRecipesRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetRecipesRequest._();

  factory GetRecipesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRecipesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRecipesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRecipesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRecipesRequest copyWith(void Function(GetRecipesRequest) updates) =>
      super.copyWith((message) => updates(message as GetRecipesRequest))
          as GetRecipesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecipesRequest create() => GetRecipesRequest._();
  @$core.override
  GetRecipesRequest createEmptyInstance() => create();
  static $pb.PbList<GetRecipesRequest> createRepeated() =>
      $pb.PbList<GetRecipesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRecipesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRecipesRequest>(create);
  static GetRecipesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetRecipesResponse extends $pb.GeneratedMessage {
  factory GetRecipesResponse({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<Recipe>? recipes,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (recipes != null) result.recipes.addAll(recipes);
    return result;
  }

  GetRecipesResponse._();

  factory GetRecipesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRecipesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRecipesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<Recipe>(3, _omitFieldNames ? '' : 'recipes',
        subBuilder: Recipe.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRecipesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRecipesResponse copyWith(void Function(GetRecipesResponse) updates) =>
      super.copyWith((message) => updates(message as GetRecipesResponse))
          as GetRecipesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecipesResponse create() => GetRecipesResponse._();
  @$core.override
  GetRecipesResponse createEmptyInstance() => create();
  static $pb.PbList<GetRecipesResponse> createRepeated() =>
      $pb.PbList<GetRecipesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRecipesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRecipesResponse>(create);
  static GetRecipesResponse? _defaultInstance;

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
  $pb.PbList<Recipe> get recipes => $_getList(2);
}

class Recipe extends $pb.GeneratedMessage {
  factory Recipe({
    $core.int? id,
    $core.String? code,
    $core.String? resultCode,
    $core.String? resultName,
    $core.int? resultQuantity,
    $core.Iterable<Ingredient>? ingredients,
    $core.bool? canCraft,
    $core.String? resultSlot,
    $core.int? resultAttack,
    $core.int? resultDefense,
    $core.int? resultLuck,
    $fixnum.Int64? goldCost,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (code != null) result.code = code;
    if (resultCode != null) result.resultCode = resultCode;
    if (resultName != null) result.resultName = resultName;
    if (resultQuantity != null) result.resultQuantity = resultQuantity;
    if (ingredients != null) result.ingredients.addAll(ingredients);
    if (canCraft != null) result.canCraft = canCraft;
    if (resultSlot != null) result.resultSlot = resultSlot;
    if (resultAttack != null) result.resultAttack = resultAttack;
    if (resultDefense != null) result.resultDefense = resultDefense;
    if (resultLuck != null) result.resultLuck = resultLuck;
    if (goldCost != null) result.goldCost = goldCost;
    return result;
  }

  Recipe._();

  factory Recipe.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Recipe.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Recipe',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'resultCode')
    ..aOS(4, _omitFieldNames ? '' : 'resultName')
    ..aI(5, _omitFieldNames ? '' : 'resultQuantity')
    ..pPM<Ingredient>(6, _omitFieldNames ? '' : 'ingredients',
        subBuilder: Ingredient.create)
    ..aOB(7, _omitFieldNames ? '' : 'canCraft')
    ..aOS(8, _omitFieldNames ? '' : 'resultSlot')
    ..aI(9, _omitFieldNames ? '' : 'resultAttack')
    ..aI(10, _omitFieldNames ? '' : 'resultDefense')
    ..aI(11, _omitFieldNames ? '' : 'resultLuck')
    ..aInt64(12, _omitFieldNames ? '' : 'goldCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Recipe clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Recipe copyWith(void Function(Recipe) updates) =>
      super.copyWith((message) => updates(message as Recipe)) as Recipe;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Recipe create() => Recipe._();
  @$core.override
  Recipe createEmptyInstance() => create();
  static $pb.PbList<Recipe> createRepeated() => $pb.PbList<Recipe>();
  @$core.pragma('dart2js:noInline')
  static Recipe getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Recipe>(create);
  static Recipe? _defaultInstance;

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
  $core.String get resultCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set resultCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResultCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearResultCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get resultName => $_getSZ(3);
  @$pb.TagNumber(4)
  set resultName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasResultName() => $_has(3);
  @$pb.TagNumber(4)
  void clearResultName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get resultQuantity => $_getIZ(4);
  @$pb.TagNumber(5)
  set resultQuantity($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasResultQuantity() => $_has(4);
  @$pb.TagNumber(5)
  void clearResultQuantity() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<Ingredient> get ingredients => $_getList(5);

  @$pb.TagNumber(7)
  $core.bool get canCraft => $_getBF(6);
  @$pb.TagNumber(7)
  set canCraft($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCanCraft() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanCraft() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get resultSlot => $_getSZ(7);
  @$pb.TagNumber(8)
  set resultSlot($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasResultSlot() => $_has(7);
  @$pb.TagNumber(8)
  void clearResultSlot() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get resultAttack => $_getIZ(8);
  @$pb.TagNumber(9)
  set resultAttack($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasResultAttack() => $_has(8);
  @$pb.TagNumber(9)
  void clearResultAttack() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get resultDefense => $_getIZ(9);
  @$pb.TagNumber(10)
  set resultDefense($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasResultDefense() => $_has(9);
  @$pb.TagNumber(10)
  void clearResultDefense() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get resultLuck => $_getIZ(10);
  @$pb.TagNumber(11)
  set resultLuck($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasResultLuck() => $_has(10);
  @$pb.TagNumber(11)
  void clearResultLuck() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get goldCost => $_getI64(11);
  @$pb.TagNumber(12)
  set goldCost($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasGoldCost() => $_has(11);
  @$pb.TagNumber(12)
  void clearGoldCost() => $_clearField(12);
}

class Ingredient extends $pb.GeneratedMessage {
  factory Ingredient({
    $core.String? resourceType,
    $core.int? amount,
    $fixnum.Int64? available,
  }) {
    final result = create();
    if (resourceType != null) result.resourceType = resourceType;
    if (amount != null) result.amount = amount;
    if (available != null) result.available = available;
    return result;
  }

  Ingredient._();

  factory Ingredient.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Ingredient.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Ingredient',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'resourceType')
    ..aI(2, _omitFieldNames ? '' : 'amount')
    ..aInt64(3, _omitFieldNames ? '' : 'available')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Ingredient clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Ingredient copyWith(void Function(Ingredient) updates) =>
      super.copyWith((message) => updates(message as Ingredient)) as Ingredient;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ingredient create() => Ingredient._();
  @$core.override
  Ingredient createEmptyInstance() => create();
  static $pb.PbList<Ingredient> createRepeated() => $pb.PbList<Ingredient>();
  @$core.pragma('dart2js:noInline')
  static Ingredient getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Ingredient>(create);
  static Ingredient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resourceType => $_getSZ(0);
  @$pb.TagNumber(1)
  set resourceType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResourceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get amount => $_getIZ(1);
  @$pb.TagNumber(2)
  set amount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get available => $_getI64(2);
  @$pb.TagNumber(3)
  set available($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvailable() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvailable() => $_clearField(3);
}

class CraftItemRequest extends $pb.GeneratedMessage {
  factory CraftItemRequest({
    $core.int? characterId,
    $core.int? recipeId,
    $core.int? amount,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (recipeId != null) result.recipeId = recipeId;
    if (amount != null) result.amount = amount;
    return result;
  }

  CraftItemRequest._();

  factory CraftItemRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CraftItemRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CraftItemRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'recipeId')
    ..aI(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftItemRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftItemRequest copyWith(void Function(CraftItemRequest) updates) =>
      super.copyWith((message) => updates(message as CraftItemRequest))
          as CraftItemRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CraftItemRequest create() => CraftItemRequest._();
  @$core.override
  CraftItemRequest createEmptyInstance() => create();
  static $pb.PbList<CraftItemRequest> createRepeated() =>
      $pb.PbList<CraftItemRequest>();
  @$core.pragma('dart2js:noInline')
  static CraftItemRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CraftItemRequest>(create);
  static CraftItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get recipeId => $_getIZ(1);
  @$pb.TagNumber(2)
  set recipeId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecipeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecipeId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get amount => $_getIZ(2);
  @$pb.TagNumber(3)
  set amount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

class CraftItemResponse extends $pb.GeneratedMessage {
  factory CraftItemResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  CraftItemResponse._();

  factory CraftItemResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CraftItemResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CraftItemResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftItemResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftItemResponse copyWith(void Function(CraftItemResponse) updates) =>
      super.copyWith((message) => updates(message as CraftItemResponse))
          as CraftItemResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CraftItemResponse create() => CraftItemResponse._();
  @$core.override
  CraftItemResponse createEmptyInstance() => create();
  static $pb.PbList<CraftItemResponse> createRepeated() =>
      $pb.PbList<CraftItemResponse>();
  @$core.pragma('dart2js:noInline')
  static CraftItemResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CraftItemResponse>(create);
  static CraftItemResponse? _defaultInstance;

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

class GetSalvageableItemsRequest extends $pb.GeneratedMessage {
  factory GetSalvageableItemsRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetSalvageableItemsRequest._();

  factory GetSalvageableItemsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSalvageableItemsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSalvageableItemsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalvageableItemsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalvageableItemsRequest copyWith(
          void Function(GetSalvageableItemsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetSalvageableItemsRequest))
          as GetSalvageableItemsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSalvageableItemsRequest create() => GetSalvageableItemsRequest._();
  @$core.override
  GetSalvageableItemsRequest createEmptyInstance() => create();
  static $pb.PbList<GetSalvageableItemsRequest> createRepeated() =>
      $pb.PbList<GetSalvageableItemsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSalvageableItemsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSalvageableItemsRequest>(create);
  static GetSalvageableItemsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetSalvageableItemsResponse extends $pb.GeneratedMessage {
  factory GetSalvageableItemsResponse({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<SalvageableItem>? items,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (items != null) result.items.addAll(items);
    return result;
  }

  GetSalvageableItemsResponse._();

  factory GetSalvageableItemsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSalvageableItemsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSalvageableItemsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<SalvageableItem>(3, _omitFieldNames ? '' : 'items',
        subBuilder: SalvageableItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalvageableItemsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalvageableItemsResponse copyWith(
          void Function(GetSalvageableItemsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSalvageableItemsResponse))
          as GetSalvageableItemsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSalvageableItemsResponse create() =>
      GetSalvageableItemsResponse._();
  @$core.override
  GetSalvageableItemsResponse createEmptyInstance() => create();
  static $pb.PbList<GetSalvageableItemsResponse> createRepeated() =>
      $pb.PbList<GetSalvageableItemsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSalvageableItemsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSalvageableItemsResponse>(create);
  static GetSalvageableItemsResponse? _defaultInstance;

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
  $pb.PbList<SalvageableItem> get items => $_getList(2);
}

class SalvageableItem extends $pb.GeneratedMessage {
  factory SalvageableItem({
    $core.int? id,
    $core.String? code,
    $core.String? name,
    $core.String? slot,
    $core.int? tier,
    $core.Iterable<SalvageResult>? preview,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (slot != null) result.slot = slot;
    if (tier != null) result.tier = tier;
    if (preview != null) result.preview.addAll(preview);
    return result;
  }

  SalvageableItem._();

  factory SalvageableItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalvageableItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalvageableItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'slot')
    ..aI(5, _omitFieldNames ? '' : 'tier')
    ..pPM<SalvageResult>(6, _omitFieldNames ? '' : 'preview',
        subBuilder: SalvageResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageableItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageableItem copyWith(void Function(SalvageableItem) updates) =>
      super.copyWith((message) => updates(message as SalvageableItem))
          as SalvageableItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalvageableItem create() => SalvageableItem._();
  @$core.override
  SalvageableItem createEmptyInstance() => create();
  static $pb.PbList<SalvageableItem> createRepeated() =>
      $pb.PbList<SalvageableItem>();
  @$core.pragma('dart2js:noInline')
  static SalvageableItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalvageableItem>(create);
  static SalvageableItem? _defaultInstance;

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
  $core.String get slot => $_getSZ(3);
  @$pb.TagNumber(4)
  set slot($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSlot() => $_has(3);
  @$pb.TagNumber(4)
  void clearSlot() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get tier => $_getIZ(4);
  @$pb.TagNumber(5)
  set tier($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTier() => $_has(4);
  @$pb.TagNumber(5)
  void clearTier() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<SalvageResult> get preview => $_getList(5);
}

class SalvageItemRequest extends $pb.GeneratedMessage {
  factory SalvageItemRequest({
    $core.int? characterId,
    $core.int? itemId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (itemId != null) result.itemId = itemId;
    return result;
  }

  SalvageItemRequest._();

  factory SalvageItemRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalvageItemRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalvageItemRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'itemId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageItemRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageItemRequest copyWith(void Function(SalvageItemRequest) updates) =>
      super.copyWith((message) => updates(message as SalvageItemRequest))
          as SalvageItemRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalvageItemRequest create() => SalvageItemRequest._();
  @$core.override
  SalvageItemRequest createEmptyInstance() => create();
  static $pb.PbList<SalvageItemRequest> createRepeated() =>
      $pb.PbList<SalvageItemRequest>();
  @$core.pragma('dart2js:noInline')
  static SalvageItemRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalvageItemRequest>(create);
  static SalvageItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get itemId => $_getIZ(1);
  @$pb.TagNumber(2)
  set itemId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasItemId() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemId() => $_clearField(2);
}

class SalvageItemResponse extends $pb.GeneratedMessage {
  factory SalvageItemResponse({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<SalvageResult>? results,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (results != null) result.results.addAll(results);
    return result;
  }

  SalvageItemResponse._();

  factory SalvageItemResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalvageItemResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalvageItemResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<SalvageResult>(3, _omitFieldNames ? '' : 'results',
        subBuilder: SalvageResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageItemResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageItemResponse copyWith(void Function(SalvageItemResponse) updates) =>
      super.copyWith((message) => updates(message as SalvageItemResponse))
          as SalvageItemResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalvageItemResponse create() => SalvageItemResponse._();
  @$core.override
  SalvageItemResponse createEmptyInstance() => create();
  static $pb.PbList<SalvageItemResponse> createRepeated() =>
      $pb.PbList<SalvageItemResponse>();
  @$core.pragma('dart2js:noInline')
  static SalvageItemResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalvageItemResponse>(create);
  static SalvageItemResponse? _defaultInstance;

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
  $pb.PbList<SalvageResult> get results => $_getList(2);
}

class SalvageResult extends $pb.GeneratedMessage {
  factory SalvageResult({
    $core.String? resourceType,
    $core.int? amount,
  }) {
    final result = create();
    if (resourceType != null) result.resourceType = resourceType;
    if (amount != null) result.amount = amount;
    return result;
  }

  SalvageResult._();

  factory SalvageResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalvageResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalvageResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'craft'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'resourceType')
    ..aI(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalvageResult copyWith(void Function(SalvageResult) updates) =>
      super.copyWith((message) => updates(message as SalvageResult))
          as SalvageResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalvageResult create() => SalvageResult._();
  @$core.override
  SalvageResult createEmptyInstance() => create();
  static $pb.PbList<SalvageResult> createRepeated() =>
      $pb.PbList<SalvageResult>();
  @$core.pragma('dart2js:noInline')
  static SalvageResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalvageResult>(create);
  static SalvageResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resourceType => $_getSZ(0);
  @$pb.TagNumber(1)
  set resourceType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResourceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get amount => $_getIZ(1);
  @$pb.TagNumber(2)
  set amount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
