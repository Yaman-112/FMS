import 'package:flutter/material.dart';
import 'package:fms/screens/exercise_card/Add_exercise.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/config/styles.dart';

class selectPT extends StatefulWidget {
  @override
  _selectPTState createState() => _selectPTState();
}

class _selectPTState extends State<selectPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text(
                'Personal Trainer',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
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
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercise_AS(),
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
                      'Yes',
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

              SizedBox(
                height: 40,
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
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Exercise_AS(),
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
                        'NO',
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
      ),
    );
  }
}
