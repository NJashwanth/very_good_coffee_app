// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoffeeModel _$CoffeeModelFromJson(Map<String, dynamic> json) {
  return _CoffeeModel.fromJson(json);
}

/// @nodoc
mixin _$CoffeeModel {
  @JsonKey(name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  /// Serializes this CoffeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoffeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeModelCopyWith<CoffeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeModelCopyWith<$Res> {
  factory $CoffeeModelCopyWith(
          CoffeeModel value, $Res Function(CoffeeModel) then) =
      _$CoffeeModelCopyWithImpl<$Res, CoffeeModel>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
      String? imageUrl,
      bool isLiked});
}

/// @nodoc
class _$CoffeeModelCopyWithImpl<$Res, $Val extends CoffeeModel>
    implements $CoffeeModelCopyWith<$Res> {
  _$CoffeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeModelImplCopyWith<$Res>
    implements $CoffeeModelCopyWith<$Res> {
  factory _$$CoffeeModelImplCopyWith(
          _$CoffeeModelImpl value, $Res Function(_$CoffeeModelImpl) then) =
      __$$CoffeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
      String? imageUrl,
      bool isLiked});
}

/// @nodoc
class __$$CoffeeModelImplCopyWithImpl<$Res>
    extends _$CoffeeModelCopyWithImpl<$Res, _$CoffeeModelImpl>
    implements _$$CoffeeModelImplCopyWith<$Res> {
  __$$CoffeeModelImplCopyWithImpl(
      _$CoffeeModelImpl _value, $Res Function(_$CoffeeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? isLiked = null,
  }) {
    return _then(_$CoffeeModelImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeModelImpl implements _CoffeeModel {
  _$CoffeeModelImpl(
      {@JsonKey(
          name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
      this.imageUrl,
      this.isLiked = false});

  factory _$CoffeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeModelImplFromJson(json);

  @override
  @JsonKey(name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isLiked;

  @override
  String toString() {
    return 'CoffeeModel(imageUrl: $imageUrl, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeModelImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, isLiked);

  /// Create a copy of CoffeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeModelImplCopyWith<_$CoffeeModelImpl> get copyWith =>
      __$$CoffeeModelImplCopyWithImpl<_$CoffeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeModelImplToJson(
      this,
    );
  }
}

abstract class _CoffeeModel implements CoffeeModel {
  factory _CoffeeModel(
      {@JsonKey(
          name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
      final String? imageUrl,
      final bool isLiked}) = _$CoffeeModelImpl;

  factory _CoffeeModel.fromJson(Map<String, dynamic> json) =
      _$CoffeeModelImpl.fromJson;

  @override
  @JsonKey(name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
  String? get imageUrl;
  @override
  bool get isLiked;

  /// Create a copy of CoffeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeModelImplCopyWith<_$CoffeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
