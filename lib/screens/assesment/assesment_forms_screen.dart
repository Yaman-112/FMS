import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/SignUP_LogIN_Client/Signup_page.dart';
import 'package:fms/screens/assesment/Assesment_screen_one.dart';
import 'package:fms/screens/assesment/assesment_screen_two.dart';
import 'package:fms/screens/assesment/assesment_two.dart';
import 'package:fms/screens/assesment/progression.dart';
import 'package:fms/screens/members/GT_members.dart';
import 'package:fms/screens/members/members_screen.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/drawer.dart';
import 'package:fms/widgets/custom_app_bar.dart';
import 'package:fms/widgets/custom_card_m.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class Assesment_form_screen extends StatefulWidget {
  final String text;
  const Assesment_form_screen({Key key, @required this.text}) : super(key: key);
  @override
  _Assesment_form_screenState createState() => _Assesment_form_screenState();
}




class _Assesment_form_screenState extends State<Assesment_form_screen> {


  var retrievedData = '';
  DatabaseReference _UserRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _UserRef = database
        .reference()
        .child('trainer_uid')
        .child(FirebaseAuth.instance.currentUser.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _UserRef.once().then((DataSnapshot snapshot){
      setState(() {
        retrievedData = snapshot.value['Name'].toString();
        print('Data_two : ${retrievedData}');
      });
    });
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Palette.secondaryColor),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),

              Container(
                padding: const EdgeInsets.all(5.0),width: 350,
                decoration: BoxDecoration(
                  color: Palette.thirdColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)
//                  topLeft: Radius.circular(40.0),
//                  topRight: Radius.circular(40.0),
                  ),
                ),
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Table_assesment(text: widget.text,),
                        //builder: (context) => RegistrationScreen(),

                      ),
                    ),
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                    Icon(
//                      Icons.add_circle_outline,
//                      color: Colors.white,
//                      size: 40.0,
//                    ),
                      Text(
                        'Form 1',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Varela Round',
                          //fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),width: 350,
                decoration: BoxDecoration(
                  color: Palette.thirdColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)
                  ),
                ),
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Table_assesment_two(text: widget.text,),
                        //builder: (context) => RegistrationScreen(),

                      ),
                    ),
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                    Icon(
//                      Icons.add_circle_outline,
//                      color: Colors.white,
//                      size: 40.0,
//                    ),
                      Text(
                        'Form 2',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Varela Round',
                          //fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
