import 'package:dio/dio.dart';

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw Exception('Connection timeout with API server');
    case DioExceptionType.badCertificate:
      throw Exception('Bad certificate');
    case DioExceptionType.badResponse:
      throw Exception('Bad response from API server');
    case DioExceptionType.cancel:
      throw Exception('Request to API server was cancelled');
    case DioExceptionType.connectionError:
      throw Exception('Connection error with API server');
    case DioExceptionType.unknown:
      throw Exception('Unknown error occurred');
  }
} 