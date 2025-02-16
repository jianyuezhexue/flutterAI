import 'package:dio/dio.dart';

// dio 单例
class Http {
  static Dio? _dio;
  static Dio? _aiHttp;

  static Dio getInstance() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = 'https://www.wanandroid.com';
      _dio!.options.connectTimeout = Duration(seconds: 30);
      _dio!.options.receiveTimeout = Duration(seconds: 30);
    }
    return _dio!;
  }

  // AI接口
  static Dio getAiInstance() {
    if (_aiHttp == null) {
      _aiHttp = Dio();
      _aiHttp!.options.baseUrl = 'https://dashscope.aliyuncs.com';
      _aiHttp!.options.connectTimeout = Duration(seconds: 30);
      _aiHttp!.options.receiveTimeout = Duration(seconds: 30);
      // 设置请求头
      _aiHttp!.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer sk-e692504205e74522b45710e1c25065ad',
      };
      // 设置拦截器
      _aiHttp!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // 在请求被发送之前做一些事情
            print('uri: ${options.uri}');
            print('header: ${options.headers}');
            return handler.next(options); //continue
          },
          onResponse: (response, handler) {
            // 在响应被返回之后做一些事情
            print('onResponse: ${response.data}');
            return handler.next(response); // continue
          },
        ),
      );
    }
    return _aiHttp!;
  }
}
