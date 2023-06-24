// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:requests/requests.dart';
// import '../../../configs/appEndpoints.dart';

// class LoginApi {
//   static var client = http.Client();
// // <List<LoginModel>>

//   static loginRequest({
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
//         var data = jsonDecode(body);

//         Map userdata = {
//           "accountId": data['accountId'],
//           "email": data['email'],
//         };
//         return userdata;
//       } else {
//         return false;
//       }
//     } on Exception catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
