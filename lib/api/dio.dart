import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  // 单例实例
  static final DioClient _instance = DioClient._internal();

  // Dio 实例
  late Dio _dio;

  // 私有构造函数
  DioClient._internal() {
    // 初始化 Dio
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://dashscope.aliyuncs.com', // 设置 Base URL
        connectTimeout: const Duration(seconds: 30), // 连接超时时间
        receiveTimeout: const Duration(seconds: 30), // 接收数据超时时间
      ),
    );

    // 添加日志拦截器（仅在调试模式下）
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true, // 打印请求日志
          responseBody: true, // 打印响应日志
          error: true, // 打印错误日志
        ),
      );
    }
  }

  // 获取单例实例
  static DioClient get instance => _instance;

  // 获取 Dio 实例
  Dio get dio => _dio;

  // 添加通用请求头
  void setHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  // 清除所有请求头
  void clearHeaders() {
    _dio.options.headers.clear();
  }

  // GET 请求
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST 请求
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT 请求
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE 请求
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // 错误处理
  String _handleError(DioException e) {
    if (e.response != null) {
      // 服务器返回错误
      return '服务器错误: ${e.response?.statusCode} - ${e.response?.statusMessage}';
    } else {
      // 网络或请求错误
      return '网络错误: ${e.message}';
    }
  }
}
