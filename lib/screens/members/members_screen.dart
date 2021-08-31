import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/SignUP_LogIN_Client/Signup_page.dart';
import 'package:fms/screens/members/GT_members.dart';
import 'package:fms/widgets/custom_card_asses.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/drawer.dart';
import 'package:fms/widgets/custom_app_bar.dart';
import 'package:fms/widgets/custom_card_m.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'add_members.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class TabView extends StatefulWidget {
  final String number;
  const TabView({Key key, @required this.number}) : super(key: key);
  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(

          drawer: AppDrawer(),
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
            //    Tab(text: 'Pending \n Task'),
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
             // MembersScreen(Name: widget.number,),
              PTMembersScreen(Name: widget.number,),
              GTMembersScreen(Name: widget.number),

            ],

          ),

        ),
      ),
    );
  }
}



class MembersScreen extends StatefulWidget {
  final String Name;
  const MembersScreen({Key key, @required this.Name}) : super(key: key);
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
  DatabaseReference UserRef;

  DateTime date;
  DateTime today;
  String fee;
  @override
  void initState() {

    print('Name : ${widget.Name}');
    bool showSpinner = true;
    final FirebaseDatabase database = FirebaseDatabase();
    _memberRef = database
        .reference()
        .child('All_Members')
        .child(widget.Name);
//    _memberRefGT = database
//        .reference()
//        .child('Trainers')
//        .child(widget.Name);
//    _memberRefPT = database
//        .reference()
//        .child(FirebaseAuth.instance.currentUser.uid)
//        .child('PT');
    _incomeRef = database
        .reference()
        .child(FirebaseAuth.instance.currentUser.uid)
        .child('Income');
    _testRef = database
        .reference()
        .child(FirebaseAuth.instance.currentUser.uid)
        .child('Members');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,

      //appBar: CustomAppBar('Members'),
      //drawer: AppDrawer(),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                //color: Palette.secondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextField(
                        onChanged: (value) => {},
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          contentPadding: const EdgeInsets.only(top: 15.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
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
                          ){
                        return CustomCard_M(
                          name: snapshot.value['Name'].toString(),
                          phoneNumber: snapshot.value['Phone_Number'].toString(),
                          AD: snapshot.value['AD'].toString(),
                          paydate: snapshot.value['Reg_Date'].toString(),
                          fee: snapshot.value['Fee'].toString(),
                          imagePath:
                          'assets/images/baby_child_children_boy-512.png',
                          func1: () => {
                            UrlLauncher.launch(
                                'tel:${snapshot.value['Phone_Number'].toString()}')
                          },
                          func2: () => {
                            UrlLauncher.launch(
                                'sms:${snapshot.value['Phone_Number'].toString()}')
                          },
                          func3: () => {
                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Renew Fee",
                              desc:
                              "Are you sure you want to update member's fee?",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Renew",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    date = DateTime.parse(snapshot
                                        .value['Payment_Date']
                                        .toString());
                                    today = DateTime.now();
                                    fee = snapshot.value['Fee'].toString();
                                    _memberRef
                                        .child(snapshot.key)
                                        .child('Payment_Date')
                                        .set(DateFormat('yyyy-MM-dd')
                                        .format(
                                      date.add(
                                        Duration(days: 30),
                                      ),
                                    )
                                        .toString());
                                    _incomeRef
                                        .child(
                                      DateFormat('yyyy-MM-dd')
                                          .format(today),
                                    )
                                        .push()
                                        .set(
                                      {
                                        'Title':
                                        '${snapshot.value['Name'].toString()}\'s Member Fee',
                                        'Amount': fee,
                                        'Date': DateFormat('yyyy-MM-dd').format(
                                          date.add(
                                            Duration(days: 30),
                                          ),
                                        ),
                                        'Details':
                                        'Name: ${snapshot.value['Name'].toString()}\nID: ${snapshot.key}\nMember\'s Monthly Fee',
                                      },
                                    );
                                    Navigator.pop(context);
                                  },
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                ),
                                DialogButton(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  color: Colors.red,
                                )
                              ],
                            ).show(),
                          },
                          func4: () =>
                          {_memberRef.child(snapshot.key).remove(),
                            _memberRefGT.child(snapshot.key).remove(),
                           _memberRefPT.child(snapshot.key).remove(),
                          },
                          func5: () =>
                          {_memberRef.child(snapshot.key).remove(),
                            _memberRefGT.child(snapshot.key).remove(),
                            _memberRefPT.child(snapshot.key).remove(),
                          },

                        );
                      },
                    ),
                  ),

                ],
              ),
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
                      builder: (context) => AddMembers(),
                      //builder: (context) => RegistrationScreen(),

                    ),
                  ),
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      'Add Member',
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
    );
  }
}
