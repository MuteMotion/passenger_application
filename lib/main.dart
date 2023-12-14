import 'package:flutter/material.dart';

import 'package:mute_motion_passenger/features/registration/presentation/views/create_Profile_screen.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/login_screen_view.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/register_screen_view.dart';
import 'package:mute_motion_passenger/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
       
      ), */
      debugShowCheckedModeBanner: false,
      home: LoginScreenView(),
    );
  }
}
//home: Splach,
