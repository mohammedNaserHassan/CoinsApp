import 'package:coins_app/Constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  DioHelper._();

  static DioHelper helper = DioHelper._();
  Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {'X-Client-Device-UDID': deviceId}),
  );

  Future<Response> getRequest(String path, {Map<String, dynamic>? map}) async {
    Response response = await dio.get(path, queryParameters: map);
    return response;
  }

  Future<Response> postRequest(String path, Map<dynamic, dynamic> data) async {
    Response response = await dio.post(path, data: data);
    return response;
  }

  Future<Response> deleteRequest(String path) async {
    Response response = await dio.delete(path);
    return response;
  }
}
