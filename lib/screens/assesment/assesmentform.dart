import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fms/PT/select_PT.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/exercise_card/Add_exercise.dart';
import 'package:fms/screens/members/w.dart';

void main() {
  runApp(MaterialApp( home: Assesment(),));
}

class Assesment extends StatefulWidget {
  @override
  _AssesmentState createState() => _AssesmentState();
}

class _AssesmentState extends State<Assesment> {
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body:  SingleChildScrollView(
          child: Column(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Text(
          'Flexibility Assesments',
          style: Theme.of(context).textTheme.display1.copyWith(
            color: Palette.secondaryColor,
            fontSize: ScreenUtil(allowFontScaling: true).setSp(70),
          ),
        ),
        SizedBox(
          height: 15,
        ),
         Card(
            color: Palette.secondaryColor,
            child: SizedBox(
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('Thomas Test',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),),
              ),
            )),
        Padding(

          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Left hip  :         ',style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold),),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//            checkColor: Colors.greenAccent,
//            activeColor: Colors.white,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Right hip:         ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold), ),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//                  checkColor: Colors.greenAccent,
//                  activeColor: Colors.red,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Divider(color:Colors.black,),


        Card(
            color: Palette.secondaryColor,
            child: SizedBox(
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('Thomas Test',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),),
              ),
            )),
        Padding(

          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Left hip  :         ',style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold),),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//            checkColor: Colors.greenAccent,
//            activeColor: Colors.white,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Right hip:         ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold), ),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//                  checkColor: Colors.greenAccent,
//                  activeColor: Colors.red,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Divider(color:Colors.black,),


        Card(


            color: Palette.secondaryColor,
            child: SizedBox(
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('Thomas Test',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),),
              ),
            )),
        Padding(

          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Left hip  :         ',style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold),),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//            checkColor: Colors.greenAccent,
//            activeColor: Colors.white,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Right hip:         ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold), ),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//                  checkColor: Colors.greenAccent,
//                  activeColor: Colors.red,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Divider(color:Colors.black,),


        Card(


            color: Palette.secondaryColor,
            child: SizedBox(
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text('Thomas Test',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),),
              ),
            )),
        Padding(

          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Left hip  :         ',style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold),),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//            checkColor: Colors.greenAccent,
//            activeColor: Colors.white,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: <Widget>[

              Text('Right hip:         ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold), ),

              Text('Normal: ',style: TextStyle(fontSize: 16.0), ),
              Checkbox(
//                  checkColor: Colors.greenAccent,
//                  activeColor: Colors.red,
                value: this.valuefirst,
                onChanged: (bool value) {
                  setState(() {
                    this.valuefirst = value;
                  });
                },
              ),

              Text('Tight: ',style: TextStyle(fontSize: 17.0), ),
              Checkbox(
                value: this.valuesecond,
                onChanged: (bool value) {
                  setState(() {
                    this.valuesecond = value;
                  });
                },
              ),


            ],
          ),
        ),
        Divider(color:Colors.black,),

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
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => www(),
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
                    //backgroundColor: Colors.orange,
                    fontSize: 15,
                    fontFamily: 'Varela Round',
                    //fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),),








      ],



    ),
        ),
    ));
  }
}