import 'interceptors.dart';
import 'package:dio/dio.dart';

class ResponseInterceptor {
  final LoggingInterceptor _loggingInterceptor;

  ResponseInterceptor(this._loggingInterceptor);

  /// Intercepts the response so that we can validate its integrity
  dynamic getResponseInterceptor(Response response) {
    _loggingInterceptor.printSuccess(response);
    return response;
  }
}
