import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens_client/exercise.dart';
import 'package:fms/widgets/custom_app_bar.dart';
import 'package:fms/screens_client/Card_day_screen.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/drawer.dart';
import 'package:fms/widgets/custom_card_m.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'add_members.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;




class DayScreen extends StatefulWidget {
  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {

  final referenceDatabase = FirebaseDatabase.instance;
  DatabaseReference _trainerRef;
  DatabaseReference memRef;
  DateTime date;
  DateTime today;
  String salary;
  int trainer_c = 0;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _trainerRef = database
        .reference()
        .child('Days');
    memRef = database
        .reference()
        .child('COUNT');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    memRef.once().then((DataSnapshot snapshot){
      setState(() {
        trainer_c = snapshot.value['trainer_c'];
      });

    });
    final ref = referenceDatabase.reference();
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar('Days'),
      //drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
//            Container(
//              padding: const EdgeInsets.all(20.0),
//              decoration: BoxDecoration(
//                //color: Palette.secondaryColor,
//                borderRadius: BorderRadius.only(
//                  bottomLeft: Radius.circular(40.0),
//                  bottomRight: Radius.circular(40.0),
//                ),
//              ),
//              child: Row(
//                children: [
//                  Flexible(
//                    child: Container(
//                      width: MediaQuery.of(context).size.width,
//                      decoration: BoxDecoration(
//                        color: Colors.grey[350],
//                        borderRadius: BorderRadius.circular(15.0),
//                      ),
//                      child: TextField(
//                        onChanged: (value) => {},
//                        decoration: InputDecoration(
//                          enabledBorder: InputBorder.none,
//                          focusedBorder: InputBorder.none,
//                          hintText: 'Search',
//                          prefixIcon: Icon(
//                            Icons.search,
//                          ),
//                          contentPadding: const EdgeInsets.only(top: 15.0),
//                        ),
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
            Expanded(
              child: Column(
                children: [
                  Flexible(
                    child: new FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: _trainerRef,
                      itemBuilder: (
                          BuildContext context,
                          DataSnapshot snapshot,
                          Animation<double> animation,
                          int index,
                          ) {
                        return CustomCardT(
                          name: snapshot.value['one'].toString().toUpperCase(),
                         // phoneNumber: 'Exercise two : ${snapshot.value['two'].toString()}',

                          //imagePath: snapshot.value['imagePath'].toString(),
                          // 'assets/images/Harleen.JPG',
                          func1: () => {
                            UrlLauncher.launch(
                                'tel:${snapshot.value['Phone_Number'].toString()}')
                          },
                          func2: () => {
                            if('${snapshot.value['one'].toString()}' == 'back'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Back(phone: '999999',),
                                ),
                              ),

                            }else if('${snapshot.value['one'].toString()}' == 'chest'){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => Excercise(phone: '999999',),
                        ),
                        ),

                        }else{
                              print('yaman'),
                            },
//
//                            UrlLauncher.launch(
//                                'sms:${snapshot.value['Phone_Number'].toString()}')
                          },
//                          func3: () => {
//                            Alert(
//                              context: context,
//                              type: AlertType.warning,
//                              title: "Renew Salary",
//                              desc:
//                              "Are you sure you want to update trainer's salary?",
//                              buttons: [
//                                DialogButton(
//                                  child: Text(
//                                    "Renew",
//                                    style: TextStyle(
//                                        color: Colors.white, fontSize: 20),
//                                  ),
//                                  onPressed: () {
//                                    date = DateTime.parse(
//                                        snapshot.value['Pay_Date'].toString());
//                                    today = DateTime.now();
//                                    salary =
//                                        snapshot.value['Salary'].toString();
//                                    _trainerRef
//                                        .child(snapshot.key)
//                                        .child('Pay_Date')
//                                        .set(DateFormat('yyyy-MM-dd')
//                                        .format(
//                                      date.add(
//                                        Duration(days: 30),
//                                      ),
//                                    )
//                                        .toString());
//                                    _expenseRef
//                                        .child(
//                                      DateFormat('yyyy-MM-dd')
//                                          .format(today),
//                                    )
//                                        .push()
//                                        .set(
//                                      {
//                                        'Title':
//                                        '${snapshot.value['Name'].toString()}\'s Trainer Fee',
//                                        'Amount': salary,
//                                        'Date': DateFormat('yyyy-MM-dd').format(
//                                          date.add(
//                                            Duration(days: 30),
//                                          ),
//                                        ),
//                                        'Details':
//                                        'Name: ${snapshot.value['Name'].toString()}\nID: ${snapshot.key}\nTrainer\'s Monthly Fee',
//                                      },
//                                    );
//                                    Navigator.pop(context);
//                                  },
//                                  color: Color.fromRGBO(0, 179, 134, 1.0),
//                                ),
//                                DialogButton(
//                                  child: Text(
//                                    "Cancel",
//                                    style: TextStyle(
//                                        color: Colors.white, fontSize: 20),
//                                  ),
//                                  onPressed: () => Navigator.pop(context),
//                                  color: Colors.red,
//                                )
//                              ],
//                            ).show(),
//                          },
                          func4: () =>
                          {_trainerRef.child(snapshot.key).remove(),
                            trainer_c = trainer_c - 1,

                            ref
                                .child('COUNT')
                                .update({
                              'trainer_c':trainer_c
                            })
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
//            Container(
//              padding: const EdgeInsets.all(5.0),
//              width: 350,
//              decoration: BoxDecoration(
//                color: Palette.thirdColor,
//                borderRadius: BorderRadius.all(Radius.circular(40),
////                  topLeft: Radius.circular(40.0),
////                  topRight: Radius.circular(40.0),
//                ),
//              ),
//              child: FlatButton(
//                onPressed: () => {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => AddTrainers(),
//                    ),
//                  ),
//                },
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
////                    Icon(
////                      Icons.add_circle_outline,
////                      color: Colors.white,
////                      size: 40.0,
////                    ),
//                    Text(
//                      'Add Trainer',
//                      style: TextStyle(
//                        fontSize: 15,
//                        fontFamily: 'Varela Round',
//                        color: Colors.white,
//
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
