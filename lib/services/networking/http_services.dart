
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recip_book_app/API/consts.dart';

class HTTPservice {
  static final HTTPservice _singleton = HTTPservice._internal();

  final _dio = Dio();

  factory HTTPservice(){
    return _singleton;
  }

  HTTPservice._internal(){
    setUp();
  }

  Future<void> setUp({String? bearerToken}) async {
    final header = {
      "Content-Type" : "application/json",
    };
    final options = BaseOptions(
      baseUrl: API_BASE_URL,
      headers: header,
      validateStatus: (status) {
        if(status == null) return false;
        return status < 500;
      }
    );
    _dio.options = options;
  }

  Future<Response?> post (String path, Map data) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      return response;
    }
    catch(e){
      print(e);
    }



  }
}