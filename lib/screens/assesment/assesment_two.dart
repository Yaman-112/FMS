import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/Exercise/days.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/assesment/assesment%20_complete.dart';
import 'package:fms/screens/assesment/assesment_screen_two.dart';
import 'package:fms/screens/assesment/assesment_screen_two_input.dart';
import 'package:fms/widgets/custom_app_bar.dart';
import 'package:fms/widgets/make_input.dart';
import 'package:fms/widgets/make_input_assesment.dart';
import'package:fms/screens/assesment/assesmentform.dart';

class Assesment_two extends StatefulWidget{
  final String text;
  const Assesment_two({Key key, @required this.text}) : super(key: key);
  @override
  _Assesment_twoState createState() => _Assesment_twoState();
}

class _Assesment_twoState extends State<Assesment_two> {

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


  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.primaryColor,
//
      appBar: AppBar(
          title: Text('CV Endurance Testing'),),

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

//                              SizedBox(
//                                width: 250,
//                                child: MakeInput(
//                                  label: 'Name',
//                                  obscureText: false,
//                                  controllerID: name,
//                                ),
//                              ),
//                              SizedBox(
//                                width: 250,
//                                child: MakeInput(
//                                  label: 'Phone',
//                                  obscureText: false,
//                                  controllerID: phone,
//                                ),
//                              ),

                              Text(
                                'Test 1:  VT 1 TESTING',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              MakeInputA(
                                label: 'RESULT',
                                obscureText: false,
                                controllerID: Result_one,
                              ),
                              MakeInputA(
                                label: 'Pre & Post HR',
                                obscureText: false,
                                controllerID: Pre_one,
                              ),
                              MakeInputA(
                                label: 'Remarks',
                                obscureText: false,
                                controllerID: Remark_one,
                              ),
                              Text(
                                  'ROCKFORD FITNESS WALKING',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              MakeInputA(
                                label: 'RESULT',
                                obscureText: false,
                                controllerID: Result_two,

                              ),
                              MakeInputA(
                                label: 'Pre & Post HR',
                                obscureText: false,
                                controllerID: Pre_two,
                              ),
                              MakeInputA(
                                label: 'Remarks',
                                obscureText: false,
                                controllerID: Remark_two,
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
    builder: (context) => Assesment_three(text: widget.text,),
    ),
    ),
    ref
        .child('Assesment')
        .child(widget.text)
        .child('CVendurance')
        .set(
    {
    'Result_one': Result_one.text,
      'Remark_one': Remark_one.text,
      'Pre_one': Pre_one.text,

      'Result_two': Result_two.text,
      'Pre_two': Pre_two.text,
      'Remark_two': Remark_two.text,
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



class Assesment_three extends StatefulWidget{
  final String text;
  const Assesment_three({Key key, @required this.text}) : super(key: key);
  @override
  _Assesment_threeState createState() => _Assesment_threeState();
}

class _Assesment_threeState extends State<Assesment_three> {

  var _formkey = GlobalKey<FormState>();
  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController Result_one  = TextEditingController();
  final TextEditingController Pre_one = TextEditingController();
  final TextEditingController Remark_one = TextEditingController();
  final TextEditingController Result_two  = TextEditingController();
  final TextEditingController Pre_two = TextEditingController();
  final TextEditingController Remark_two = TextEditingController();
  final TextEditingController Result_three  = TextEditingController();
  final TextEditingController Pre_three = TextEditingController();
  final TextEditingController Remark_three = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.primaryColor,
//
      appBar: AppBar(
        title: Text('MUSCULAR ENDURANCE TESTING'),),

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
                              Text(
                                  'PUSH UP'
                              ),
                              MakeInputA(
                                label: 'RESULT',
                                obscureText: false,
                                controllerID: Result_one,
                              ),
                              MakeInputA(
                                label: 'Pre & Post HR',
                                obscureText: false,
                                controllerID: Pre_one,
                              ),
                              MakeInputA(
                                label: 'Remarks',
                                obscureText: false,
                                controllerID: Remark_one,
                              ),
                              Text(
                                  'CURL UP'
                              ),
                              MakeInputA(
                                label: 'RESULT',
                                obscureText: false,
                                controllerID: Result_two,

                              ),
                              MakeInputA(
                                label: 'Pre & Post HR',
                                obscureText: false,
                                controllerID: Pre_two,
                              ),
                              MakeInputA(
                                label: 'Remarks',
                                obscureText: false,
                                controllerID: Remark_two,
                              ),


                              Text(
                                  'BODY WEIGHT SQUAT'
                              ),
                              MakeInputA(
                                label: 'RESULT',
                                obscureText: false,
                                controllerID: Result_three,

                              ),
                              MakeInputA(
                                label: 'Pre & Post HR',
                                obscureText: false,
                                controllerID: Pre_three,
                              ),
                              MakeInputA(
                                label: 'Remarks',
                                obscureText: false,
                                controllerID: Remark_three,
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
                                    builder: (context) => Assesment_four(text: widget.text,),
                                  ),
                                ),
                                ref
                                    .child('Assesment')
                                    .child(widget.text)
                                    .child('muscularE')
                                    .set(
                                  {
                                    'Result_one': Result_one.text,
                                    'Remark_one': Remark_one.text,
                                    'Pre_one': Pre_one.text,

                                    'Result_two': Result_two.text,
                                    'Pre_two': Pre_two.text,
                                    'Remark_two': Remark_two.text,

                                    'Result_three': Result_three.text,
                                    'Pre_three': Pre_three.text,
                                    'Remark_three': Remark_three.text,

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



class Assesment_four extends StatefulWidget{
  final String text;
  const Assesment_four({Key key, @required this.text}) : super(key: key);
  @override
  _Assesment_fourState createState() => _Assesment_fourState();
}

class _Assesment_fourState extends State<Assesment_four> {

  var _formkey = GlobalKey<FormState>();
  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController Result_one  = TextEditingController();
  final TextEditingController Pre_one = TextEditingController();
  final TextEditingController Remark_one = TextEditingController();
  final TextEditingController Result_two  = TextEditingController();
  final TextEditingController Pre_two = TextEditingController();
  final TextEditingController Remark_two = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.primaryColor,
//
      appBar: AppBar(
        title: Text('MUSCULAR STRENGTH TESTING'),),

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
                              Text(
                                  'UPPER BODY (BENCH PRESS)'
                              ),
                              MakeInputA(
                                label: 'RESULT',
                                obscureText: false,
                                controllerID: Result_one,
                              ),
                              MakeInputA(
                                label: 'Pre & Post HR',
                                obscureText: false,
                                controllerID: Pre_one,
                              ),
                              MakeInputA(
                                label: 'Remarks',
                                obscureText: false,
                                controllerID: Remark_one,
                              ),
                              Text(
                                  'LOWER BODY (SQUAT)'
                              ),
                              MakeInputA(
                                label: 'RESULT',
                                obscureText: false,
                                controllerID: Result_two,

                              ),
                              MakeInputA(
                                label: 'Pre & Post HR',
                                obscureText: false,
                                controllerID: Pre_two,
                              ),
                              MakeInputA(
                                label: 'Remarks',
                                obscureText: false,
                                controllerID: Remark_two,
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
                                    builder: (context) => Table_assesment_two_input(text: widget.text,),
                                  ),
                                ),
                                ref
                                    .child('Assesment')
                                    .child(widget.text)
                                    .child('muscularS')
                                    .set(
                                  {
                                    'Result_one': Result_one.text,
                                    'Remark_one': Remark_one.text,
                                    'Pre_one': Pre_one.text,

                                    'Result_two': Result_two.text,
                                    'Pre_two': Pre_two.text,
                                    'Remark_two': Remark_two.text,
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