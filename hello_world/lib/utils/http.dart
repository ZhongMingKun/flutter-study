import 'dart:async';
import 'package:dio/dio.dart';
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  static Dio _client;

  static String csrfToken = '';
  static final debug = true;
  /// 服务器路径
  static final host = 'http://www.dtworkroom.com/doris/1';
  static final baseUrl = host + '/2.0.0';
  static final options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true
  );

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    if (null == _client) {
      _client = new Dio(options);
      _setInterceptors();
    }
  }

  /// 配置拦截器
  void _setInterceptors() {
    _client.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options){
        // 在请求被发送之前做一些事情
        if (debug) {
          print('-----send request-----');
          print('path:"${options.path}"');
          print('baseURL:"${options.baseUrl}"');
        }
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
        if (options.path.contains('login')) {
          return options;
        }
        if (csrfToken == '') {
          print('no token, get token...');
          //lock the dio.
          // _client.lock();
          // return getToken().then((token) {
          //   options.headers['csrfToken'] = csrfToken = token;
          //   print('get token succeed, value: ' + token);
            return options;
          // }).whenComplete(() => _client.unlock()); // unlock the dio
        } else {
          options.headers['csrfToken'] = csrfToken;
          return options;
        }
      },
      onResponse:(Response response) {
        // 在返回响应数据之前做一些预处理
        print(response.data is Map);
        // print(json.decode(response.data));
        return response; // continue
      },
      onError: (DioError e) {
        // 当请求失败时做一些预处理
        return e;//continue
      }
    ));
  }

  /// get
  Future get(String uri, Map<String, dynamic> params) async {
    Response response = await _client.get(uri, queryParameters: params);
    return response;
  }

  /// post
  Future post(String uri, Map<String, dynamic> params) async {
    Response response = await _client.post(uri, queryParameters: params);
    return response;
  }
}
