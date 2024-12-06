// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import 'api_error_handler/api_error_model.dart';

class ApiErrorHandler {
  static handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      return _handleDioError(error);
    } else {
      // unknown error
      return ApiErrorModel(
          message: 'Something went wrong. Please try again later.');
    }
  }
}

ApiErrorModel _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.badResponse:
      return ApiErrorModel.fromJson(error.response?.data);
    case DioExceptionType.connectionTimeout:
      return ApiErrorModel(
          message:
              'The connection timed out. Please check your internet and try again.');
    case DioExceptionType.sendTimeout:
      return ApiErrorModel(
          message: 'The request took too long to send. Please try again.');
    case DioExceptionType.receiveTimeout:
      return ApiErrorModel(
          message:
              'The server took too long to respond. Please try again later.');
    case DioExceptionType.badCertificate:
      return ApiErrorModel(
          message: 'There was a security issue. Please try again later.');
    case DioExceptionType.cancel:
      return ApiErrorModel(
          message: 'The request was canceled. Please try again.');
    case DioExceptionType.connectionError:
      return ApiErrorModel(
          message:
              'There was a connection issue. Please check your internet and try again.');
    case DioExceptionType.unknown:
      return ApiErrorModel(
          message: 'An unexpected error occurred. Please try again later.');

    default:
      return ApiErrorModel(
          message: 'An unexpected error occurred. Please try again later.');
  }
}
