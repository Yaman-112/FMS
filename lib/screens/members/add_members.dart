import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/screens/members/members_screen.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/widgets/custom_app_bar2.dart';
import 'package:fms/widgets/make_input.dart';

class AddMembers extends StatefulWidget {

  @override
  _AddMembersState createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {

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

  String _chosenValue_assesment;
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


  int _incrementctr() {

  }

  @override
  Widget build(BuildContext context) {


    memRef.once().then((DataSnapshot snapshot){
      setState(() {
        retrievedData = snapshot.value['member_c'];

       // retrievedData = snapshot.value['trainer_C'].toString();
      });

    });
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
                            'Enter Details',
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
                          label: 'Name',
                          obscureText: false,
                          controllerID: nameController,
                        ),
                        MakeInput(
                          label: 'Address',
                          obscureText: false,
                          controllerID: addressController,
                        ),
                        MakeInput(
                          label: 'Phone Number',
                          obscureText: false,
                          controllerID: phoneController,
                        ),
                        MakeInput(
                          label: 'Workout Type',
                          obscureText: false,
                          controllerID: wtController,
                        ),
                        MakeInput(
                          label: 'Height',
                          obscureText: false,
                          controllerID: heightController,
                        ),
                        MakeInput(
                          label: 'Fee',
                          obscureText: false,
                          controllerID: feeController,
                        ),

                        MakeInput(
                          label: 'Trainer Name',
                          obscureText: false,
                          controllerID: trainerController,
                        ),
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
                              'Manish lagwal',
                              'Pushpreet',
                              'Manish jain',
                              'Raghav',
                              'Karan',
                              'trainer',
                              'Rajinder',
                              'Harleen',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style:TextStyle(color:Colors.black),),
                              );
                            }).toList(),
                            hint:Text(
                              "Trainer Name",
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
                            value: _chosenValue_assesment,
                            //elevation: 5,
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor:Colors.black,
                            items: <String>[
                              'YES',
                              'NO',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style:TextStyle(color:Colors.black),),
                              );
                            }).toList(),
                            hint:Text(
                              "Assesment Taken",
                              style: TextStyle(
                                fontFamily: 'Varela Round',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w100,
                                color: Colors.black87,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenValue_assesment = value;
                              });
                            },
                          ),
                        ),

//                        Container(
//                          padding:
//                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                          decoration: BoxDecoration(
//                          border: Border.all(color: Colors.grey[400],),
//                          color: Colors.white,
//                          borderRadius: BorderRadius.circular(20)
//                          ),
//                          child: DropdownButton<String>(
//                           // menuMaxHeight: 10,
//                            //itemHeight: 10,
//                            focusColor:Colors.white,
//                            underline: SizedBox(),
//                            value: _chosenValue,
//                            //elevation: 5,
//                            style: TextStyle(color: Colors.white),
//                            iconEnabledColor:Colors.black,
//                            items: <String>[
//                              'PT',
//                              'GT',
//                              'NON',
//                            ].map<DropdownMenuItem<String>>((String value) {
//                              return DropdownMenuItem<String>(
//                                value: value,
//                                child: Text(value,style:TextStyle(color:Colors.black),),
//                              );
//                            }).toList(),
//                            hint:Text(
//                              "Please select the trainer profile",
//                              style: TextStyle(
//                                fontFamily: 'Varela Round',
//                                fontSize: 15.0,
//                                fontWeight: FontWeight.w100,
//                                color: Colors.black87,
//                              ),
//                            ),
//                            onChanged: (String value) {
//                              setState(() {
//                                _chosenValue = value;
//                              });
//                            },
//                          ),
//                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Registration Date',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            TextField(
                              controller: regdateController,
                              enabled: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0,
                                  horizontal: 10.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            RaisedButton(
                              child: Text('Pick a Date'),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2100),
                                ).then((_dateTime) {
                                  setState(() {
                                    regdateController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(_dateTime);
                                  });
                                });
                              },
                            ),
                          ],
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
                    ref
                    .child('COUNT')
                    .update(
                  {
                    'member_c' : retrievedData + 1
                  }).asStream(),
                  ref

                      .child('All_Members')
                      .child(trainerController.text)
                      .child(phoneController.text)
                        .set(
                      {
                        'Name': nameController.text,
                        'Address': addressController.text,
                        'Phone_Number': phoneController.text,
                        'Reg_Date': regdateController.text,
                        'Payment_Date': regdateController.text,
                        'Workout_Type': wtController.text,
                        'Height': heightController.text,
                        'Trainer_Name': trainerController.text,
                        'Fee': feeController.text,
                      //  'TP' : _chosenValue,
                        'AD': _chosenValue_assesment,
                      },
                    ).asStream(),
                    ref
                        .child('AllMembers')
                        .child(phoneController.text)
                        .set(
                      {
                        'Name': nameController.text,
                        'Address': addressController.text,
                        'Phone_Number': phoneController.text,
                        'Reg_Date': regdateController.text,
                        'Payment_Date': regdateController.text,
                        'Workout_Type': wtController.text,
                        'Height': heightController.text,
                        'Trainer_Name': trainerController.text,
                        'Fee': feeController.text,
                        //  'TP' : _chosenValue,
                        'AD': _chosenValue_assesment,
                      },
                    ).asStream(),


//                    if(_chosenValue == 'GT'){
//                    ref
//                    .child(trainerController.text)
//                    .child('GT')
//                    .child(phoneController.text)
//                    .set({
//                  'Name': nameController.text,
//                  'Address': addressController.text,
//                  'Phone_Number': phoneController.text,
//                  'Reg_Date': regdateController.text,
//                  'Payment_Date': regdateController.text,
//                  'Workout_Type': wtController.text,
//                  'Height': heightController.text,
//                  'Fee': feeController.text,
//                  'TP' : _chosenValue,
//                },
//                ).asStream(),
//                      ref
//                          .child('GT')
//                          .child(phoneController.text)
//                          .set({
//                        'Name': nameController.text,
//                        'Address': addressController.text,
//                        'Phone_Number': phoneController.text,
//                        'Reg_Date': regdateController.text,
//                        'Payment_Date': regdateController.text,
//                        'Workout_Type': wtController.text,
//                        'Height': heightController.text,
//                        'Fee': feeController.text,
//                        'TP' : _chosenValue,
//                      },
//                      ).asStream(),
//                    }else if(_chosenValue == 'PT'){
//                      ref
//                          .child(trainerController.text)
//                          .child('PT')
//                          .child(phoneController.text)
//                          .set({
//                        'Name': nameController.text,
//                        'Address': addressController.text,
//                        'Phone_Number': phoneController.text,
//                        'Reg_Date': regdateController.text,
//                        'Payment_Date': regdateController.text,
//                        'Workout_Type': wtController.text,
//                        'Height': heightController.text,
//                        'Fee': feeController.text,
//                        'TP' : _chosenValue,
//                      },
//                      ).asStream(),
//                      ref
//                          .child('PT')
//                          .child(phoneController.text)
//                          .set({
//                        'Name': nameController.text,
//                        'Address': addressController.text,
//                        'Phone_Number': phoneController.text,
//                        'Reg_Date': regdateController.text,
//                        'Payment_Date': regdateController.text,
//                        'Workout_Type': wtController.text,
//                        'Height': heightController.text,
//                        'Fee': feeController.text,
//                        'TP' : _chosenValue,
//                      },
//                      ).asStream(),
//                    },
                    nameController.clear(),
                    addressController.clear(),
                    phoneController.clear(),
                    regdateController.clear(),
                    wtController.clear(),
                    heightController.clear(),
                    feeController.clear(),
                    trainerController.clear(),
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

