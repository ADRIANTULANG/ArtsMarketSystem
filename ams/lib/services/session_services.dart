import 'dart:convert';
import 'dart:io';
import 'package:ams/services/storage_services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:ams/services/headers_services.dart';
import 'package:ams/services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../../configs/appEndpoints.dart';
import '../pages/artdetailsscreen/model/artdetailscreen_model.dart';
import '../pages/homescreen/model/artist_model.dart';
import '../pages/homescreen/model/homescreen_model.dart';
import '../pages/purchasehistoryscreen/model/purchasehistory_model.dart';

class Session {
  static Future login({
    required String username,
    required String password,
  }) async {
    Get.find<HeadersServices>().headers.clear();
    try {
      http.Response response = await http.post(
          Uri.parse('${AppEndpoint.endPointDomain}/api/user/login'),
          body: {
            "email": username.toString(),
            "password": password.toString(),
          },
          headers: Get.find<HeadersServices>().headers);
      await Get.find<HeadersServices>().updateCookie(response);
      print(response.body);
      if (jsonDecode(response.body)['accountId'] != null) {
        var data = jsonDecode(response.body);

        Map userdata = {
          "accountId": data['accountId'],
          "email": data['email'],
        };
        return userdata;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future register({
    required String username,
    required String password,
  }) async {
    Get.find<HeadersServices>().headers.clear();
    try {
      http.Response response = await http.post(
          Uri.parse(
            '${AppEndpoint.endPointDomain}/api/user/register',
          ),
          body: {
            "email": username.toString(),
            "password": password.toString(),
          },
          headers: Get.find<HeadersServices>().headers);
      await Get.find<HeadersServices>().updateCookie(response);
      if (jsonDecode(response.body)['accountId'] != null) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future transact({
    required String customerAccountId,
    required String artistAccountId,
    required String artId,
  }) async {
    final body = {
      "customerAccountId": customerAccountId,
      "artistAccountId": artistAccountId,
      "_artId": artId
    };
    try {
      http.Response response = await http.post(
          Uri.parse(
            '${AppEndpoint.endPointDomain}/api/art/purchase',
          ),
          body: jsonEncode(body),
          headers: Get.find<HeadersServices>().headers);
      await Get.find<HeadersServices>().updateCookie(response);
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        Get.snackbar('Payment', 'Item not available',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: EdgeInsets.all(10),
            duration: Duration(seconds: 2));
        return false;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static createProfile({
    required String firstname,
    required String lastname,
    required String addressname,
    required String latitude,
    required String longitude,
    required String birthdate,
    required String email,
    required String number,
  }) async {
    final body = {
      "name": {"first": firstname, "last": lastname},
      "address": {
        "name": addressname,
        "coordinates": {"latitude": latitude, "longitude": longitude}
      },
      "birthdate": birthdate,
      "contact": {"email": email, "number": number},
      "account": {"role": "customer"}
    };
    try {
      http.Response response = await http.post(
          Uri.parse(
            '${AppEndpoint.endPointDomain}/api/profile',
          ),
          body: jsonEncode(body),
          headers: Get.find<HeadersServices>().headers);
      await Get.find<HeadersServices>().updateCookie(response);
      // print(response.body);
      // print(response.statusCode);
      // if (jsonDecode(response.body)['accountId'] != null) {
      //   return true;
      // } else {
      //   return false;
      // }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future reAuthencticate({
    required String username,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse('${AppEndpoint.endPointDomain}/api/user/login'),
          body: {
            "email": username.toString(),
            "password": password.toString(),
          },
          headers: Get.find<HeadersServices>().headers);
      await Get.find<HeadersServices>().updateCookie(response);
      if (jsonDecode(response.body)['accountId'] != null) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<ArtStores>> getArts() async {
    try {
      final queryParameters = {
        'latitude': Get.find<LocationServices>().user_latitude.toString(),
        'longitude': Get.find<LocationServices>().user_longitude.toString(),
      };
      final uri = Uri.https(
          '${AppEndpoint.endPointDomain_get}', '/api/arts', queryParameters);
      Map<String, String> newheaders = Get.find<HeadersServices>().headers;
      newheaders['Accept'] = 'application/json';
      newheaders['Content-type'] = 'application/json; charset=utf-8';
      http.Response response = await http.get(uri, headers: newheaders);
      await Get.find<HeadersServices>().updateCookie(response);
      // print("get arts: ${json.decode(response.statusCode.toString())}");
      // print("get arts: ${json.decode(response.body)}");
      var data = jsonEncode(jsonDecode(response.body));
      if (data.isNotEmpty) {
        return artStoresFromJson(data);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        "Message",
        "Oops.. Please try again later!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

//
  static Future<List<ArtistModel>> getArtist() async {
    try {
      final queryParameters = {
        'sortBy': 'asc',
        'role': 'artist',
        'latitude': Get.find<LocationServices>().user_latitude.toString(),
        'longitude': Get.find<LocationServices>().user_longitude.toString(),
      };
      final uri = Uri.https('${AppEndpoint.endPointDomain_get}',
          '/api/profile/all', queryParameters);
      Map<String, String> newheaders = Get.find<HeadersServices>().headers;
      newheaders['Accept'] = 'application/json';
      newheaders['Content-type'] = 'application/json; charset=utf-8';
      http.Response response = await http.get(uri, headers: newheaders);
      await Get.find<HeadersServices>().updateCookie(response);
      // // print("get arts: ${json.decode(response.body)}");
      // print(response.statusCode);
      // print(response.body);
      var data = jsonEncode(jsonDecode(response.body));
      if (data.isNotEmpty) {
        return artistModelFromJson(data);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        "Message",
        "Oops.. Please try again later!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

//
  static Future<List<ArtStores>> getArtistArts(
      {required String accountID}) async {
    try {
      final queryParameters = {'accountId': accountID};
      final uri = Uri.https('${AppEndpoint.endPointDomain_get}',
          '/api/arts/by-artists', queryParameters);
      Map<String, String> newheaders = Get.find<HeadersServices>().headers;
      newheaders['Accept'] = 'application/json';
      newheaders['Content-type'] = 'application/json; charset=utf-8';
      http.Response response = await http.get(uri, headers: newheaders);
      await Get.find<HeadersServices>().updateCookie(response);
      // // print("get arts: ${json.decode(response.body)}");
      // print(response.statusCode);
      // print(response.body);
      var data = jsonEncode(jsonDecode(response.body));
      if (data.isNotEmpty) {
        return artStoresFromJson(data);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        "Message",
        "Oops.. Please try again later!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future uploadImage({required XFile file}) async {
    try {
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse("${AppEndpoint.endPointDomain}/api/profile/avatar"),
      );
      Map<String, String> newheaders = Get.find<HeadersServices>().headers;
      newheaders['Accept'] = 'application/json';
      newheaders['Content-type'] = 'application/json; charset=utf-8';
      request.headers.addAll(newheaders);

      request.files.add(await http.MultipartFile.fromBytes(
          'images', File(file.path).readAsBytesSync(),
          filename: file.path.split("/").last,
          contentType: MediaType('image', 'png')));
      http.Response response =
          await http.Response.fromStream(await request.send());

      print("Result: ${response.statusCode}");
      if (response.statusCode == 200) {
        print(response.body);
        await Get.find<HeadersServices>().updateCookie(response);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        "Message",
        "Oops.. Please try again later!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future getProfile() async {
    try {
      final uri =
          await Uri.parse('${AppEndpoint.endPointDomain}/api/profile/own');
      http.Response response =
          await http.get(uri, headers: Get.find<HeadersServices>().headers);

      await Get.find<HeadersServices>().updateCookie(response);
      print(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("data: ${data}");
        if (data['message'] != null) {
          if (data['message'] == "Profile not found") {
            return "create profile";
          } else {
            return false;
          }
        } else if (data['name'] != null) {
          return data;
        } else {
          return false;
        }
      } else if (response.statusCode == 400) {
        return "create profile";
      } else {
        return false;
      }
    } on Exception catch (e) {
      print("error $e");

      return false;
    }
  }

  static Future updateProfile({
    required String firstname,
    required String lastname,
    required String email,
    required String number,
  }) async {
    try {
      final body = {
        "name": {"first": firstname, "last": lastname},
        "contact": {"email": email, "number": number}
      };
      final uri =
          Uri.https('${AppEndpoint.endPointDomain_get}', '/api/profile');
      Map<String, String> newheaders = Get.find<HeadersServices>().headers;
      newheaders['Accept'] = 'application/json';
      newheaders['Content-type'] = 'application/json; charset=utf-8';
      http.Response response =
          await http.put(uri, body: jsonEncode(body), headers: newheaders);
      await Get.find<HeadersServices>().updateCookie(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['name'] != null) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        "Message",
        "Oops.. Please try again later!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future updateProfileAddress(
      {required String addressname,
      required String latitude,
      required String longitude}) async {
    try {
      final body = {
        "address": {
          "coordinates": {"latitude": latitude, "longitude": longitude},
          "name": addressname
        }
      };

      final uri =
          Uri.parse('${AppEndpoint.endPointDomain}/api/profile/address');
      // Get.find<Head>()
      Map<String, String> newheaders = Get.find<HeadersServices>().headers;
      newheaders['Accept'] = 'application/json';
      newheaders['Content-type'] = 'application/json; charset=utf-8';

      http.Response response =
          await http.put(uri, body: jsonEncode(body), headers: newheaders);
      await Get.find<HeadersServices>().updateCookie(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['name'] != null) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        "Message",
        "Oops.. Please try again later!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future getArt({required String artId}) async {
    try {
      final uri =
          await Uri.parse('${AppEndpoint.endPointDomain}/api/art/s/$artId');
      http.Response response =
          await http.get(uri, headers: Get.find<HeadersServices>().headers);

      await Get.find<HeadersServices>().updateCookie(response);
      // print(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // print("data: ${jsonEncode(data)}");
        return artDetailFromJson(data);
      } else if (response.statusCode == 400) {
        return false;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print("error $e");

      return false;
    }
  }

  static Future<List<History>> getHistory() async {
    try {
      print(Get.find<StorageServices>().storage.read('accntId'));
      final uri = await Uri.parse(
          '${AppEndpoint.endPointDomain}/api/art/purchase/customer/${Get.find<StorageServices>().storage.read('accntId')}');
      http.Response response =
          await http.get(uri, headers: Get.find<HeadersServices>().headers);

      await Get.find<HeadersServices>().updateCookie(response);
      // print(jsonDecode(response.body));
      print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        return historyFromJson(response.body);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print("error $e");

      return [];
    }
  }

  Future<Map> post(String url, dynamic data) async {
    http.Response response = await http.post(
        Uri.parse('${AppEndpoint.endPointDomain}'),
        body: data,
        headers: Get.find<HeadersServices>().headers);
    await Get.find<HeadersServices>().updateCookie(response);
    return json.decode(response.body);
  }
}
