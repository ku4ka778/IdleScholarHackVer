// This is a generated file - do not edit.
//
// Generated from equipment.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetEquipmentRequest extends $pb.GeneratedMessage {
  factory GetEquipmentRequest({
    $core.int? characterId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    return result;
  }

  GetEquipmentRequest._();

  factory GetEquipmentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEquipmentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEquipmentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'equipment'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEquipmentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEquipmentRequest copyWith(void Function(GetEquipmentRequest) updates) =>
      super.copyWith((message) => updates(message as GetEquipmentRequest))
          as GetEquipmentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEquipmentRequest create() => GetEquipmentRequest._();
  @$core.override
  GetEquipmentRequest createEmptyInstance() => create();
  static $pb.PbList<GetEquipmentRequest> createRepeated() =>
      $pb.PbList<GetEquipmentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEquipmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEquipmentRequest>(create);
  static GetEquipmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterId => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => $_clearField(1);
}

class GetEquipmentResponse extends $pb.GeneratedMessage {
  factory GetEquipmentResponse({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<EquipmentItem>? items,
    $core.int? totalAttack,
    $core.int? totalDefense,
    $core.int? totalLuck,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (items != null) result.items.addAll(items);
    if (totalAttack != null) result.totalAttack = totalAttack;
    if (totalDefense != null) result.totalDefense = totalDefense;
    if (totalLuck != null) result.totalLuck = totalLuck;
    return result;
  }

  GetEquipmentResponse._();

  factory GetEquipmentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEquipmentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEquipmentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'equipment'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<EquipmentItem>(3, _omitFieldNames ? '' : 'items',
        subBuilder: EquipmentItem.create)
    ..aI(4, _omitFieldNames ? '' : 'totalAttack')
    ..aI(5, _omitFieldNames ? '' : 'totalDefense')
    ..aI(6, _omitFieldNames ? '' : 'totalLuck')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEquipmentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEquipmentResponse copyWith(void Function(GetEquipmentResponse) updates) =>
      super.copyWith((message) => updates(message as GetEquipmentResponse))
          as GetEquipmentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEquipmentResponse create() => GetEquipmentResponse._();
  @$core.override
  GetEquipmentResponse createEmptyInstance() => create();
  static $pb.PbList<GetEquipmentResponse> createRepeated() =>
      $pb.PbList<GetEquipmentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetEquipmentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEquipmentResponse>(create);
  static GetEquipmentResponse? _defaultInstance;

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
  $pb.PbList<EquipmentItem> get items => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get totalAttack => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalAttack($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalAttack() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalAttack() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalDefense => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalDefense($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalDefense() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalDefense() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get totalLuck => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalLuck($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalLuck() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalLuck() => $_clearField(6);
}

class EquipmentItem extends $pb.GeneratedMessage {
  factory EquipmentItem({
    $core.int? id,
    $core.String? code,
    $core.String? name,
    $core.String? slot,
    $core.int? attack,
    $core.int? defense,
    $core.int? luck,
    $core.bool? equipped,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (slot != null) result.slot = slot;
    if (attack != null) result.attack = attack;
    if (defense != null) result.defense = defense;
    if (luck != null) result.luck = luck;
    if (equipped != null) result.equipped = equipped;
    return result;
  }

  EquipmentItem._();

  factory EquipmentItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EquipmentItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EquipmentItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'equipment'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'slot')
    ..aI(5, _omitFieldNames ? '' : 'attack')
    ..aI(6, _omitFieldNames ? '' : 'defense')
    ..aI(7, _omitFieldNames ? '' : 'luck')
    ..aOB(8, _omitFieldNames ? '' : 'equipped')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipmentItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipmentItem copyWith(void Function(EquipmentItem) updates) =>
      super.copyWith((message) => updates(message as EquipmentItem))
          as EquipmentItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EquipmentItem create() => EquipmentItem._();
  @$core.override
  EquipmentItem createEmptyInstance() => create();
  static $pb.PbList<EquipmentItem> createRepeated() =>
      $pb.PbList<EquipmentItem>();
  @$core.pragma('dart2js:noInline')
  static EquipmentItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EquipmentItem>(create);
  static EquipmentItem? _defaultInstance;

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
  $core.int get attack => $_getIZ(4);
  @$pb.TagNumber(5)
  set attack($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAttack() => $_has(4);
  @$pb.TagNumber(5)
  void clearAttack() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get defense => $_getIZ(5);
  @$pb.TagNumber(6)
  set defense($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDefense() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefense() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get luck => $_getIZ(6);
  @$pb.TagNumber(7)
  set luck($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLuck() => $_has(6);
  @$pb.TagNumber(7)
  void clearLuck() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get equipped => $_getBF(7);
  @$pb.TagNumber(8)
  set equipped($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEquipped() => $_has(7);
  @$pb.TagNumber(8)
  void clearEquipped() => $_clearField(8);
}

class EquipRequest extends $pb.GeneratedMessage {
  factory EquipRequest({
    $core.int? characterId,
    $core.int? itemId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (itemId != null) result.itemId = itemId;
    return result;
  }

  EquipRequest._();

  factory EquipRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EquipRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EquipRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'equipment'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'itemId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipRequest copyWith(void Function(EquipRequest) updates) =>
      super.copyWith((message) => updates(message as EquipRequest))
          as EquipRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EquipRequest create() => EquipRequest._();
  @$core.override
  EquipRequest createEmptyInstance() => create();
  static $pb.PbList<EquipRequest> createRepeated() =>
      $pb.PbList<EquipRequest>();
  @$core.pragma('dart2js:noInline')
  static EquipRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EquipRequest>(create);
  static EquipRequest? _defaultInstance;

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

class EquipResponse extends $pb.GeneratedMessage {
  factory EquipResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  EquipResponse._();

  factory EquipResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EquipResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EquipResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'equipment'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipResponse copyWith(void Function(EquipResponse) updates) =>
      super.copyWith((message) => updates(message as EquipResponse))
          as EquipResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EquipResponse create() => EquipResponse._();
  @$core.override
  EquipResponse createEmptyInstance() => create();
  static $pb.PbList<EquipResponse> createRepeated() =>
      $pb.PbList<EquipResponse>();
  @$core.pragma('dart2js:noInline')
  static EquipResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EquipResponse>(create);
  static EquipResponse? _defaultInstance;

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

class UnequipRequest extends $pb.GeneratedMessage {
  factory UnequipRequest({
    $core.int? characterId,
    $core.int? itemId,
  }) {
    final result = create();
    if (characterId != null) result.characterId = characterId;
    if (itemId != null) result.itemId = itemId;
    return result;
  }

  UnequipRequest._();

  factory UnequipRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnequipRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnequipRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'equipment'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'characterId')
    ..aI(2, _omitFieldNames ? '' : 'itemId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnequipRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnequipRequest copyWith(void Function(UnequipRequest) updates) =>
      super.copyWith((message) => updates(message as UnequipRequest))
          as UnequipRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnequipRequest create() => UnequipRequest._();
  @$core.override
  UnequipRequest createEmptyInstance() => create();
  static $pb.PbList<UnequipRequest> createRepeated() =>
      $pb.PbList<UnequipRequest>();
  @$core.pragma('dart2js:noInline')
  static UnequipRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnequipRequest>(create);
  static UnequipRequest? _defaultInstance;

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

class UnequipResponse extends $pb.GeneratedMessage {
  factory UnequipResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  UnequipResponse._();

  factory UnequipResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnequipResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnequipResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'equipment'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnequipResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnequipResponse copyWith(void Function(UnequipResponse) updates) =>
      super.copyWith((message) => updates(message as UnequipResponse))
          as UnequipResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnequipResponse create() => UnequipResponse._();
  @$core.override
  UnequipResponse createEmptyInstance() => create();
  static $pb.PbList<UnequipResponse> createRepeated() =>
      $pb.PbList<UnequipResponse>();
  @$core.pragma('dart2js:noInline')
  static UnequipResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnequipResponse>(create);
  static UnequipResponse? _defaultInstance;

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
