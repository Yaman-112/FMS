import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/Exercise/days.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/widgets/make_input_exercise.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';






class Tri_bi extends StatefulWidget{
  final String text;
  const Tri_bi({Key key, @required this.text}) : super(key: key);
  @override
  _Tri_biState createState() => _Tri_biState();
}

class _Tri_biState extends State<Tri_bi> {
  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController set_one = TextEditingController();
  final TextEditingController set_two = TextEditingController();
  final TextEditingController set_three = TextEditingController();
  final TextEditingController set_four = TextEditingController();
  final TextEditingController set_five = TextEditingController();
  final TextEditingController set_six = TextEditingController();
  final TextEditingController set_seven = TextEditingController();
  final TextEditingController set_eight = TextEditingController();

  final TextEditingController rep_one = TextEditingController();
  final TextEditingController rep_two = TextEditingController();
  final TextEditingController rep_three = TextEditingController();
  final TextEditingController rep_four = TextEditingController();
  final TextEditingController rep_five = TextEditingController();
  final TextEditingController rep_six = TextEditingController();
  final TextEditingController rep_seven = TextEditingController();
  final TextEditingController rep_eight = TextEditingController();

  final TextEditingController rest_one = TextEditingController();
  final TextEditingController rest_two = TextEditingController();
  final TextEditingController rest_three = TextEditingController();
  final TextEditingController rest_four = TextEditingController();
  final TextEditingController rest_five = TextEditingController();
  final TextEditingController rest_six = TextEditingController();
  final TextEditingController rest_seven = TextEditingController();
  final TextEditingController rest_eight = TextEditingController();

  final TextEditingController set = TextEditingController();

  final TextEditingController reps = TextEditingController();
  final TextEditingController rest = TextEditingController();

  final TextEditingController phone_Number = TextEditingController()
    ..text = 'Please select a Registration Date.';
  final TextEditingController wtController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
String _chosenValue;
  @override
  Widget build(BuildContext context) {
    double wid = 30;

    final ref = referenceDatabase.reference();
    ScreenScaler scaler = new ScreenScaler()..init(context);

    //ScreenScalerscaler = new ScreenScaler..init(context);
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.primaryColor,
//
      body: SafeArea(

        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(

                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
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
                            'Day_one',
                            'Day_two',
                            'Day_three',
                            'Day_four',
                            'Day_five',
                            'Day_six',
                            'Day_seven',
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
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                      Center(

                        child:Text('TRICEPS',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Container(
                          width: scaler.getWidth(wid),
                          child: Text(
                              'triceps Extn'
                          ),
                        ),

//                          Text(
//                              'm/c Seated \nRow                         '
//                          ),

                          MakeInput(
                            label: 'Sets',
                            obscureText: false,
                            controllerID: set_one,
                          ),
                          MakeInput(
                            label: 'Reps',
                            obscureText: false,
                            controllerID: rep_one,
                          ),
                          MakeInput(
                            label: 'Rest',
                            obscureText: false,
                            controllerID: rest_one,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Rev. Grip Pulley Push down'
                            ),
                          ),
//                          Text(
//                            //'m/c Seated Chest \nPress'
//                              'Lat Pull down         '
//                          ),

                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_two,

                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_two,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_two,
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Kickback'
                            ),
                          ),
//                          Text(
//                              'Chin/pull Ups         '
//                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_three,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_three,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_three,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Tricep Dip'
                            ),
                          ),

                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_four,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_four,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_four,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Skull crushers'
                            ),
                          ),


                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_five,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_five,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_five,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(

                        child:Text('BICEPS',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Bicep Curls'
                            ),
                          ),
//                          Text(
//                              'pulley Rows\n(high/low)               '
//                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_six,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_six,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_six,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Rev Grip Pulley Curl'
                            ),
                          ),

                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_seven,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Hammer Curl'
                            ),
                          ),

                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_seven,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Preacher curl'
                            ),
                          ),

                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_seven,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: scaler.getWidth(wid),
                            child: Text(
                                'Concentration curls'
                            ),
                          ),

                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: set_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rep_seven,
                          ),
                          MakeInput(
                            label: '',
                            obscureText: false,
                            controllerID: rest_seven,
                          ),
                        ],
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Days(text: widget.text,),
                              ),
                            ),
                            ref
                                .child('Exercise')
                                .child(widget.text)
                                .child('Back')
                                .set(
                              {
                                'Sets_one': set_one.text,
                                'Sets_two': set_two.text,
                                'Sets_three': set_three.text,
                                'Sets_four': set_four.text,
                                'Sets_five': set_five.text,
                                'Sets_six': set_six.text,
                                'Sets_seven': set_seven.text,
                                'Sets_eight': set_eight.text,
                                'Rep_one': rep_one.text,
                                'Rep_two': rep_two.text,
                                'Rep_three': rep_three.text,
                                'Rep_four': rep_four.text,
                                'Rep_five': rep_five.text,
                                'Rep_six': rep_six.text,
                                'Rep_seven': rep_seven.text,
                                'Rep_eight': rep_eight.text,
                                'Rest_one': rest_one.text,

                              },
                            ).asStream(),
                            set_one.clear(),
                            set_two.clear(),
                            set_three.clear(),
                            set_four.clear(),
                            set_five.clear(),
                            set_six.clear(),
                            set_seven.clear(),
                            reps.clear(),
                            rest.clear(),
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Confirm Details',
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
    );
  }
}
