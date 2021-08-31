import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Table_assesment extends StatefulWidget {
  final String text;
  const Table_assesment({Key key, @required this.text}) : super(key: key);
  // This widget is the root of your application.
  @override
  State<Table_assesment> createState() => _Table_assesmentState();
}

class _Table_assesmentState extends State<Table_assesment> {

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  String retrievedData_one ='';

  String Result_one ='';
  String Pre_one ='';
  String Remark_one ='';
  String Result_two ='';
  String Pre_two ='';
  String Remark_two ='';

  String Result_one_ME ='';
  String Pre_one_ME ='';
  String Remark_one_ME ='';
  String Result_two_ME ='';
  String Pre_two_ME ='';
  String Remark_two_ME ='';
  String Result_three_ME ='';
  String Pre_three_ME ='';
  String Remark_three_ME ='';



  String Result_one_MS ='';
  String Pre_one_MS ='';
  String Remark_one_MS ='';
  String Result_two_MS ='';
  String Pre_two_MS ='';
  String Remark_two_MS ='';

  DatabaseReference _detailRef;
  DatabaseReference _MucularEndurance;

  DatabaseReference _MucularStrength;





  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();

    _detailRef = database
        .reference()
        .child('Assesment')
        .child(widget.text)
        .child('CVendurance');
    _MucularEndurance = database
         .reference()
         .child('Assesment')
         .child(widget.text)
         .child('muscularE');

    _MucularStrength = database
        .reference()
        .child('Assesment')
        .child(widget.text)
        .child('muscularS');
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    _detailRef.once().then((DataSnapshot snapshot){
      setState(() {
        Result_one = snapshot.value['Result_one'].toString();

        Pre_one = snapshot.value['Pre_one'].toString();

        Remark_one = snapshot.value['Remark_one'].toString();

        Result_two = snapshot.value['Result_two'].toString();

        Pre_two = snapshot.value['Pre_two'].toString();

        Remark_two = snapshot.value['Remark_two'].toString();

//        print('Data_two : ${retrievedData}');

      });
    });


    _MucularEndurance.once().then((DataSnapshot snapshot){
      setState(() {
        Result_one_ME = snapshot.value['Result_one'].toString();

        Pre_one_ME = snapshot.value['Pre_one'].toString();

        Remark_one_ME = snapshot.value['Remark_one'].toString();

        Result_two_ME = snapshot.value['Result_two'].toString();

        Pre_two_ME = snapshot.value['Pre_two'].toString();

        Remark_two_ME = snapshot.value['Remark_two'].toString();

        Result_three_ME = snapshot.value['Result_three'].toString();

        Pre_three_ME = snapshot.value['Pre_three'].toString();

        Remark_three_ME = snapshot.value['Remark_three'].toString();
//        print('Data_two : ${retrievedData}');


        _MucularStrength.once().then((DataSnapshot snapshot){
          setState(() {
            Result_one_MS = snapshot.value['Result_one'].toString();

            Pre_one_MS = snapshot.value['Pre_one'].toString();

            Remark_one_MS = snapshot.value['Remark_one'].toString();

            Result_two_MS = snapshot.value['Result_two'].toString();

            Pre_two_MS = snapshot.value['Pre_two'].toString();

            Remark_two_MS = snapshot.value['Remark_two'].toString();

//        print('Data_two : ${retrievedData}');

          });
        });
      });
    });

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
                    DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('CV Endurance Test'),
                        ),
                        DataColumn(
                          label: Text('Result'),
                        ),
                        DataColumn(
                          label: Text('Pre & Post HR'),
                        ),
                        DataColumn(
                          label: Text('Remarks'),
                        ),

                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('1. V1 TESTING ')),
                            DataCell(Text('${Result_one}')),
                            DataCell(Text('${Pre_one}')),
                            DataCell(Text('${Remark_one}')),


                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('2. ROCKFORD FITNESS\n     WALKING')),
                            DataCell(Text('${Result_two}')),
                            DataCell(Text('${Pre_two}')),
                            DataCell(Text('${Remark_two}')),

                          ],
                        ),

                      ],
                    ),


                    DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('Muscular Endurance\n Testing'),
                        ),
                        DataColumn(
                          label: Text('Result'),
                        ),
                        DataColumn(
                          label: Text('Pre & Post HR'),
                        ),
                        DataColumn(
                          label: Text('Remarks'),
                        ),

                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('1. PUSH UP')),
                            DataCell(Text('${Result_one_ME}')),
                            DataCell(Text('${Pre_one_ME}')),
                            DataCell(Text('${Remark_one_ME}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('2. CURL UP')),
                            DataCell(Text('${Result_two_ME}')),
                            DataCell(Text('${Pre_two_ME}')),
                            DataCell(Text('${Remark_two_ME}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('3. BODY WIEGHT SQUAT')),
                            DataCell(Text('${Result_three_ME}')),
                            DataCell(Text('${Pre_three_ME}')),
                            DataCell(Text('${Remark_three_ME}')),
                          ],


                        ),
                      ],
                    ),
                    DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('Muscular Strength \n Testing'),
                        ),
                        DataColumn(
                          label: Text('Result'),
                        ),
                        DataColumn(
                          label: Text('Pre & Post HR'),
                        ),
                        DataColumn(
                          label: Text('Remarks'),
                        ),

                      ],
                      rows: <DataRow>[

                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('1. UPPER BODY \n'
                                '(BENCH PRESS)')),
                            DataCell(Text('${Result_one_MS}')),
                            DataCell(Text('${Pre_one_MS}')),
                            DataCell(Text('${Remark_one_MS}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('2. LOWER BODY (SQUAT)')),
                            DataCell(Text('${Result_two_MS}')),
                            DataCell(Text('${Pre_two_MS}')),
                            DataCell(Text('${Remark_two_MS}')),

                          ],


                        ),
                      ],
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
