import 'package:appnation_demo_project/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends BaseModel {
  @override
  fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  BaseResponse({this.data, this.success});

  Object? data;
  bool? success;
}
