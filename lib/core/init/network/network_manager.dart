import 'dart:io';
import 'package:appnation_demo_project/core/base/base_model.dart';
import 'package:appnation_demo_project/core/constants/app/app_constans.dart';
import 'package:appnation_demo_project/model/base_response.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    if (_instance != null) return _instance;
    _instance = NetworkManager.init();
    return _instance;
  }

  late final Dio dio;

  NetworkManager.init() {
    dio = Dio(BaseOptions(
      baseUrl: ApplicationConstants.BASE_URL,
      headers: {},
      contentType: 'application/json',
    ));
  }
  Future dioGetMap<T extends BaseModel>(
      {required String path, Map<String, dynamic>? queryParameters, bool isList = false}) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else {
      print('Dio Get Error Status Code: ${response.statusCode}');
    }
  }
  dynamic _baseResponseConverter<T extends BaseModel>(dynamic data, T model, bool isList) {
    final baseResponse = BaseResponse().fromJson(data);
    if (baseResponse.success!) {
      if (isList) {
        if (baseResponse.data != null) {
          var list = [];
          (baseResponse.data as List).map((value) => list.add(model.fromJson(value))).toList();
          return list;
        } else {
          return null;
        }
      } else {
        return baseResponse.data != null ? model.fromJson((baseResponse.data! as Map<String, dynamic>)) : null;
      }
    }
    else
      return null;
  }
}
