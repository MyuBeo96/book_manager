import 'package:dio/dio.dart';

class BookClient {
  static BaseOptions _baseOptions = new BaseOptions(
      baseUrl: "https://localhost:8000",
      connectTimeout: 5000,
      receiveTimeout: 3000);

  static Dio _dio = Dio(_baseOptions);

  BookClient._internal() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
    ));
  }

  static final BookClient instance = BookClient._internal();

  Dio get dio => _dio;
}
