import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/widgets/custom_app_bar2.dart';
import 'package:fms/widgets/make_input.dart';

class Days extends StatefulWidget {
  final String text;
  const Days({Key key, @required this.text}) : super(key: key);

  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {

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
  String _chosenValue_one;
  String result;

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return Scaffold(

      resizeToAvoidBottomInset: false,

      backgroundColor: Palette.primaryColor,
//
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
                      child: Center(
                        child: Text(
                          'Exercise Schedule',
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
                          value: _chosenValue_one,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor:Colors.black,
                          items: <String>[
                            'Day_one',
                            'Day_two',
                            'Day_three',
                            'Day_four',
                            'Day_five',
                            'Day_six',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style:TextStyle(color:Colors.black),),
                            );
                          }).toList(),
                          hint:Text(
                            "Day",
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.black87,
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _chosenValue_one = value;
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
                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor:Colors.black,
                          items: <String>[
                            'chest',
                            'back',
                            'shoulder',
                            'Legs',
                            'Tri',
                            'bi',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style:TextStyle(color:Colors.black),),
                            );
                          }).toList(),
                          hint:Text(
                            "Execercise",
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
//                      MakeInput(
//                        label: 'Day 1',
//                        obscureText: false,
//                        controllerID: nameController,
//                      ),
//                      MakeInput(
//                        label: 'Day 2',
//                        obscureText: false,
//                        controllerID: addressController,
//                      ),
//                      MakeInput(
//                        label: 'Day 3',
//                        obscureText: false,
//                        controllerID: phoneController,
//                      ),
//                      MakeInput(
//                        label: 'Day 4',
//                        obscureText: false,
//                        controllerID: wtController,
//                      ),
//                      MakeInput(
//                        label: 'Day 5',
//                        obscureText: false,
//                        controllerID: heightController,
//                      ),
//                      MakeInput(
//                        label: 'Day 6',
//                        obscureText: false,
//                        controllerID: feeController,
//                      ),




                      SizedBox(
                        height: 20.0,
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
                            if(_chosenValue == 'chest'){
                            ref
                            .child('Exercise_sc')
                                .child(widget.text)
                            .child(_chosenValue_one)
                            .child('1')
                            .set(
                                {
                                  'one': _chosenValue,
                                }),
                            },
                            if(_chosenValue == 'back'){
                      ref
                          .child('Exercise_sc')
                          .child(widget.text)
                          .child(_chosenValue_one)
                          .child('2')
                          .set(
                      {
                      'one': _chosenValue,
                      }),
                      },
                            if(_chosenValue == 'shoulder'){
                              ref
                                  .child('Exercise_sc')
                                  .child(widget.text)
                                  .child(_chosenValue_one)
                                  .child('3')
                                  .set(
                                  {
                                    'one': _chosenValue_one,
                                  }),
                            },
                            if(_chosenValue == 'Legs'){
                              ref
                                  .child('Exercise_sc')
                                  .child(widget.text)
                                  .child(_chosenValue)
                                  .child('3')
                                  .set(
                                  {
                                    'one': _chosenValue_one,
                                  }),
                            },



//                            ref
//                                .child('Exercise')
//                                .child('Days')
//                                .child(widget.text)
//                                .set(
//                              {
//                                'Day 1': nameController.text,
//                                'Day 2': addressController.text,
//                                'Day 3': phoneController.text,
//                                'Day 4': regdateController.text,
//                                'Day 5': regdateController.text,
//                                'Day 6': wtController.text,
//                                'Day 7': heightController.text,
//                              },
//                            ).asStream(),

//                            nameController.clear(),
//                            addressController.clear(),
//                            phoneController.clear(),
//                            regdateController.clear(),
//                            wtController.clear(),
//                            heightController.clear(),
//                            feeController.clear(),
//                            trainerController.clear(),

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Text(
                                'Done',
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
            ),

          ],
        ),
      ),
    );
  }
}

