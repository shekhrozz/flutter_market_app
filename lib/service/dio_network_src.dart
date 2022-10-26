
import 'dart:developer';

import 'package:dio/dio.dart'as dio;

class DioNetworkSrc {
  static final _dio=dio.Dio(dio.BaseOptions(baseUrl: 'https://dummyjson.com',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  headers:  { 'Content-Type': 'application/json' }
  )
  );

  // get response

  static Future<T?>getRequest<T>(
    {Map<String,dynamic>? header,required String api})async {
      try {
        var response=await _dio.getUri(Uri.tryParse(api)!);
        if (response.statusCode==200) {
          return response.data as T;
        }
      } catch (e) {
        print(e.toString());
      }
      return null;
    }


}

class AppNetworkConst {
  
   static const usersssss='/users';
}