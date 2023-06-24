// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:requests/requests.dart';

// import '../../../configs/appEndpoints.dart';

// class SplashScreenApi {
//   static var client = http.Client();
// // <List<LoginModel>>

//   static relogin({
//     required String username,
//     required String password,
//   }) async {
//     try {
//       var result = await Requests.post(
//           '${AppEndpoint.endPointDomain}/api/user/login',
//           body: {
//             "email": username.toString(),
//             "password": password.toString(),
//           });
//       result.raiseForStatus();
//       String body = result.content();
//       print(body);
//       if (jsonDecode(body)['accountId'] != null) {
//         return true;
//       } else {
//         return false;
//       }
//     } on Exception catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
