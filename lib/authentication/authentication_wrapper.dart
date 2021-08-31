import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fms/main_client.dart';
import 'package:fms/screens/SignUP_LogIN_Client/Signup_page.dart';
import 'package:fms/screens/navigator.dart';
import 'package:fms/screens/splash/welcome_page.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return BottomNavBar();
    } else {
      return WelcomePage();
    }
//    if (firebaseUser != null) {
//      return RegistrationScreen();
//    } else {
//      return RegistrationScreen();
//    }

  }
}
