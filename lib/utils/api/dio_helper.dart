import 'dart:io';

import 'package:dio/dio.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TDioHelper {
  static final TDioHelper _instance = TDioHelper._internal();
  late Dio dio;

  factory TDioHelper() {
    return _instance;
  }

  TDioHelper._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: TApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger(requestBody: true, error: true, requestHeader: true));
  }

  Future<Map<String, dynamic>> get(String endPoint,
      {String lang = 'en',
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    return await _makeRequest(
      () => dio.get(endPoint, queryParameters: queryParameters),
      lang: lang,
      token: token,
    );
  }

  Future<Map<String, dynamic>> post(String endPoint, {required Map<String, dynamic> data, String lang = 'en', String? token}) async {
    return await _makeRequest(
      () => dio.post(endPoint, data: data),
      lang: lang,
      token: token,
    );
  }

  Future<Map<String, dynamic>> put(String endPoint, Map<String, dynamic> data,
      {String lang = 'en', String? token}) async {
    return await _makeRequest(
      () => dio.put(endPoint, data: data),
      lang: lang,
      token: token,
    );
  }

  Future<Map<String, dynamic>> delete(String endPoint,
      {String lang = 'en', String? token}) async {
    return await _makeRequest(
      () => dio.delete(endPoint),
      lang: lang,
      token: token,
    );
  }

  Future<List<int>?> download(String url, {String? token}) async {
    final tempDir = await getTemporaryDirectory();  // الحصول على مسار التخزين المؤقت
    final filePath = '${tempDir.path}/downloaded_file';  // تحديد اسم ومسار الملف الذي سيتم حفظه

    try {
      // طلب تنزيل الملف
      Response response = await dio.download(
        url,
        filePath,
        options: Options(
          headers: {
            'Authorization': token != null ? 'Bearer $token' : '',
          },
        ),
      );

      if (response.statusCode == 200) {
        return File(filePath).readAsBytes();  // إرجاع البيانات المقروءة من الملف
      } else {
        throw Exception('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Download failed: $e');
    }
  }

  Future<Map<String, dynamic>> _makeRequest(Future<Response> Function() request,
      {String lang = 'en', String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token != null ? 'Bearer $token' : '',
    };

    Response response;
    try {
      response = await request();
      if (response.statusCode == 200 || response.statusCode == 400) {
        return response.data;
      } else if (response.statusCode == 401) {
        String? newToken = await refreshToken();
        if (newToken != null) {
          dio.options.headers['Authorization'] = 'Bearer $newToken';
          response = await request();
          return response.data;
        }
      }
      throw Exception("Failed to load data: ${response.statusCode}");
    } catch (e) {
      throw Exception("Request failed: $e");
    }
  }

  Future<String?> refreshToken() async {
    Response response = await dio.post(TApiConstants.refresh,
        options: Options(headers: {
          'Authorization': 'Bearer ${TCacheHelper.getData(key: "token")}'
        }));
    if (response.statusCode == 200) {
      String newToken = response.data['token'];
      TCacheHelper.saveData(key: "token", value: newToken);
      return newToken;
    }
    return null;
  }
}
