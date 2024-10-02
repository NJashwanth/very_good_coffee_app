// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CoffeeModelToJson(CoffeeModel instance) =>
    <String, dynamic>{
      'file': _imageUrlToJson(instance.imageUrl),
      'isLiked': instance.isLiked,
    };

_$CoffeeModelImpl _$$CoffeeModelImplFromJson(Map<String, dynamic> json) =>
    _$CoffeeModelImpl(
      imageUrl: _imageUrlFromJson(json['file'] as String?),
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$$CoffeeModelImplToJson(_$CoffeeModelImpl instance) =>
    <String, dynamic>{
      'file': _imageUrlToJson(instance.imageUrl),
      'isLiked': instance.isLiked,
    };
