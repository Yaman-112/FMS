import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/assesment/PT_GT_SELECT.dart';
import 'package:fms/screens/assesment/assesment_forms_screen.dart';
import 'package:fms/screens/assesment/generate_feedback_program.dart';

class Table_assesment_two_input extends StatefulWidget {
  final String text;
  const Table_assesment_two_input({Key key, @required this.text}) : super(key: key);
//  final String text;
//  const Table_assesment_two({Key key, @required this.text}) : super(key: key);
  // This widget is the root of your application.
  @override
  State<Table_assesment_two_input> createState() => _Table_assesment_two_inputState();
}

class _Table_assesment_two_inputState extends State<Table_assesment_two_input> {

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
                    Text('Assesment'),
                    DataTable(


                      headingRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.yellow),


                      columns: <DataColumn>[

                        DataColumn(
                          label: Text('Result'),
                        ),

                        DataColumn(
                          label: Text(' '),
                        ),
                        DataColumn(
                          label: Text('Remarks  '),
                        ),
                        DataColumn(
                          label: Text('Result'),
                        ),
                        DataColumn(
                          label: Text('Remarks'),
                        ),

                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Anterior')),
                            DataCell(Text('Feet')),
                            DataCell(Text('Lack of foot stablity\n(Eversion/Pronation)')),
                            DataCell(TextField(controller: rep_one ,)),
                            DataCell(TextField(controller: set_one,)),


                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Anterior')),
                            DataCell(Text('Knee')),
                            DataCell(Text('Move Inward')),
                            DataCell(TextField(controller: rep_two ,)),
                            DataCell(TextField(controller: set_two,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Anterior')),
                            DataCell(Text('Torso')),
                            DataCell(Text('Lateral Shift')),
                            DataCell(TextField(controller: rep_three ,)),
                            DataCell(TextField(controller: set_three,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Feet')),
                            DataCell(Text('Heal Lifted')),
                            DataCell(TextField(controller: rep_four ,)),
                            DataCell(TextField(controller: set_four,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Hip & knee')),
                            DataCell(Text('Dominance')),
                            DataCell(TextField(controller: rep_five ,)),
                            DataCell(TextField(controller: set_five,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Tibia & Torso')),
                            DataCell(Text('Unable to achieve || Position')),
                            DataCell(TextField(controller: rep_six ,)),
                            DataCell(TextField(controller: set_six,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Contacts beind knee')),
                            DataCell(Text('Hamsteing touch calves')),
                            DataCell(TextField(controller: rep_seven ,)),
                            DataCell(TextField(controller: set_seven,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Lumbar & Thoracic \n Spine')),
                            DataCell(Text('Back excessively arches \n '

                                'Back Rounds Foward')),
                            DataCell(TextField(controller: rep_eight ,)),
                            DataCell(TextField(controller: set_eight,)),

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
                              builder: (context) => Generate_feedback_program(text: widget.text,),
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
