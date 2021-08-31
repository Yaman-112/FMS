//import 'package:flutter/material.dart';
////import 'package:flash_chat/components/rounded_button.dart';
//import 'package:fms/config/constants.dart';
//import'package:firebase_auth/firebase_auth.dart';
//import 'package:fms/config/palette.dart';
//import 'package:fms/main_client.dart';
//import 'package:fms/screens/members/add_members.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
//
//class CredClient extends StatefulWidget {
//  @override
//  _CredClientState createState() => _CredClientState();
//}
//
//class _CredClientState extends State<CredClient> {
//  int Number;
//  //String password;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Padding(
//        padding: EdgeInsets.symmetric(horizontal: 24.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//
//            SizedBox(
//              height: 48.0,
//            ),
//            TextField(
//              textAlign: TextAlign.center,
//              keyboardType: TextInputType.emailAddress,
//
//              onChanged: (value) {
//                //Do something with the user input.
//                Number = value;
//              },
//            ),
//            SizedBox(
//              height: 8.0,
//            ),
//
//            SizedBox(
//              height: 24.0,
//            ),
//            Container(
//
//              padding: const EdgeInsets.all(5.0),width: 350,
//              decoration: BoxDecoration(
//                color: Palette.thirdColor,
//                borderRadius: BorderRadius.all(Radius.circular(40)
////
//                ),
//              ),
//              child: FlatButton(
//
//
//
//                onPressed: () {
//                          MaterialPageRoute(builder: (context) => MyApp(text: Number),);
//                  },
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
