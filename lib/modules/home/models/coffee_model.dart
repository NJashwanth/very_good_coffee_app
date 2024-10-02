import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_model.freezed.dart';
part 'coffee_model.g.dart';

//Using this to change the key type
String? _imageUrlFromJson(String? file) => file;
String? _imageUrlToJson(String? file) => file;

@JsonSerializable(createFactory: false)
@freezed
class CoffeeModel with _$CoffeeModel {
  factory CoffeeModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'file', fromJson: _imageUrlFromJson, toJson: _imageUrlToJson)
    String? imageUrl,
    @Default(false) bool isLiked,
  }) = _CoffeeModel;


  factory CoffeeModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeeModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CoffeeModelToJson(this);
}
