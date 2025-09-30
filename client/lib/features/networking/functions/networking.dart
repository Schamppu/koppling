import 'package:client/features/networking/functions/urls.dart';
import 'package:dio/dio.dart';

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
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
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
      print('DioException: ${e.message}');
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      // Handle error
      print('DioException: ${e.message}');
      rethrow;
    }
  }

  // Add other HTTP methods (put, delete, etc.) as needed
}
