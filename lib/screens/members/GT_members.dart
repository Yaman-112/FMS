import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/assesment/Progresstion_select.dart';
import 'package:fms/screens/assesment/assesment_two.dart';
import 'package:fms/screens/exercise_card/Add_exercise.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/drawer.dart';
import 'package:fms/widgets/custom_app_bar.dart';
import 'package:fms/widgets/custom_card_m.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'add_members.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;




class GTMembersScreen extends StatefulWidget {
  final String Name;
  const GTMembersScreen({Key key, @required this.Name}) : super(key: key);
  @override
  _GTMembersScreenState createState() => _GTMembersScreenState();
}

class _GTMembersScreenState extends State<GTMembersScreen> {

  DatabaseReference _memberRef;
  DatabaseReference _incomeRef;
  DateTime date;
  DateTime today;
  String fee;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _memberRef = database
        .reference()
        .child('Trainer_Member')
        .child(widget.Name)
        .child('GT');
    _incomeRef = database
        .reference()
        .child(FirebaseAuth.instance.currentUser.uid)
        .child('Income');
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
                          ) {
                        return CustomCardM(
                          name: snapshot.value['Name'].toString(),
                          phoneNumber:
                          snapshot.value['Phone_Number'].toString(),
                          regdate: snapshot.value['Reg_Date'].toString(),
                          paydate: snapshot.value['Payment_Date'].toString(),
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
                          {_memberRef.child(snapshot.key).remove()},
                          func5: () =>
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Exercise_AS(text:snapshot.value['Phone_Number'].toString()),
                              ),
                            ),
                          },
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



class PTMembersScreen extends StatefulWidget {
  final String Name;
  const PTMembersScreen({Key key, @required this.Name}) : super(key: key);
  @override
  _PTMembersScreenState createState() => _PTMembersScreenState();
}

class _PTMembersScreenState extends State<PTMembersScreen> {
  DatabaseReference _memberRef;
  DatabaseReference _incomeRef;
  DateTime date;
  DateTime today;
  String fee;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _memberRef = database
        .reference()
        .child('Trainer_Member')
        .child(widget.Name)
        .child('PT');
    _incomeRef = database
        .reference()
        .child(FirebaseAuth.instance.currentUser.uid)
        .child('Income');
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
                          ) {
                        return CustomCardM(
                          name: snapshot.value['Name'].toString(),
                          phoneNumber:
                          snapshot.value['Phone_Number'].toString(),
                          regdate: snapshot.value['Reg_Date'].toString(),
                          paydate: snapshot.value['Payment_Date'].toString(),
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
                          {_memberRef.child(snapshot.key).remove()},
                            func5: () =>{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Progession(),
                                    //builder: (context) => RegistrationScreen(),
                                  ),
                                ),

                            },

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
