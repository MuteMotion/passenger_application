import 'package:flutter/material.dart';
import 'package:mute_motion_passenger/features/driverProfile/presentation/views/DriverProfileView.dart';
import 'package:mute_motion_passenger/features/driverProfile/presentation/views/widgets/driver_profile_view_body.dart';
import 'package:mute_motion_passenger/features/mainMenu/presentation/views/mainMenu_screen_view.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/OTP_screen_view.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/create_Profile_screen.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/login_screen_view.dart';
import 'package:mute_motion_passenger/features/registration/presentation/views/widgets/forget_pass.dart';
import 'package:mute_motion_passenger/features/requests/presentation/views/widgets/c_request_view.dart';
import 'package:mute_motion_passenger/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      home: RequestsScreenVieww(),
    );
  }
}
