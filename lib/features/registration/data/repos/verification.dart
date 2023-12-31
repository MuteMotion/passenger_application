import 'package:mute_motion_passenger/constants.dart';
import 'package:mute_motion_passenger/features/registration/data/models/verification_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../presentation/views/create_Profile_screen.dart';

class Verification {
  String verificationUrl =
      'https://verifications.onrender.com/sendVerificationCode';
  String verifyCodeUrl = 'https://verifications.onrender.com/verifyCode';
  //VerificationModel? verificationModel;
  sendVerification({
    required String email,
  }) async {
    try {
      print('before');
      Map<String, dynamic> requestBody = {
        'email': email,
      };
      Response response =
          await Dio().post("$verificationUrl", data: requestBody);

      print(response.data);
      //final SharedPreferences prefs = await SharedPreferences.getInstance();
      /*  await prefs.setString("token", response.data["model"]["tokens"]["accessToken"]);
  String? token = prefs.getString("token");
  print("Token is : $token"); */

    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
    }
  }

  verifyCode(
      {required String email,
      required TextEditingController code1,
      required TextEditingController code2,
      required TextEditingController code3,
      required TextEditingController code4,
      required BuildContext context}) async {
    try {
      print('before');
      Map<String, dynamic> requestBody = {
        'email': email,
        'code': '${code1.text}${code2.text}${code3.text}${code4.text}',
      };
      Response response = await Dio().post("$verifyCodeUrl", data: requestBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        navigateTo(
          context,
          const CreateProfileScreenView(),
        );
        print('Request successful');
        print('Response: ${response.data}');
      } else {
        print('NOOOO');
        _showErrorDialog(
          context,
          'Invalid verification code', code1 , code2, code3 ,code4
        );
      }
      //final SharedPreferences prefs = await SharedPreferences.getInstance();
      /*  await prefs.setString("token", response.data["model"]["tokens"]["accessToken"]);
  String? token = prefs.getString("token");
  print("Token is : $token"); */

    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
        _showErrorDialog(
          context,
          'Invalid verification code', code1 , code2, code3 ,code4
        );
      }
    }
  }
}

void _showErrorDialog(
  BuildContext context,
  String message,
  TextEditingController code1,
  TextEditingController code2,
  TextEditingController code3,
  TextEditingController code4,
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
              code1.clear();
              code2.clear();
              code3.clear();
              code4.clear();
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
