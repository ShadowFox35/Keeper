enum ExceptionType {
  imagePath,
  standard,
  unknown,
  serverUnavailable,
  connectionToServer,
}

extension ExceptionTypeExtension on ExceptionType {
  bool get isImagePath => this == ExceptionType.imagePath;

  bool get isStandard => this == ExceptionType.standard;

  bool get isUnknown => this == ExceptionType.unknown;

  bool get isServerUnavailable => this == ExceptionType.serverUnavailable;

  bool get isConnectionToServer => this == ExceptionType.connectionToServer;
}
