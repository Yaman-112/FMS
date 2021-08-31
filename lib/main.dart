import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fms/Exercise/days.dart';
import 'package:fms/authentication/authentication_service.dart';
import 'package:fms/authentication/authentication_wrapper.dart';
import 'package:fms/authentication/authentication_wrapper_client.dart';
import 'package:fms/navigator_TL.dart';
import 'package:fms/screens/assesment/Assesment_screen_one.dart';
import 'package:fms/screens/assesment/assesment%20_complete.dart';
import 'package:fms/screens/assesment/assesment_screen_two.dart';
import 'package:fms/screens/assesment/assesment_screen_two_input.dart';
import 'package:fms/screens/assesment/progression.dart';
import 'package:fms/screens/members/toplevelmember.dart';
import 'package:fms/screens/members/w.dart';
import 'package:fms/screens_client/Days_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/message_format.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
          context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          fontFamily: 'ProductSans',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
         //home: MyApp(),
        //home: BottomNavBar_TL(),
        //home:Days(),
   home: AuthenticationWrapper(),
        //home: Assement_confirm(),
        //home:Table_assesment(),
        //home: DayScreen(),
        //home:Assesment_two(),
       // home: Table_assesment_two_input(),
      ),
    ),
  );
}
