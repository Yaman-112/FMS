import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/Exercise/Back.dart';
import 'package:fms/Exercise/Legs.dart';
import 'package:fms/Exercise/Shoulder.dart';
import 'package:fms/Exercise/Tri_Biceps.dart';
import 'package:fms/Exercise/chest.dart';
import 'package:fms/widgets/Exercise_Input.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/widgets/custom_app_bar2.dart';
import 'package:fms/widgets/make_input_exercise.dart';


class Exercise_AS extends StatelessWidget {

  final String text;
  const Exercise_AS({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor:Colors.white,
            toolbarHeight: 15,
            bottom: TabBar(
              labelColor: Palette.thirdColor,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'CHEST'),
                Tab(text: 'BACK'),
                Tab(text: 'SHOULDER'),
                Tab(text: 'LEGS'),
                Tab(text: 'TRI/BICEPS'),
              ],
            ),
            title: Text(''),
          ),

          body: TabBarView(

            children: [
              chest(text: text,),
              Back(text: text,),
              Shoulder(text: text,),
              Legs(text: text,),
              Tri_bi(text: text,),

            ],
          ),

        ),
      ),
    );
  }
}



