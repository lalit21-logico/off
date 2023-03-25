import 'dart:convert';

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  String authkey = '373511Awb0SWwF6216fd65P1';

  Future<dynamic> genOTP(data) async {
    try {
      Response response = await _dio.post(
        'https://control.msg91.com/api/v5/otp/',
        data: data,
        queryParameters: {
          "mobile": data["mobile"],
          "template_id": "634a6acca9905e53ab3ed723",
          "authkey": "373511Awb0SWwF6216fd65P1",
        },
        options: Options(headers: {
          "authkey": "373511Awb0SWwF6216fd65P1",
          "content-type": "application/json",
          "accept": "application/json"
        }),
      );

      // var data = '{"request_id":"336379754b4c323838393335","type":"success"}';
      // print('df');
      // print(response.data);
      // print('df');
      // var response1 = jsonDecode(response.data);
      // print("dfdf");
      return response.data;
    } on DioError catch (e) {
      return true;
    }
  }

  Future<dynamic> login(String mobile, String otp) async {
    try {
      Response response = await _dio.get(
        'https://control.msg91.com/api/v5/otp/verify/',
        queryParameters: {
          "mobile": mobile,
          "otp": otp,
        },
        options: Options(headers: {
          "authkey": "373511Awb0SWwF6216fd65P1",
          "accept": "application/json"
        }),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        queryParameters: {'apikey': 'abc'},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.put(
        'https://api.loginradius.com/identity/v2/auth/account',
        data: data,
        queryParameters: {'apikey': 'abc'},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        queryParameters: {'apikey': 'abc'},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
