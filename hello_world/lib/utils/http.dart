import 'package:dio/dio.dart';

class HttpUtil {
  static final debug = false;
  /// 服务器路径
  static final host = 'http://www.dtworkroom.com/doris/1/2.0.0';
  static final baseUrl = host + '/api/';

  static final options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true
  );
  static final Dio _dio = new Dio(options);

  /// get
  static Future get(String uri, Map<String, dynamic> params) async {
    Response response = await _dio.get(uri, queryParameters: params);
    return response;
  }

  /// post
  static Future post(String uri, Map<String, dynamic> params) async {
    Response response = await _dio.post(uri, queryParameters: params);
    return response;
  }
    
  // static String token;

  ///获取授权token
  // static getToken() async {
  //   String token = await LocalStorage.get(LocalStorage.TOKEN_KEY);
  //   return token;
  // }
}
