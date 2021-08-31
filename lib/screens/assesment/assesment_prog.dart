import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/config/palette.dart';

class assesment_prog extends StatefulWidget {
  @override
  State<assesment_prog> createState() => _assesment_progState();
}

class _assesment_progState extends State<assesment_prog> {
  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController A1 = TextEditingController();
  final TextEditingController A2 = TextEditingController();
  final TextEditingController A3 = TextEditingController();
  final TextEditingController A4 = TextEditingController();
  final TextEditingController A5 = TextEditingController();
  final TextEditingController A6 = TextEditingController();
  final TextEditingController A7 = TextEditingController();
  final TextEditingController A8 = TextEditingController();
  final TextEditingController A9 = TextEditingController();
  final TextEditingController A10 = TextEditingController();
  final TextEditingController A11 = TextEditingController();
  final TextEditingController A12 = TextEditingController();
  final TextEditingController B1 = TextEditingController();
  final TextEditingController B2 = TextEditingController();
  final TextEditingController B3 = TextEditingController();
  final TextEditingController B4 = TextEditingController();
  final TextEditingController B5 = TextEditingController();
  final TextEditingController B6 = TextEditingController();
  final TextEditingController B7 = TextEditingController();
  final TextEditingController B8 = TextEditingController();
  final TextEditingController B9 = TextEditingController();
  final TextEditingController B10 = TextEditingController();
  final TextEditingController B11 = TextEditingController();
  final TextEditingController B12 = TextEditingController();
  final TextEditingController C1 = TextEditingController();
  final TextEditingController C2 = TextEditingController();
  final TextEditingController C3 = TextEditingController();
  final TextEditingController C4 = TextEditingController();
  final TextEditingController C5 = TextEditingController();
  final TextEditingController C6 = TextEditingController();
  final TextEditingController C7 = TextEditingController();
  final TextEditingController C8 = TextEditingController();
  final TextEditingController C9 = TextEditingController();
  final TextEditingController C10 = TextEditingController();
  final TextEditingController C11 = TextEditingController();
  final TextEditingController C12 = TextEditingController();
  final TextEditingController D1 = TextEditingController();
  final TextEditingController D2 = TextEditingController();
  final TextEditingController D3 = TextEditingController();
  final TextEditingController D4 = TextEditingController();
  final TextEditingController D5 = TextEditingController();
  final TextEditingController D6 = TextEditingController();
  final TextEditingController D7 = TextEditingController();
  final TextEditingController D8 = TextEditingController();
  final TextEditingController D9 = TextEditingController();
  final TextEditingController D10 = TextEditingController();
  final TextEditingController D11 = TextEditingController();
  final TextEditingController D12 = TextEditingController();
  final TextEditingController E1 = TextEditingController();
  final TextEditingController E2 = TextEditingController();
  final TextEditingController E3 = TextEditingController();
  final TextEditingController E4 = TextEditingController();
  final TextEditingController E5 = TextEditingController();
  final TextEditingController E6 = TextEditingController();
  final TextEditingController E7 = TextEditingController();
  final TextEditingController E8 = TextEditingController();
  final TextEditingController E9 = TextEditingController();
  final TextEditingController E10 = TextEditingController();
  final TextEditingController E11 = TextEditingController();
  final TextEditingController E12 = TextEditingController();

  final TextEditingController F1 = TextEditingController();
  final TextEditingController F2 = TextEditingController();
  final TextEditingController F3 = TextEditingController();
  final TextEditingController F4 = TextEditingController();
  final TextEditingController F5 = TextEditingController();
  final TextEditingController F6 = TextEditingController();
  final TextEditingController F7 = TextEditingController();
  final TextEditingController F8 = TextEditingController();
  final TextEditingController F9 = TextEditingController();
  final TextEditingController F10 = TextEditingController();
  final TextEditingController F11 = TextEditingController();
  final TextEditingController F12 = TextEditingController();

  final TextEditingController G1 = TextEditingController();
  final TextEditingController G2 = TextEditingController();
  final TextEditingController G3 = TextEditingController();
  final TextEditingController G4 = TextEditingController();
  final TextEditingController G5 = TextEditingController();
  final TextEditingController G6 = TextEditingController();
  final TextEditingController G7 = TextEditingController();
  final TextEditingController G8 = TextEditingController();
  final TextEditingController G9 = TextEditingController();
  final TextEditingController G10 = TextEditingController();
  final TextEditingController G11 = TextEditingController();
  final TextEditingController G12 = TextEditingController();

  final TextEditingController H1 = TextEditingController();
  final TextEditingController H2 = TextEditingController();
  final TextEditingController H3 = TextEditingController();
  final TextEditingController H4 = TextEditingController();
  final TextEditingController H5 = TextEditingController();
  final TextEditingController H6 = TextEditingController();
  final TextEditingController H7 = TextEditingController();
  final TextEditingController H8 = TextEditingController();
  final TextEditingController H9 = TextEditingController();
  final TextEditingController H10 = TextEditingController();
  final TextEditingController H11 = TextEditingController();
  final TextEditingController H12 = TextEditingController();

  final TextEditingController I1 = TextEditingController();
  final TextEditingController I2 = TextEditingController();
  final TextEditingController I3 = TextEditingController();
  final TextEditingController I4 = TextEditingController();
  final TextEditingController I5 = TextEditingController();
  final TextEditingController I6 = TextEditingController();
  final TextEditingController I7 = TextEditingController();
  final TextEditingController I8 = TextEditingController();
  final TextEditingController I9 = TextEditingController();
  final TextEditingController I10 = TextEditingController();
  final TextEditingController I11 = TextEditingController();
  final TextEditingController I12 = TextEditingController();

  final TextEditingController J1 = TextEditingController();
  final TextEditingController J2 = TextEditingController();
  final TextEditingController J3 = TextEditingController();
  final TextEditingController J4 = TextEditingController();
  final TextEditingController J5 = TextEditingController();
  final TextEditingController J6 = TextEditingController();
  final TextEditingController J7 = TextEditingController();
  final TextEditingController J8 = TextEditingController();
  final TextEditingController J9 = TextEditingController();
  final TextEditingController J10 = TextEditingController();
  final TextEditingController J11 = TextEditingController();
  final TextEditingController J12 = TextEditingController();

  final TextEditingController K1 = TextEditingController();
  final TextEditingController K2 = TextEditingController();
  final TextEditingController K3 = TextEditingController();
  final TextEditingController K4 = TextEditingController();
  final TextEditingController K5 = TextEditingController();
  final TextEditingController K6 = TextEditingController();
  final TextEditingController K7 = TextEditingController();
  final TextEditingController K8 = TextEditingController();
  final TextEditingController K9 = TextEditingController();
  final TextEditingController K10 = TextEditingController();
  final TextEditingController K11 = TextEditingController();
  final TextEditingController K12 = TextEditingController();

  final TextEditingController L1 = TextEditingController();
  final TextEditingController L2 = TextEditingController();
  final TextEditingController L3 = TextEditingController();
  final TextEditingController L4 = TextEditingController();
  final TextEditingController L5 = TextEditingController();
  final TextEditingController L6 = TextEditingController();
  final TextEditingController L7 = TextEditingController();
  final TextEditingController L8 = TextEditingController();
  final TextEditingController L9 = TextEditingController();
  final TextEditingController L10 = TextEditingController();
  final TextEditingController L11 = TextEditingController();
  final TextEditingController L12 = TextEditingController();
  final TextEditingController Ex1 = TextEditingController();
  final TextEditingController Ex2 = TextEditingController();
  final TextEditingController Ex3 = TextEditingController();
  final TextEditingController Ex4 = TextEditingController();
  final TextEditingController Ex5 = TextEditingController();
  final TextEditingController Ex6 = TextEditingController();
  final TextEditingController Ex7 = TextEditingController();
  final TextEditingController Ex8 = TextEditingController();
  final TextEditingController Ex9 = TextEditingController();
  final TextEditingController Ex10 = TextEditingController();
  final TextEditingController Ex11 = TextEditingController();
  final TextEditingController Ex12 = TextEditingController();

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

  String _chosenValue;

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
            //height: 130,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
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
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor:Colors.black,
                        items: <String>[
                          'DAY_1',
                          'DAY_2',
                          'DAY_3',
                          'DAY_4',
                          'DAY_5',
                          'DAY_6',
                          'DAY_7',
                          'DAY_8',
                          'DAY_9',
                          'DAY_10',
                          'DAY_11',
                          'DAY_12',



                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style:TextStyle(color:Colors.black),),
                          );
                        }).toList(),
                        hint:Text(
                          "DAY",
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
                    DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('Exercise Name'),
                        ),
                        DataColumn(
                          label: Text('Sets'),
                        ),
                        DataColumn(
                          label: Text('Reps'),
                        ),
                        DataColumn(
                          label: Text('Weight'),
                        ),
                        DataColumn(
                          label: Text('Sets'),
                        ),
                        DataColumn(
                          label: Text('Reps'),
                        ),
                        DataColumn(
                          label: Text('Weight'),
                        ),
                        DataColumn(
                          label: Text('Sets'),
                        ),
                        DataColumn(
                          label: Text('Reps'),
                        ),
                        DataColumn(
                          label: Text('Weight'),
                        ),
                        DataColumn(
                          label: Text('Sets'),
                        ),
                        DataColumn(
                          label: Text('Reps'),
                        ),
                        DataColumn(
                          label: Text('Weight'),
                        ),

                      ],
                      rows: <DataRow>[


                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex1,)),
                            DataCell(TextField(controller: A1,)),
                            DataCell(TextField(controller: B1,)),
                            DataCell(TextField(controller: C1,)),
                            DataCell(TextField(controller: D1,)),
                            DataCell(TextField(controller: E1,)),
                            DataCell(TextField(controller: F1,)),
                            DataCell(TextField(controller: G1,)),
                            DataCell(TextField(controller: H1,)),
                            DataCell(TextField(controller: I1,)),
                            DataCell(TextField(controller: J1,)),
                            DataCell(TextField(controller: K1,)),
                            DataCell(TextField(controller: L1,)),

                          ],
                        ),

                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex2,)),
                            DataCell(TextField(controller: A2,)),
                            DataCell(TextField(controller: B2,)),
                            DataCell(TextField(controller: C2,)),
                            DataCell(TextField(controller: D2,)),
                            DataCell(TextField(controller: E2,)),
                            DataCell(TextField(controller: F2,)),
                            DataCell(TextField(controller: G2,)),
                            DataCell(TextField(controller: H2,)),
                            DataCell(TextField(controller: I2,)),
                            DataCell(TextField(controller: J2,)),
                            DataCell(TextField(controller: K2,)),
                            DataCell(TextField(controller: L2,)),

                          ],
                        ),


                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex3,)),
                            DataCell(TextField(controller: A3,)),
                            DataCell(TextField(controller: B3,)),
                            DataCell(TextField(controller: C3,)),
                            DataCell(TextField(controller: D3,)),
                            DataCell(TextField(controller: E3,)),
                            DataCell(TextField(controller: F3,)),
                            DataCell(TextField(controller: G3,)),
                            DataCell(TextField(controller: H3,)),
                            DataCell(TextField(controller: I3,)),
                            DataCell(TextField(controller: J3,)),
                            DataCell(TextField(controller: K3,)),
                            DataCell(TextField(controller: L3,)),

                          ],
                        ),

                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex4,)),
                            DataCell(TextField(controller: A4,)),
                            DataCell(TextField(controller: B4,)),
                            DataCell(TextField(controller: C4,)),
                            DataCell(TextField(controller: D4,)),
                            DataCell(TextField(controller: E4,)),
                            DataCell(TextField(controller: F4,)),
                            DataCell(TextField(controller: G4,)),
                            DataCell(TextField(controller: H4,)),
                            DataCell(TextField(controller: I4,)),
                            DataCell(TextField(controller: J4,)),
                            DataCell(TextField(controller: K4,)),
                            DataCell(TextField(controller: L4,)),

                          ],
                        ),

                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex5,)),
                            DataCell(TextField(controller: A5,)),
                            DataCell(TextField(controller: B5,)),
                            DataCell(TextField(controller: C5,)),
                            DataCell(TextField(controller: D5,)),
                            DataCell(TextField(controller: E5,)),
                            DataCell(TextField(controller: F5,)),
                            DataCell(TextField(controller: G5,)),
                            DataCell(TextField(controller: H5,)),
                            DataCell(TextField(controller: I5,)),
                            DataCell(TextField(controller: J5,)),
                            DataCell(TextField(controller: K5,)),
                            DataCell(TextField(controller: L5,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex6,)),
                            DataCell(TextField(controller: A6,)),
                            DataCell(TextField(controller: B6,)),
                            DataCell(TextField(controller: C6,)),
                            DataCell(TextField(controller: D6,)),
                            DataCell(TextField(controller: E6,)),
                            DataCell(TextField(controller: F6,)),
                            DataCell(TextField(controller: G6,)),
                            DataCell(TextField(controller: H6,)),
                            DataCell(TextField(controller: I6,)),
                            DataCell(TextField(controller: J6,)),
                            DataCell(TextField(controller: K6,)),
                            DataCell(TextField(controller: L6,)),

                          ],
                        ),

                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex7,)),
                            DataCell(TextField(controller: A7,)),
                            DataCell(TextField(controller: B7,)),
                            DataCell(TextField(controller: C7,)),
                            DataCell(TextField(controller: D7,)),
                            DataCell(TextField(controller: E7,)),
                            DataCell(TextField(controller: F7,)),
                            DataCell(TextField(controller: G7,)),
                            DataCell(TextField(controller: H7,)),
                            DataCell(TextField(controller: I7,)),
                            DataCell(TextField(controller: J7,)),
                            DataCell(TextField(controller: K7,)),
                            DataCell(TextField(controller: L7,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex8,)),
                            DataCell(TextField(controller: A8,)),
                            DataCell(TextField(controller: B8,)),
                            DataCell(TextField(controller: C8,)),
                            DataCell(TextField(controller: D8,)),
                            DataCell(TextField(controller: E8,)),
                            DataCell(TextField(controller: F8,)),
                            DataCell(TextField(controller: G8,)),
                            DataCell(TextField(controller: H8,)),
                            DataCell(TextField(controller: I8,)),
                            DataCell(TextField(controller: J8,)),
                            DataCell(TextField(controller: K8,)),
                            DataCell(TextField(controller: L8,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex9,)),
                            DataCell(TextField(controller: A9,)),
                            DataCell(TextField(controller: B9,)),
                            DataCell(TextField(controller: C9,)),
                            DataCell(TextField(controller: D9,)),
                            DataCell(TextField(controller: E9,)),
                            DataCell(TextField(controller: F9,)),
                            DataCell(TextField(controller: G9,)),
                            DataCell(TextField(controller: H9,)),
                            DataCell(TextField(controller: I9,)),
                            DataCell(TextField(controller: J9,)),
                            DataCell(TextField(controller: K9,)),
                            DataCell(TextField(controller: L9,)),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex10,)),
                            DataCell(TextField(controller: A10,)),
                            DataCell(TextField(controller: B10,)),
                            DataCell(TextField(controller: C10,)),
                            DataCell(TextField(controller: D10,)),
                            DataCell(TextField(controller: E10,)),
                            DataCell(TextField(controller: F10,)),
                            DataCell(TextField(controller: G10,)),
                            DataCell(TextField(controller: H10,)),
                            DataCell(TextField(controller: I10,)),
                            DataCell(TextField(controller: J10,)),
                            DataCell(TextField(controller: K10,)),
                            DataCell(TextField(controller: L10,)),

                          ],
                        ),

                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex11,)),
                            DataCell(TextField(controller: A11,)),
                            DataCell(TextField(controller: B11,)),
                            DataCell(TextField(controller: C11,)),
                            DataCell(TextField(controller: D11,)),
                            DataCell(TextField(controller: E11,)),
                            DataCell(TextField(controller: F11,)),
                            DataCell(TextField(controller: G11,)),
                            DataCell(TextField(controller: H11,)),
                            DataCell(TextField(controller: I11,)),
                            DataCell(TextField(controller: J11,)),
                            DataCell(TextField(controller: K11,)),
                            DataCell(TextField(controller: L11,)),

                          ],
                        ),


                        DataRow(
                          cells: <DataCell>[
                            DataCell(TextField(controller: Ex12,)),
                            DataCell(TextField(controller: A12,)),
                            DataCell(TextField(controller: B12,)),
                            DataCell(TextField(controller: C12,)),
                            DataCell(TextField(controller: D12,)),
                            DataCell(TextField(controller: E12,)),
                            DataCell(TextField(controller: F12,)),
                            DataCell(TextField(controller: G12,)),
                            DataCell(TextField(controller: H12,)),
                            DataCell(TextField(controller: I12,)),
                            DataCell(TextField(controller: J12,)),
                            DataCell(TextField(controller: K12,)),
                            DataCell(TextField(controller: L12,)),

                          ],
                        ),
                      ],
                    ),
SizedBox(
  height: 20,
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
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => Days(text: widget.text,),
//                              ),
//                            ),
                          ref
                              .child('Assesment_prog')
                              .child('999999')
                              .child(_chosenValue)
                              .set(
                            {
                             'Ex1': Ex1.text,
                             'A1':A1.text,
                             'B1':B1.text,
                             'C1':C1.text,
                             'D1':D1.text,
                              'E1':E1.text,
                              'F1':F1.text,
                              'G1':G1.text,
                              'H1':H1.text,
                              'I1':I1.text,
                              'J1':J1.text,
                              'K1':K1.text,
                              'L1':L1.text,

                              'Ex2': Ex2.text,
                              'A2':A2.text,
                              'B2':B2.text,
                              'C2':C2.text,
                              'D2':D2.text,
                              'E2':E2.text,
                              'F2':F2.text,
                              'G2':G2.text,
                              'H2':H2.text,
                              'I2':I2.text,
                              'J2':J2.text,
                              'K2':K2.text,
                              'L2':L2.text,

                              'Ex4': Ex5.text,
                              'A4':A5.text,
                              'B4':B5.text,
                              'C4':C5.text,
                              'D4':D5.text,
                              'E4':E5.text,
                              'F4':F5.text,
                              'G4':G5.text,
                              'H4':H5.text,
                              'I4':I5.text,
                              'J4':J5.text,
                              'K4':K5.text,
                              'L4':L5.text,

                              'Ex6': Ex6.text,
                              'A6':A6.text,
                              'B6':B6.text,
                              'C6':C6.text,
                              'D6':D6.text,
                              'E6':E6.text,
                              'F6':F6.text,
                              'G6':G6.text,
                              'H6':H6.text,
                              'I6':I6.text,
                              'J6':J6.text,
                              'K6':K6.text,
                              'L6':L6.text,

                              'Ex7': Ex7.text,
                              'A7':A7.text,
                              'B7':B7.text,
                              'C7':C7.text,
                              'D7':D7.text,
                              'E7':E7.text,
                              'F7':F7.text,
                              'G7':G7.text,
                              'H7':H7.text,
                              'I7':I7.text,
                              'J7':J7.text,
                              'K7':K7.text,
                              'L7':L7.text,

                              'Ex8': Ex8.text,
                              'A8':A8.text,
                              'B8':B8.text,
                              'C8':C8.text,
                              'D8':D8.text,
                              'E8':E8.text,
                              'F8':F8.text,
                              'G8':G8.text,
                              'H8':H8.text,
                              'I8':I8.text,
                              'J8':J8.text,
                              'K8':K8.text,
                              'L8':L8.text,

                              'Ex9': Ex9.text,
                              'A9':A9.text,
                              'B9':B9.text,
                              'C9':C9.text,
                              'D9':D9.text,
                              'E9':E9.text,
                              'F9':F9.text,
                              'G9':G9.text,
                              'H9':H9.text,
                              'I9':I9.text,
                              'J9':J9.text,
                              'K9':K9.text,
                              'L9':L9.text,


                              'Ex10': Ex10.text,
                              'A10':A10.text,
                              'B10':B10.text,
                              'C10':C10.text,
                              'D10':D10.text,
                              'E10':E10.text,
                              'F10':F10.text,
                              'G10':G10.text,
                              'H10':H10.text,
                              'I10':I10.text,
                              'J10':J10.text,
                              'K10':K10.text,
                              'L10':L10.text,

                              'Ex1': Ex11.text,
                              'A1':A11.text,
                              'B1':B11.text,
                              'C1':C11.text,
                              'D1':D11.text,
                              'E1':E11.text,
                              'F1':F11.text,
                              'G1':G11.text,
                              'H1':H11.text,
                              'I1':I11.text,
                              'J1':J11.text,
                              'K1':K11.text,
                              'L1':L11.text,

                              'Ex1': Ex12.text,
                              'A1':A12.text,
                              'B1':B12.text,
                              'C1':C12.text,
                              'D1':D12.text,
                              'E1':E12.text,
                              'F1':F12.text,
                              'G1':G12.text,
                              'H1':H12.text,
                              'I1':I12.text,
                              'J1':J12.text,
                              'K1':K12.text,
                              'L1':L12.text,



                            },
                          ).asStream(),


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
