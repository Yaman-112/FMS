//Custom Card For Members

import 'package:flutter/material.dart';
import 'package:fms/PT/select_PT.dart';
import 'package:fms/screens/assesment/Assesment_screen_one.dart';
import 'package:fms/screens/assesment/assesment_forms_screen.dart';
import 'package:fms/screens/assesment/assesmentform.dart';
import 'package:fms/screens/exercise_card/Add_exercise.dart';
import'package:fms/config/palette.dart';

class CustomCardM extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String regdate;
  final String paydate;
  final String assesment;
  final String fee;
  final String imagePath;
  final Function func1;
  final Function func2;
  final Function func3;
  final Function func4;
  final Function func5;

  final Function func6;

  CustomCardM(
      {this.name,
      this.phoneNumber,
      this.regdate,
      this.paydate,
      this.fee,
      this.imagePath, this.assesment,
      this.func1,
      this.func2,
      this.func3,
      this.func4, this.func5,this.func6});
  @override
  _CustomCardMState createState() => _CustomCardMState();
}

class _CustomCardMState extends State<CustomCardM> {
  DateTime date;
  Color timeColor;
  @override
  Widget build(BuildContext context) {
    date = DateTime.parse(widget.paydate);
    if (date.isBefore(DateTime.now())) {
      timeColor = Colors.red;
    } else {
      timeColor = Colors.black;
    }
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
//              Flexible(
//                child: Image.asset(
//                  widget.imagePath,
//                  width: 64.0,
//                ),
//              ),
                Column(
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      widget.phoneNumber,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                    ),
                    Text(
                      'Pay Date: ${widget.paydate}',
                      style: TextStyle(
                          color: timeColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                    ),
                    Text(
                      'Fee: Rs. ${widget.fee}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              Flexible(
                child: Column(

                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Palette.secondaryColor,
                      ),
                      tooltip: 'Generate Card',
                      //                    onPressed: widget.func1,
                      onPressed: widget.func5,
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => Exercise_AS(text: widget.phoneNumber),
//                          ),
//                        ),

                    ),
                    Text(
                      'Gen Card',
                      style: TextStyle(

                        color: Palette.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              ],
            ),
            //Divider(color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Palette.secondaryColor,
                        ),
                        tooltip: 'Call Member',
                        onPressed: widget.func1,
                      ),
                      Text(
                        'Call',
                        style: TextStyle(

                          color: Palette.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.message,

                          color: Palette.secondaryColor,
                        ),
                        tooltip: 'Message Member',
                        onPressed: widget.func2,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(

                          color: Palette.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.money,

                          color: Palette.secondaryColor,
                        ),
                        tooltip: 'Renew Fees',
                        //onPressed: widget.func3,
                        onPressed: () =>
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Table_assesment(text: widget.phoneNumber),
                            ),
                          ),
                        }
                      ),
                      Text(
                        'Renew',
                        style: TextStyle(

                          color: Palette.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        tooltip: 'Delete Member',
                        onPressed: widget.func4,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                            Icons.folder,
                          color: Palette.secondaryColor,
                        ),
                        tooltip: 'Assesment',
                     // onPressed:  widget.func5,
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Assesment_form_screen(text: widget.phoneNumber),
                            ),
                          ),
                        },
                      ),
                      Text(
                        'Assesment',
                        style: TextStyle(

                          color: Palette.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
