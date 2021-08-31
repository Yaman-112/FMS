//Custom Card For Members

import 'package:flutter/material.dart';
import 'package:fms/PT/select_PT.dart';
import 'package:fms/screens/assesment/assesmentform.dart';
import 'package:fms/screens/exercise_card/Add_exercise.dart';
import'package:fms/config/palette.dart';

class CustomCardM extends StatefulWidget {
  final String name;
//  final String phoneNumber;
//  final String regdate;
//  final String paydate;
//  final String fee;


  CustomCardM(
      {this.name,
//        this.phoneNumber,
//        this.regdate,
//        this.paydate,
//        this.fee,

      });
  @override
  _CustomCardMState createState() => _CustomCardMState();
}

class _CustomCardMState extends State<CustomCardM> {
  DateTime date;
  Color timeColor;
  @override
  Widget build(BuildContext context) {
    //date = DateTime.parse(widget.paydate);
//    if (date.isBefore(DateTime.now())) {
//      timeColor = Colors.red;
//    } else {
//      timeColor = Colors.black;
//    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,

        margin: EdgeInsets.all(9.0),
        color: Colors.white,

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
//                    Text(
//                      widget.phoneNumber,
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.w400,
//                          fontSize: 15.0),
//                    ),
//                    Text(
//                      'Pay Date: ${widget.paydate}',
//                      style: TextStyle(
//                          color: timeColor,
//                          fontWeight: FontWeight.w400,
//                          fontSize: 15.0),
//                    ),
//                    Text(
//                      'Fee: Rs. ${widget.fee}',
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.w400,
//                          fontSize: 15.0),
//                    ),
                  ],
                ),

              ],
            ),
            //Divider(color: Colors.black),

          ],
        ),
      ),
    );
  }
}
