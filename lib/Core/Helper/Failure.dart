import 'package:dio/dio.dart';

import 'ApiConstant.dart';

class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class HandleError extends Failure {
  HandleError(String message) : super(message);
  factory HandleError.handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return HandleError(ApiErrors.timeoutError);
        case DioExceptionType.sendTimeout:
          return HandleError(ApiErrors.timeoutError);
        case DioExceptionType.receiveTimeout:
          return HandleError(ApiErrors.timeoutError);
        case DioExceptionType.badResponse:
          return HandleError("Response Timeout");
        case DioExceptionType.cancel:
          return HandleError(ApiErrors.retryAgainMessage);
        case DioExceptionType.unknown:
          return HandleError(ApiErrors.unknownError);
        default:
          return HandleError(ApiErrors.unknownError);
      }
    } else {
      return HandleError("Something went wrong");
    }
  }
}
