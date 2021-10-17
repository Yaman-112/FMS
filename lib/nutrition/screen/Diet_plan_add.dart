import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/assesment/PT_GT_SELECT.dart';
import 'package:fms/screens/assesment/assesment_form_one_two_combined.dart';
import 'package:fms/screens/assesment/assesment_forms_screen.dart';
import 'package:fms/screens/assesment/generate_feedback_program.dart';

class Diet_plan extends StatefulWidget {
  final String text;
  const Diet_plan({Key key, @required this.text}) : super(key: key);
//  final String text;
//  const Table_assesment_two({Key key, @required this.text}) : super(key: key);
  // This widget is the root of your application.
  @override
  State<Diet_plan> createState() => _Diet_planState();
}

class _Diet_planState extends State<Diet_plan> {

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






  @override
  Widget build(BuildContext context) {

    final ref = referenceDatabase.reference();
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.black54,
        // appBar: AppBar(),
        body: Center(
          child: Container(
            color: Colors.white,
            //height: 500,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [

                    Text('Food Plan Suggestion - Phase 2&3 Hypothesis & Healing',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    DataTable(


                      headingRowColor:
                      MaterialStateColor.resolveWith((states) => Palette.primaryColor),


                      columns: <DataColumn>[

                        DataColumn(
                          label: Text(''),
                        ),

                        DataColumn(
                          label: Text('Monday'),
                        ),
                        DataColumn(
                          label: Text('Tuesday'),
                        ),
                        DataColumn(
                          label: Text('Wednesday'),
                        ),
                        DataColumn(
                          label: Text('Thrusday'),
                        ),
                        DataColumn(
                          label: Text('Friday'),
                        ),
                        DataColumn(
                          label: Text('Saturday'),
                        ),
                        DataColumn(
                          label: Text('Sunday'),
                        ),

                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Meal 1')),
                            DataCell(TextField(controller: rep_one ,)),
                            DataCell(TextField(controller: set_one,)),

                            DataCell(TextField(controller: rep_one ,)),
                            DataCell(TextField(controller: set_one,)),

                            DataCell(TextField(controller: rep_one ,)),
                            DataCell(TextField(controller: set_one,)),

                            DataCell(TextField(controller: rep_one ,)),


                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Meal 2')),

                            DataCell(TextField(controller: rep_two ,)),
                            DataCell(TextField(controller: set_two,)),
                            DataCell(TextField(controller: rep_two ,)),
                            DataCell(TextField(controller: set_two,)),
                            DataCell(TextField(controller: rep_two ,)),
                            DataCell(TextField(controller: set_two,)),
                            DataCell(TextField(controller: rep_two ,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Meal 3')),

                            DataCell(TextField(controller: rep_three ,)),
                            DataCell(TextField(controller: set_three,)),
                            DataCell(TextField(controller: rep_three ,)),
                            DataCell(TextField(controller: set_three,)),
                            DataCell(TextField(controller: rep_three ,)),
                            DataCell(TextField(controller: rep_three ,)),
                            DataCell(TextField(controller: set_three,)),

                          ],
                        ),






                      ],
                    ),
                    SizedBox(
                      height: 50,
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
                              builder: (context) => Table_assesment_two(text: widget.text,),
                            ),
                          ),
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => Days(text: widget.text,),
//                              ),
//                            ),
                          ref
                              .child('Assesment')
                              .child(widget.text)
                              .child('bent_lift')
                              .set(
                            {
                              'Remark_one': set_one.text,
                              'Remark_two': set_two.text,
                              'Remark_three': set_three.text,
                              'Remark_four': set_four.text,
                              'Remark_five': set_five.text,
                              'Remark_six': set_six.text,
                              'Remark_seven': set_seven.text,
                              'Remark_eight': set_eight.text,

                              'Result_one': rep_one.text,
                              'Result_two': rep_two.text,
                              'Result_three': rep_three.text,
                              'Result_four': rep_four.text,
                              'Result_five': rep_five.text,
                              'Result_six': rep_six.text,
                              'Result_seven': rep_seven.text,
                              'Result_eight': rep_eight.text,

                            },
                          ).asStream(),
                          set_one.clear(),
                          set_two.clear(),
                          set_three.clear(),
                          set_four.clear(),
                          set_five.clear(),
                          set_six.clear(),
                          set_seven.clear(),

                          set_eight.clear(),
                          rep_one.clear(),
                          rep_two.clear(),
                          rep_three.clear(),
                          rep_four.clear(),
                          rep_five.clear(),
                          rep_six.clear(),
                          rep_seven.clear(),
                          rep_eight.clear(),

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
        ),
      ),
    );
  }
}
