import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mute_motion_passenger/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../mainMenu/presentation/views/mainMenu_screen_view.dart';

class LoginUserApi {
  static const loginUserUrl =
      'https://gradution2024-production.up.railway.app/api/v1/passengerauth/login';
  userLogin(
      {required BuildContext context,
      required TextEditingController emailcont,
      required TextEditingController passcont}) async {
    try {
      print('before');
      Map<String, dynamic> requestBody = {
        'email': emailcont.text,
        'password': passcont.text,
      };
      Response response = await Dio().post("$loginUserUrl", data: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        navigateTo(
          context,
          MainMenuScreenView(),
        );
        print(response.data["token"]);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", response.data["token"]);
        String? token = prefs.getString("token");
        print("Token is : $token");
      }
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
        _showErrorDialog(
            context, 'Email or password aren\'t correct', emailcont, passcont);
      }
    }
  }
}

void _showErrorDialog(
  BuildContext context,
  String message,
  TextEditingController emailcont,
  TextEditingController passCont,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontFamily: 'Comfortaa', color: Colors.white),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              emailcont.clear();
              passCont.clear();
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              'OK',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Comfortaa', color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
