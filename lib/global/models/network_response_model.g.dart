// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$NetworkResponseModelToJson(
        NetworkResponseModel instance) =>
    <String, dynamic>{
      'hasException': instance.hasException,
      'data': instance.data,
      'errorMessage': instance.errorMessage,
    };

_$NetworkResponseModelImpl _$$NetworkResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkResponseModelImpl(
      hasException: json['hasException'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$NetworkResponseModelImplToJson(
        _$NetworkResponseModelImpl instance) =>
    <String, dynamic>{
      'hasException': instance.hasException,
      'data': instance.data,
      'errorMessage': instance.errorMessage,
    };
