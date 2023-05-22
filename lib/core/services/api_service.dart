// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:traind_app/core/network/remote/api_constants.dart';
import '../network/local/cache_helper.dart';

class ApiService {
  final Dio dio;
  ApiService(
    this.dio,
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    dio.options.headers['Authorization'] =
        'Bearer ${CacheHelper.getData(key: "token")}';
    var response = await dio.get('${ApiConstants.baseUrl}$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required dynamic data}) async {
    dio.options.headers['Authorization'] =
        'Bearer ${CacheHelper.getData(key: "token")}';
    var response = await dio.post(
      '${ApiConstants.baseUrl}$endPoint',
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required dynamic data}) async {
    dio.options.headers['Authorization'] =
        'Bearer ${CacheHelper.getData(key: "token")}';
    var response = await dio.put(
      '${ApiConstants.baseUrl}$endPoint',
      data: data,
    );
    return response.data;
  }
}
