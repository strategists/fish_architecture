import 'package:dio/dio.dart';
import 'app_config.dart';

class HttpManager {
  static HttpManager sInstance;
  Dio _dio;

  HttpManager._() {
    _dio = new Dio()
      ..options = BaseOptions(
          baseUrl: AppConfig.test_domain,
          connectTimeout: 30000,
          receiveTimeout: 30000)
      ..interceptors.add(HeaderInterceptor())
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: false,
        responseHeader: false
      ));
  }

  static HttpManager getInstance() {
    if (sInstance == null) {
      sInstance = HttpManager._();
    }
    return sInstance;
  }

  // get 请求封装
  get(path,
      {options,
      cancelToken,
      queryParameters = const <String, dynamic>{}}) async {
    print('get:::url：$path ,map: $queryParameters');
    Response response;
    try {
      response = await _dio.get(path,
          queryParameters: queryParameters, cancelToken: cancelToken);
      print(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }

  // post请求封装
  post(url, {options, cancelToken, data = null}) async {
    print('post请求::: url：$url ,body: $data');
    Response response;

    try {
      response = await _dio.post(url,
          data: data != null ? data : {}, cancelToken: cancelToken);
      print(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }



}

class HeaderInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
//    final token = AppConfig.userTools.getUserToken();
    final token = "";
    if (token != null && token.length > 0) {
      options.headers
          .putIfAbsent('Authorization', () => 'Bearer' + ' ' + token);
    }
    return super.onRequest(options);
  }
}
