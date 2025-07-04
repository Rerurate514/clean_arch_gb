import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio (Ref ref) {
  final dio = Dio();
  
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  dio.options.sendTimeout = const Duration(seconds: 10);
  
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
    )
  );
  
  return dio;
}
