import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';

const timeout = 30;

class HttpHandler {

  static const int OK = 200;

  static const int UNAUTHORIZED = 401;

  static const int SERVER_ERROR = 500;

  static const int TIME_OUT = 408;

  static const int NOT_ENOUGH_DATA = 998;

  static const int WRONG_DATA = 999;

  static const int FAIL = 900;

  String getStandId() {
    if (Platform.isAndroid) {
      return "Android" + DateTime.now().millisecondsSinceEpoch.toString();
    } else if (Platform.isIOS) {
      return "iOS" + DateTime.now().millisecondsSinceEpoch.toString();
    } else {
      return "Unknown" + DateTime.now().toIso8601String();
    }
  }

  String getLocalTime() {
    return DateTime.now().toUtc().toString();
  }

  Future<T> call<T>(
      Future<Response<T>> requestFuture) async {
    Response<T> res = await requestFuture.timeout(
      Duration(seconds: timeout),
      onTimeout: () {
        throw Exception(
            'Server không có phản hồi, xin vui lòng thử lại sau.');
      },
    );
    return _handleResponse(res);
  }

  T _handleResponse<T>(Response<T> res) {
    if (!res.isSuccessful) {
      String errorMessage;
      if (res.error != null) {
        try {
          errorMessage = json.decode(res.error)['messageError'];
          if (errorMessage == null)
            errorMessage = json.decode(res.error)['message'];
        } catch (e) {}
      }
      throw Exception(
          errorMessage ?? 'Không thể hoàn thành tác vụ, thử lại sau');
    }
    return res.body;
  }
}