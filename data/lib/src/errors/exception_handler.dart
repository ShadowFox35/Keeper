import 'package:core/core.dart';

abstract class ExceptionHandler {
  static AppException handleException(Exception exception) {
    if (exception is AppException) return exception;
    if (exception is DioException) return _handleDioException(dioException: exception);

    return const AppException.unknown();
  }

  static AppException _handleDioException({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const AppException.connectionToServer();
      case DioExceptionType.cancel:
      case DioExceptionType.badResponse:
        final Response<dynamic>? response = dioException.response;
        return response != null ? _parseBadResponse(response) : const AppException.unknown();
      default:
        return const AppException.unknown();
    }
  }

  static AppException _parseBadResponse(Response<dynamic> response) {
    final int? statusCode = response.statusCode;
    return statusCode != null
        ? _getExceptionByCode(statusCode, responseData: response.data)
        : const AppException.unknown();
  }

  static AppException _getExceptionByCode(int statusCode, {required dynamic responseData}) {
    if (statusCode >= 500 && statusCode <= 599) {
      return AppException.serverUnavailable(statusCode: statusCode);
    } else {
      String? message;

      if (responseData is Map<String, dynamic>) {
        final dynamic description = responseData['description'];
        if (description is String) message = description;
        if (description is Map<String, dynamic>) message = description['message'] as String?;

        final dynamic error = responseData['error'];
        if (error is String) message = error;
        if (error is Map<String, dynamic>) message = error['message'] as String?;
      } else if (responseData is String) {
        message = responseData;
      }

      final String? finalMessage = message?.isEmpty ?? true ? null : message;
      return AppException.standard(statusCode: statusCode, message: finalMessage);
    }
  }
}
