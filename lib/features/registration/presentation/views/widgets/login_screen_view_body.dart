import 'package:flutter/material.dart';

import 'package:mute_motion_passenger/constants.dart';
import 'package:mute_motion_passenger/features/registration/data/repos/forgotyourPass.dart';
import 'package:mute_motion_passenger/features/registration/data/repos/login_user.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/create_Profile_screen.dart';
import 'package:mute_motion_passenger/features/registration/data/repos/api_provider.dart';

import '../../../../mainMenu/presentation/views/mainMenu_screen_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenViewBody extends StatefulWidget {
  const LoginScreenViewBody({super.key});

  @override
  State<LoginScreenViewBody> createState() => _LoginScreenViewBodyState();
}

class _LoginScreenViewBodyState extends State<LoginScreenViewBody> {
  bool _isLoading = false;
  bool Show_Pass = true;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: kPrimaryColor,
      inAsyncCall: _isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Center(
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor))),
                Divider(thickness: 2),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: emailCont,
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text(
                      "Email",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    prefixIcon: Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    prefixIconColor: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: passCont,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password must not be empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: Show_Pass,
                  decoration: InputDecoration(
                    label: const Text(
                      "Password",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    prefixIconColor: kPrimaryColor,
                    suffixIconColor: kPrimaryColor,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          Show_Pass = !Show_Pass;
                        });
                      },
                      icon: Icon(
                          Show_Pass ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      setUserEmail(emailCont.text);
                      setState(() {
                        _isLoading = true;
                      });
                      ForgotPassApi()
                          .forgotPass(context: context, emailcont: emailCont);
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: Text(
                      "Forgot Your Password",
                      style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 16,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff003248),
                      borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          setUserEmail(emailCont.text);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('email', emailCont.text);
                          await LoginUserApi().userLogin(
                              context: context,
                              emailcont: emailCont,
                              passcont: passCont);
                          // setState(() {
                          //   _isLoading = false;
                          // }
                          // );
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Comfortaa',
                            color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Comfortaa',
                          )),
                      TextButton(
                          onPressed: () {
                            navigateTo(
                              context,
                              CreateProfileScreenView(),
                            );
                          },
                          child: const Text(
                            "Register now",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
