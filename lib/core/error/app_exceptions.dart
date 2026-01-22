class AppExceptions implements Exception {
  final String message;
  final String? prefix;

  AppExceptions(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class NetworkException extends AppExceptions {
  NetworkException(String message) : super(message, "Network Error: ");
}

class ServerException extends AppExceptions {
  ServerException(String message) : super(message, "Server Error: ");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException(String message) : super(message, "Unauthorized: ");
}

class CacheException extends AppExceptions {
  CacheException(String message) : super(message, "Cache Error: ");
}
