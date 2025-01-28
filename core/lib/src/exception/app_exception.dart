import 'package:core/src/exception/exception_type.dart';

class AppException implements Exception {
  final ExceptionType type;
  final int? statusCode;
  final String? message;

  const AppException({
    required this.type,
    this.statusCode,
    this.message,
  });

  const AppException.standard({
    required this.statusCode,
    required this.message,
  }) : type = ExceptionType.standard;

  const AppException.unknown({
    this.statusCode,
    this.message,
  }) : type = ExceptionType.unknown;

  const AppException.imagePath({this.statusCode})
      : type = ExceptionType.serverUnavailable,
        message = 'imagePath is null';

  const AppException.serverUnavailable({this.statusCode})
      : type = ExceptionType.serverUnavailable,
        message = 'server is unavailable';

  const AppException.connectionToServer()
      : type = ExceptionType.connectionToServer,
        message = 'connection timeout',
        statusCode = null;
}
