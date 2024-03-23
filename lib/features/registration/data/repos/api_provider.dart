// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// import 'package:mute_motion_passenger/constants.dart';
// import 'package:mute_motion_passenger/features/mainMenu/presentation/views/mainMenu_screen_view.dart';
// import 'package:mute_motion_passenger/features/registration/presentation/views/login_screen_view.dart';
// import 'package:mute_motion_passenger/features/registration/presentation/views/widgets/create_profile_screen_BOdy.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ApiProvide {
//   static const String baseUrl =
//       "https://mutemotion.onrender.com/api/v1/passenger/login";
//   UserLogin(
//       {required BuildContext context,
//       required TextEditingController emailCont,
//       required TextEditingController passCont}) async {
//     try {
//       print('before');
//       Map<String, dynamic> requestBody = {
//         "email": emailCont.text,
//         "password": passCont.text,
//       };
//       Response response = await Dio().post(baseUrl, data: requestBody);
//       navigateTo(context, MainMenuScreenView());
//       print('Request successful');
//       print('Response: ${response.data}');
//       print(response.data["token"]);
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString("token", response.data["token"]);
//       await prefs.setString("firstname", response.data["user"]["firstname"]);
//       String? token = prefs.getString("token");
//       String? firstname = prefs.getString("firstname");

//       print("Name is :$firstname");
//       print("Token is : $token");
//     } catch (e) {
//       if (e is DioException) {
//         print(e.response?.data);
//         _showErrorDialogLogin(
//             context,
//             'Request failed!\n ${e.response?.data["message"]} ',
//             emailCont,
//             passCont);
//       }
//     }
//   }

//   void _showErrorDialogLogin(
//     BuildContext context,
//     String message,
//     TextEditingController emailCont,
//     TextEditingController passCont,
//   ) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           buttonPadding: EdgeInsets.only(right: 20, bottom: 10),
//           elevation: 20,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           backgroundColor: Colors.white,
//           content: Text(
//             message,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 25, fontFamily: 'Comfortaa', color: kPrimaryColor),
//           ),
//           actions: [
//             TextButton(
//               style: ButtonStyle(
//                 elevation: MaterialStatePropertyAll(30.0),
//                 backgroundColor:
//                     MaterialStateProperty.all<Color>(kPrimaryColor),
//                 shape: MaterialStateProperty.all<OutlinedBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(
//                         12.0), // Adjust the border radius as needed
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 emailCont.clear();
//                 passCont.clear(); // Close the dialog
//               },
//               child: Text(
//                 'Try again',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontFamily: 'Comfortaa',
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

  // UserRegisteration({
  //   required BuildContext context,
  //   required String firstName,
  //   required String lastName,
  //   required String phone,
  //   required String email,
  //   required String pass,
  //   required String veripass,
  //   required String cardnum,
  //   required String exdate,
  //   required String cvv,
  // }) async {
  //   try {
  //     FormData formData = FormData.fromMap({
  //       "firstname": firstName,
  //       "phone": phone,
  //       "lastname": lastName,
  //       "password": pass,
  //       "passwordConfirm": verifPass,
  //       "CardNumber": cardnum,
  //       "email": getUserEmail(),
  //       "ExpiryDate": exdate,
  //       "CVV": cvv,
  //     });
  //     Response response =
  //         await Dio().post("$baseUrl/passengers", data: formData);
  //     navigateTo(context, LoginScreenView());

  //     print('Request successful');
  //     print('Response: ${response.data}');
  //   } catch (e) {
  //     if (e is DioException) {
  //       print(e.response?.data);

  //       _showErrorDialogReg(
  //           context, 'Attention!', '${e.response?.data["errors"][0]["msg"]}');
  //     }
  //   }
  // }

  // void _showErrorDialogReg(
  //   BuildContext context,
  //   String title,
  //   String message,
  // ) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         buttonPadding: EdgeInsets.only(right: 20, bottom: 10),
  //         elevation: 20,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15.0),
  //         ),
  //         backgroundColor: Colors.white,
  //         title: Text(
  //           title,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               fontSize: 25,
  //               fontFamily: 'Comfortaa',
  //               fontWeight: FontWeight.bold,
  //               color: kPrimaryColor),
  //         ),
  //         content: Text(
  //           message,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               fontSize: 20, fontFamily: 'Comfortaa', color: kPrimaryColor),
  //         ),
  //         actions: [
  //           TextButton(
  //             style: ButtonStyle(
  //               elevation: MaterialStatePropertyAll(30.0),
  //               backgroundColor:
  //                   MaterialStateProperty.all<Color>(kPrimaryColor),
  //               shape: MaterialStateProperty.all<OutlinedBorder>(
  //                 RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(
  //                       12.0), // Adjust the border radius as needed
  //                 ),
  //               ),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //             child: Text(
  //               'Try again',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   fontFamily: 'Comfortaa',
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
// }
