import 'package:client/features/networking/functions/urls.dart';
import 'package:client/features/toasts/functions/toast_functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Networking get net => Networking();

/// Networking is a Dio singleton wrapper for making HTTP requests.
class Networking {
  Networking._privateConstructor();

  static final Networking _instance = Networking._privateConstructor();

  factory Networking() {
    return _instance;
  }

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: devBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      // Handle error
      final body = e.response?.data;
      showError(title: 'Error', message: body, icon: Icons.error);
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      // Handle error
      final body = e.response?.data;
      showError(title: 'Error', message: body, icon: Icons.error);
      rethrow;
    }
  }

  // Add other HTTP methods (put, delete, etc.) as needed
}
