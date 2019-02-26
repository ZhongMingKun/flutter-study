import '../utils/http.dart';

class Api {
  Future test (Map<String, dynamic> params) async {
    return HttpUtil().get('/test', params);
  }
  Future login (Map<String, dynamic> params) async {
    return HttpUtil().post('/login', params);
  }
  Future getDevices (Map<String, dynamic> params) async {
    return HttpUtil().get('/getDevices', params);
  }
}
