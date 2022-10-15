import 'package:dio/dio.dart';

import 'customs_exeception.dart';

class ApiTodoList {
  late Dio dio;

  ApiTodoList() {
    dio = Dio(
      BaseOptions(
        validateStatus: (status) {
          return true;
        },
        followRedirects: false,
        baseUrl: "https://api-nodejs-todolist.herokuapp.com",
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    );
  }

  Future<Map<String, dynamic>> get(
      String endPoint,
      {
        Map<String, dynamic>? queryParameters,
      }
      ) async {
    try {
      final Response response = await dio.get(
        endPoint,
        queryParameters: queryParameters
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> post(
      String endPoint,
      body,
      Map<String, dynamic>? queryParameters,
      ) async {
    try {
      final Response response = await dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: body,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> put(
      String endPoint,
      Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters,
      ) async {
    try {
      final Response response = await dio.put(
        endPoint,
        queryParameters: queryParameters,
        data: body,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> delete(
      String endPoint,
      Map<String, dynamic>? queryParameters,
      ) async {
    try {
      final Response response = await dio.delete(
        endPoint,
        queryParameters: queryParameters,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      throw FetchDataException("internetError");
    }
  }

  Map<String, dynamic> classifyResponse(Response response) {
    final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseData;
      case 400:
      case 401:
        throw UnauthorisedException(responseData["error"].toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}