import 'package:dio/dio.dart';

class APIServices {
  final String _baseURL = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  APIServices(this._dio);

  Future<Response> get({required String endPoint}) async {
    var response = await _dio.get("$_baseURL$endPoint");
    return response;
  }
}
