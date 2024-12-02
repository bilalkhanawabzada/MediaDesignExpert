
import 'package:jaat_app/core/network_api_service.dart';

/// Class to handel Api Exceptions
/// Consumed in [NetworkApiService], can add more exceptions on the basis of api response code

class AppException implements Exception {
  final String? message;
  final String? _prefix;
  AppException([this.message, this._prefix]);

  @override
  String toString() {
    return '$message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error with Connection');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Bad Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request');
}

class InvalidException extends AppException {
  InvalidException([String? message]) : super(message, 'Invalid Request');
}
