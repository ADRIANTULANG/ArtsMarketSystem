// // import 'package:http/browser_client.dart' as browserhttp;

// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:requests/requests.dart';

// import '../../../configs/appEndpoints.dart';
// import '../../../services/location_services.dart';
// import '../model/homescreen_model.dart';

// class HomeScreenApi {
//   static var client = http.Client();
// // <List<LoginModel>>

//   static Future<List<ArtStores>> sampleRequest() async {
//     try {
//       final queryParameters = {
//         "latitude": Get.find<LocationServices>().user_latitude.toString(),
//         "longitude": Get.find<LocationServices>().user_longitude.toString()
//       };

//       var r = await Requests.get('${AppEndpoint.endPointDomain}/api/arts',
//           queryParameters: queryParameters);
//       r.raiseForStatus();
//       String body = await r.content();
//       print(body);
//       if (body.isNotEmpty) {
//         return artStoresFromJson(body);
//       } else {
//         return [];
//       }
//     } on Exception catch (e) {
//       print(e);
//       return [];
//     }
//   }
// }
