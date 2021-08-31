import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/SignUP_LogIN_Client/Signup_page.dart';
import 'package:fms/screens/assesment/assesment_prog.dart';
import 'package:fms/screens/assesment/assesment_two.dart';
import 'package:fms/screens/assesment/progression.dart';
import 'package:fms/screens/members/GT_members.dart';
import 'package:fms/screens/members/members_screen.dart';
import 'package:fms/screens/members/w.dart';
import 'package:fms/screens/prog/prog_12.dart';
import 'package:fms/screens/prog/prog_24.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/drawer.dart';
import 'package:fms/widgets/custom_app_bar.dart';
import 'package:fms/widgets/custom_card_m.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class PT_GT_SELECT extends StatefulWidget {
  final String Name;
  final String Phone;
  const PT_GT_SELECT({Key key, @required this.Name, this.Phone}) : super(key: key);
  @override
  _PT_GT_SELECTState createState() => _PT_GT_SELECTState();
}

class _PT_GT_SELECTState extends State<PT_GT_SELECT> {


  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  String retrievedData_one ='';
  String Address ='';
  String Fee ='';
  String Height ='';
  String Name ='';
  String Payment_Date ='';
  String Phone_Number ='';
  String Reg_Date ='';
  String TP ='';
  String Trainer_Name='';
  String _chosenValue;
  String Remark_one ='';
  String Remark_two ='';
  String Remark_three ='';
  String Remark_four ='';
  String Remark_five ='';
  String Remark_six ='';
  String Remark_seven ='';
  String Remark_eight ='';

  DatabaseReference _UserRef;

  DatabaseReference _detailRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _UserRef = database
        .reference()
        .child('trainer_uid')
        .child(FirebaseAuth.instance.currentUser.uid);

    _detailRef = database
        .reference()
        .child('AllMembers')
        .child(widget.Phone);
        //.child('7766554433');


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final ref = referenceDatabase.reference();


    _detailRef.once().then((DataSnapshot snapshot){
      setState(() {

        Address    =   snapshot.value['Address'].toString();
        Fee    =   snapshot.value['Fee'].toString();
        Height  =   snapshot.value['Height'].toString();
        Name   =   snapshot.value['Name'].toString();
        Payment_Date   =   snapshot.value['Payment_Date'].toString();
        Phone_Number    =   snapshot.value['Phone_Number'].toString();
        Reg_Date  =   snapshot.value['Reg_Date'].toString();
        TP  =   snapshot.value['TP'].toString();
        Trainer_Name  =   snapshot.value['Trainer_Name'].toString();



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

              Container(

                padding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400],),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)

                ),
                child: DropdownButton<String>(
                  // menuMaxHeight: 10,
                  //itemHeight: 10,
                  focusColor:Colors.white,
                  underline: SizedBox(),
                  value: _chosenValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor:Colors.black,
                  items: <String>[
                    'PT',
                    'GT',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  hint:Text(
                    "Please select the trainer profile",
                    style: TextStyle(
                      fontFamily: 'Varela Round',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.black87,
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),

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

                    if(_chosenValue == 'GT'){
                      ref
                          .child('GT')
                          .child(Phone_Number)
                          .set({

                        'Name': Name,
                        'Address': Address,
                        'Phone_Number': Phone_Number,
                        'Reg_Date': Reg_Date,
                        'Payment_Date': Payment_Date,
                        //'Workout_Type': Workout_Type,
                        'Height': Height,
                        'Fee': Fee,
                        'TP' : _chosenValue,
                      },
                      ).asStream(),

                      ref
                          .child('Trainer_Member')
                          .child(Trainer_Name)
                          .child('GT')
                          .child(Phone_Number)
                          .set({

                        'Name': Name,
                        'Address': Address,
                        'Phone_Number': Phone_Number,
                        'Reg_Date': Reg_Date,
                        'Payment_Date': Payment_Date,
                        //'Workout_Type': Workout_Type,
                        'Height': Height,
                        'Fee': Fee,
                        'TP' : _chosenValue,
                      },
                      ).asStream(),

                    }else if(_chosenValue == 'PT'){

                      ref
                          .child('PT')
                          .child(Phone_Number)
                          .set({
                        'Name': Name,
                        'Address': Address,
                        'Phone_Number': Phone_Number,
                        'Reg_Date': Reg_Date,
                        'Payment_Date': Payment_Date,
                        //'Workout_Type': Workout_Type,
                        'Height': Height,
                        'Fee': Fee,
                        'TP' : _chosenValue,
                      },
                      ).asStream(),
                      ref
                          .child('Trainer_Member')
                          .child(Trainer_Name)
                          .child('PT')
                          .child(Phone_Number)
                          .set({

                        'Name': Name,
                        'Address': Address,
                        'Phone_Number': Phone_Number,
                        'Reg_Date': Reg_Date,
                        'Payment_Date': Payment_Date,
                        //'Workout_Type': Workout_Type,
                        'Height': Height,
                        'Fee': Fee,
                        'TP' : _chosenValue,
                      },
                      ).asStream(),
                    },



                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => www(),
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
                        'Done',
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
            ],
          ),
        ),
      ),
    );
  }
}
