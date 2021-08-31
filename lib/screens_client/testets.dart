import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/SignUP_LogIN_Client/Signup_page.dart';
import 'package:fms/screens/members/GT_members.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/drawer.dart';
import 'package:fms/widgets/custom_app_bar.dart';
import 'package:fms/screens_client/cardExercise.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'add_members.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class exerciseC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          //drawerScrimColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Palette.primaryColor,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Palette.thirdColor,
              labelColor: Palette.thirdColor,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
//              indicator: BoxDecoration(
//                  borderRadius: BorderRadius.circular(50),
//                  color: Palette.thirdColor),
              tabs: [
                Tab(text: 'ALL'),
                Tab(text: 'PT'),
                Tab(text: 'GT'),

              ],
            ),
            title: Text('Members',style: TextStyle(
              color: Colors.black,
            ),),
          ),

          body: TabBarView(
            children: [
              MembersScreen(),
              PTMembersScreen(),
              GTMembersScreen(),

            ],
          ),

          drawer: AppDrawer(),
        ),
      ),
    );
  }
}



class MembersScreen extends StatefulWidget {
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  bool showSpinner = false;
  DatabaseReference _memberRef;
  DatabaseReference _memberRefGT;
  DatabaseReference _memberRefPT;
  DatabaseReference _incomeRef;
  DatabaseReference _testRef;
  DateTime date;
  DateTime today;
  String fee;



  @override
  void initState() {
    bool showSpinner = true;
    final FirebaseDatabase database = FirebaseDatabase();
    _memberRef = database
        .reference()
        .child('Exercise')
        .child('Rohan');


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: Column(
                children: [
                  Flexible(
                    child: new FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: _memberRef,
                      itemBuilder: (
                          BuildContext context,
                          DataSnapshot snapshot,
                          Animation<double> animation,
                          int index,
                          ) {
                        return CustomCardM(
                          name: snapshot.value['Name'].toString(),
                        );
                      },
                    ),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
