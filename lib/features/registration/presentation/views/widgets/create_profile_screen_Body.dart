import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mute_motion_passenger/constants.dart';
import 'package:mute_motion_passenger/core/styles.dart';
import 'package:mute_motion_passenger/core/utils/widgets/custom_button.dart';
import 'package:mute_motion_passenger/core/utils/widgets/customtextfield.dart';
import 'package:mute_motion_passenger/features/mainMenu/presentation/views/mainMenu_screen_view.dart';
import 'package:mute_motion_passenger/features/registration/data/models/user_model.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/OTP_screen_view.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/add_card_view.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/create_Profile_screen.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/login_screen_view.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/widgets/add_card_view_body.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/widgets/custom_drop_down.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfileScreenBody extends StatefulWidget {
  CreateProfileScreenBody({super.key});

  @override
  State<CreateProfileScreenBody> createState() =>
      _CreateProfileScreenBodyState();
}

final TextEditingController firstName = TextEditingController();
final TextEditingController lastName = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController phone = TextEditingController();
final TextEditingController pass = TextEditingController();
final TextEditingController verifPass = TextEditingController();

class _CreateProfileScreenBodyState extends State<CreateProfileScreenBody> {
  var formKey = GlobalKey<FormState>();

  bool showPassword = true;
  bool _isLoading = false;

  bool showVerifPassword = true;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          // leading: IconButton(
          //     iconSize: 30,
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(MaterialPageRoute(
          //           builder: (context) => RegisterScreenView()));
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back_ios,
          //       color: kPrimaryColor,
          //     )),
          title: Text(
            'Create Your Profile',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome,',
                    style: Styles.textStyle15.copyWith(color: kPrimaryColor),
                  ),
                  Text(
                    'Let us know some information about you!!',
                    style: Styles.textStyle15
                        .copyWith(fontSize: 12, color: kPrimaryColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.95,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(
                          20,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/person.png'),
                            radius: 60,
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Upload Image',
                              style: Styles.textStyle12.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: CustomTextField(
                                  obscureText: false,
                                  controller: firstName,
                                  hintText: 'First name',
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: CustomTextField(
                                obscureText: false,
                                controller: lastName,
                                hintText: 'Last name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (value) {
                                  final bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!);
                                  if (value!.isEmpty) {
                                    return "Email can't be empty";
                                  } else if (emailValid == false) {
                                    return "Email format not valid";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: GoogleFonts.comfortaa(
                                    color: Colors.black.withOpacity(0.65),
                                    fontSize: 12,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Phone can't be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Phone',
                                  hintStyle: GoogleFonts.comfortaa(
                                    color: Colors.black.withOpacity(0.65),
                                    fontSize: 12,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                obscureText: showPassword,
                                keyboardType: TextInputType.visiblePassword,
                                controller: pass,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password must not be empty";
                                  } else if (value.length < 6) {
                                    return "Password can't be less than 6 letters";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                  ),
                                  hintText: 'password',
                                  hintStyle: GoogleFonts.comfortaa(
                                    color: Colors.black.withOpacity(0.65),
                                    fontSize: 12,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                obscureText: showVerifPassword,
                                keyboardType: TextInputType.visiblePassword,
                                controller: verifPass,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Can\'t be Empty';
                                  } else if (pass.text != verifPass.text) {
                                    return 'Passwords aren\'t identical';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(showVerifPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        showVerifPassword = !showVerifPassword;
                                      });
                                    },
                                  ),
                                  hintText: 'Verify your password',
                                  hintStyle: GoogleFonts.comfortaa(
                                    color: Colors.black.withOpacity(0.65),
                                    fontSize: 12,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomDropDown(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Add Credit Card',
                                      style: GoogleFonts.comfortaa(
                                        color: Colors.black.withOpacity(0.65),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddCardView()));
                                      },
                                      icon: Icon(Icons.arrow_right)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 22, left: 10),
                    //padding: EdgeInsets.all(8),
                    width: double.infinity,
                    height: 58,
                    decoration: BoxDecoration(
                        color: const Color(0xff003248),
                        borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                        
                          String url =
                              'https://mutemotion.onrender.com/api/v1/passenger/signup';
                          Map<String, dynamic> requestData = {
                            "firstname": firstName.text,
                            "lastname": lastName.text,
                            "email": email.text,
                            "password": pass.text,
                            "passwordConfirm": verifPass.text,
                            "CardNumber": cardNumberController.text,
                            "ExpiryDate": expiryDateController.text,
                            "CVV": cvvController.text,
                            "gender": dropdownValue!,
                            "phone": phone.text
                          };
                          try {
                            // Encode the data to JSON
                            String jsonBody = jsonEncode(requestData);
                            // Make the HTTP POST request
                            final response = await http.post(
                              Uri.parse(url),
                              headers: {
                                'Content-Type': 'application/json',
                              },
                              body: jsonBody,
                            );
                            if (response.statusCode == 200 ||
                                response.statusCode == 201) {
                              print('Request successful');
                              print('Response: ${response.body}');
                              setUserEmail(email.text);
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
       /*  await prefs.setString("token", response.data["token"]);
        String? token = prefs.getString("token");
        print("Token is : $token");
        print("after");
        await prefs.setString("_id", response.data["user"]["_id"]);
        String? id = prefs.getString("_id");
        print("Id is : $id");
        print('after222'); */
                              navigateTo(
                                context,
                                OTPScreenView(),
                              );
                            } else if (response.statusCode == 400) {
                              _showErrorDialog(
                                  context,
                                  "This Email Already Exists",
                                  firstName,
                                  lastName,
                                  email,
                                  pass,
                                  verifPass,
                                  cardNumberController,
                                  expiryDateController,
                                  cvvController,
                                  phone);

                              print(
                                  'Request failed with status: ${response.statusCode}');
                              print('Response: ${response.body}');
                            }
                          } catch (error) {
                            print('Error: $error');
                          }
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: Text(
                        "Done",
                        style: GoogleFonts.comfortaa(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showErrorDialog(
  BuildContext context,
  String message,
  TextEditingController firstName,
  TextEditingController lastName,
  TextEditingController email,
  TextEditingController pass,
  TextEditingController verifPass,
  TextEditingController cardNumberController,
  TextEditingController expiryDateController,
  TextEditingController cvvController,
  TextEditingController phone,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content:
            Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontFamily: 'Comfortaa', color: kPrimaryColor),
          // ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              firstName.clear();
              lastName.clear();
              email.clear();
              verifPass.clear();
              cardNumberController.clear();
              expiryDateController.clear();
              cvvController.clear();
              pass.clear();
              phone.clear();
              Navigator.of(context).pop();
              navigateTo(context, OTPScreenView());
              // Close the dialog
            },
            child: Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Try Again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Comfortaa',
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
