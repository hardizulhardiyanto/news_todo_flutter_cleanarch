import 'interceptors.dart';

class RequestInterceptor {
  final LoggingInterceptor _loggingInterceptor;

  RequestInterceptor(this._loggingInterceptor);

  /// Generates the Request Interceptor
  ///
  /// [requestOptions] request options
  getRequestInterceptor(requestOptions) async {
    _loggingInterceptor.printRequest(requestOptions);
    return requestOptions;
  }
}
