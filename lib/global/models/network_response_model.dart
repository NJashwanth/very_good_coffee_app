import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response_model.freezed.dart';
part 'network_response_model.g.dart';

@JsonSerializable(createFactory: false)
@freezed
class NetworkResponseModel with _$NetworkResponseModel {
  factory NetworkResponseModel({
    @Default(false) bool hasException,
    Map<String, dynamic>? data,
    String? errorMessage,
  }) = _NetworkResponseModel;

  factory NetworkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NetworkResponseModelToJson(this);
}
