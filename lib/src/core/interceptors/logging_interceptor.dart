import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// This file holds the functions to be used in interceptors to include logging
class LoggingInterceptor {
  /// Error Interceptor for logging in information
  printError(DioError dioError) {
    String responseError;
    final checkError = dioError.response;
    if (checkError != null) {
      responseError = dioError.response!.requestOptions.baseUrl +
          dioError.response!.requestOptions.path;
    } else {
      responseError = "URL";
    }

    debugPrint(

      // "<-- ${dioError.message} ${(dioError.response!.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}");
        "<-- ${dioError.message}$responseError");
    debugPrint(
        "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    debugPrint("<-- End error");
  }

  /// Prints Successful response
  printSuccess(Response response) {
    debugPrint(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    debugPrint("Headers:");
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("Response: ${response.data}");
    debugPrint("<-- END HTTP");
  }

  /// Prints request
  ///
  /// Prints body if it has body
  /// Prints headers, even if does not have headers
  printRequest(RequestOptions options) {
    debugPrint(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl) + (options.path)}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    if (options.data != null) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    return options;
  }
}
