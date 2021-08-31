import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/members/members_screen.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/widgets/custom_app_bar2.dart';
import 'package:fms/widgets/make_input.dart';

class Assement_confirm extends StatefulWidget {

  @override
  _Assement_confirmState createState() => _Assement_confirmState();
}

class _Assement_confirmState extends State<Assement_confirm> {

  var _formkey = GlobalKey<FormState>();
  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController regdateController = TextEditingController()
    ..text = 'Please select a Registration Date.';
  final TextEditingController wtController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  final TextEditingController trainerController = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();



  String newUser;
  String _chosenValue;
  String result;
  int a = 0;





  int retrievedData = 0;

  var retrievedData_two = '';
  DatabaseReference traRef;

  DatabaseReference memRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    memRef = database
        .reference()
        .child('COUNT');
    super.initState();
  }



  @override
  Widget build(BuildContext context) {



    final ref = referenceDatabase.reference();
    return Scaffold(

      resizeToAvoidBottomInset: false,

      backgroundColor: Palette.primaryColor,
//
      body: SafeArea(
        child: Form(

          key: _formkey,
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
                        child: Center(
                          child: Text(
                            'Confirm Assesment',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        MakeInput(
                          label: 'Trainers Name',
                          obscureText: false,
                          controllerID: nameController,
                        ),

                        MakeInput(
                          label: 'Client Phone Number',
                          obscureText: false,
                          controllerID: phoneController,
                        ),


                        SizedBox(
                          height: 20.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width:350,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Palette.thirdColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)
//                  topLeft: Radius.circular(40.0),
//                  topRight: Radius.circular(40.0),
                  ),
                ),
                child: FlatButton(
                  onPressed: () =>
                  {
                    if(_formkey.currentState.validate()){
                    FirebaseDatabase.instance.reference()
                    .child('Assesment_done')
                    .child(nameController.text)
                    .child(phoneController.text)
                    .once()
                    .then((DataSnapshot snapshot) {
                    FirebaseDatabase.instance.reference()
                        .child('Assesment_done')
                        .child(nameController.text)
                        .child(phoneController.text)
                        .remove();
                }),




                  nameController.clear(),
                      phoneController.clear(),
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                    Icon(
//                      Icons.add_circle_outline,
//                      color: Colors.white,
//                      size: 20.0,
//                    ),
                      Text(
                        'Confirm Details',
                        style: TextStyle(
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
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

