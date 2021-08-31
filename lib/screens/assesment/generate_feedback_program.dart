import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/SignUP_LogIN_Client/Signup_page.dart';
import 'package:fms/screens/assesment/Assesment_screen_one.dart';
import 'package:fms/screens/assesment/PT_GT_SELECT.dart';
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

import 'package:fms/widgets/make_input_assesment.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Generate_feedback_program extends StatefulWidget {
  final String text;
  const Generate_feedback_program({Key key, @required this.text}) : super(key: key);
  @override
  _Generate_feedback_programState createState() => _Generate_feedback_programState();
}

class _Generate_feedback_programState extends State<Generate_feedback_program> {


  var _formkey = GlobalKey<FormState>();
  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController name  = TextEditingController();
  //final TextEditingController phone  = TextEditingController();
  final TextEditingController Result_one  = TextEditingController();
  final TextEditingController Pre_one = TextEditingController();
  final TextEditingController Remark_one = TextEditingController();
  final TextEditingController Result_two  = TextEditingController();
  final TextEditingController Pre_two = TextEditingController();
  final TextEditingController Remark_two = TextEditingController();
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
    final ref = referenceDatabase.reference();
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.primaryColor,
//
      appBar: AppBar(
        title: Text('Generate Fitness Program'),),

      body: Form(
        key: _formkey,
        child: SafeArea(

          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [




                              MakeInputA(
                                label: 'Enter Details',
                                obscureText: false,
                                controllerID: Result_one,
                              ),

                            ],
                          ),
                        ),

                        SizedBox(
                          height: 60,
                        ),
                        Container(

                          width:200,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Palette.thirdColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)

                            ),
                          ),
                          child: FlatButton(
                            onPressed: () => {
                              if(_formkey.currentState.validate()){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PT_GT_SELECT(Phone: widget.text,),
                                  ),
                                ),
                                ref
                                    .child('Assesment')
                                    .child(widget.text)
                                    .child('Fitness_Program')
                                    .set(
                                  {
                                    'Fitness_Program': Result_one.text,
                                  },
                                ).asStream(),
                                Result_one.clear(),
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'NEXT',
                                  style: TextStyle(
                                    fontFamily: 'Varela Round',
                                    fontSize: 17,
                                    //fontWeight: FontWeight.w600,
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
              ),





            ],
          ),
        ),
      ),
    );
  }
}
