import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class HeadersServices extends GetxController {
  Map<String, String> headers = {};

  updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      print(rawCookie);
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
      print(headers['cookie']);
    }
  }
}
