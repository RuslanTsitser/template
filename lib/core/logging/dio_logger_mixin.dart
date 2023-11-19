import 'package:dio/dio.dart';

import '../domain/models/base_model.dart';
import 'app_logger.dart';

mixin DioLoggerMixin {
  void onError(DioException e) {
    logErrorRestApi(
      {
        'PATH': e.requestOptions.uri,
        'RESPONSE ERROR:': e.response,
        'STATUS CODE': e.response?.statusCode,
        'MESSAGE': e.message,
        'DATA': e.response?.data,
      },
      e,
      e.stackTrace,
    );
  }

  void onResponse(Response<dynamic> response) {
    logRestApi({
      'RESPONSE': response.requestOptions.uri,
      'STATUS CODE': response.statusCode,
      'DATA': response.data,
    });
  }

  void onRequest(RequestOptions options) {
    final method = options.method;
    final path = options.uri.toString();
    final headers = options.headers;
    final data = options.data is BaseToJsonModel ? (options.data as BaseToJsonModel).toJson() : options.data;

    logRestApi({
      'METHOD': method,
      'PATH': path,
      'HEADERS': headers,
      'QUERY PARAMETERS': options.queryParameters,
      'DATA': data,
    });
  }
}
