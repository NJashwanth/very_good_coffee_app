// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NetworkResponseModel _$NetworkResponseModelFromJson(Map<String, dynamic> json) {
  return _NetworkResponseModel.fromJson(json);
}

/// @nodoc
mixin _$NetworkResponseModel {
  bool get hasException => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this NetworkResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkResponseModelCopyWith<NetworkResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkResponseModelCopyWith<$Res> {
  factory $NetworkResponseModelCopyWith(NetworkResponseModel value,
          $Res Function(NetworkResponseModel) then) =
      _$NetworkResponseModelCopyWithImpl<$Res, NetworkResponseModel>;
  @useResult
  $Res call(
      {bool hasException, Map<String, dynamic>? data, String? errorMessage});
}

/// @nodoc
class _$NetworkResponseModelCopyWithImpl<$Res,
        $Val extends NetworkResponseModel>
    implements $NetworkResponseModelCopyWith<$Res> {
  _$NetworkResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasException = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      hasException: null == hasException
          ? _value.hasException
          : hasException // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkResponseModelImplCopyWith<$Res>
    implements $NetworkResponseModelCopyWith<$Res> {
  factory _$$NetworkResponseModelImplCopyWith(_$NetworkResponseModelImpl value,
          $Res Function(_$NetworkResponseModelImpl) then) =
      __$$NetworkResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasException, Map<String, dynamic>? data, String? errorMessage});
}

/// @nodoc
class __$$NetworkResponseModelImplCopyWithImpl<$Res>
    extends _$NetworkResponseModelCopyWithImpl<$Res, _$NetworkResponseModelImpl>
    implements _$$NetworkResponseModelImplCopyWith<$Res> {
  __$$NetworkResponseModelImplCopyWithImpl(_$NetworkResponseModelImpl _value,
      $Res Function(_$NetworkResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasException = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$NetworkResponseModelImpl(
      hasException: null == hasException
          ? _value.hasException
          : hasException // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkResponseModelImpl implements _NetworkResponseModel {
  _$NetworkResponseModelImpl(
      {this.hasException = false,
      final Map<String, dynamic>? data,
      this.errorMessage})
      : _data = data;

  factory _$NetworkResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final bool hasException;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'NetworkResponseModel(hasException: $hasException, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkResponseModelImpl &&
            (identical(other.hasException, hasException) ||
                other.hasException == hasException) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasException,
      const DeepCollectionEquality().hash(_data), errorMessage);

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkResponseModelImplCopyWith<_$NetworkResponseModelImpl>
      get copyWith =>
          __$$NetworkResponseModelImplCopyWithImpl<_$NetworkResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkResponseModelImplToJson(
      this,
    );
  }
}

abstract class _NetworkResponseModel implements NetworkResponseModel {
  factory _NetworkResponseModel(
      {final bool hasException,
      final Map<String, dynamic>? data,
      final String? errorMessage}) = _$NetworkResponseModelImpl;

  factory _NetworkResponseModel.fromJson(Map<String, dynamic> json) =
      _$NetworkResponseModelImpl.fromJson;

  @override
  bool get hasException;
  @override
  Map<String, dynamic>? get data;
  @override
  String? get errorMessage;

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkResponseModelImplCopyWith<_$NetworkResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
