import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Table_assesment_two extends StatefulWidget {

  final String text;
  const Table_assesment_two({Key key, @required this.text}) : super(key: key);
  // This widget is the root of your application.
  @override
  State<Table_assesment_two> createState() => _Table_assesment_twoState();
}

class _Table_assesment_twoState extends State<Table_assesment_two> {

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  String retrievedData_one ='';
  String Result_one ='';
  String Result_two ='';
  String Result_three ='';
  String Result_four ='';
  String Result_five ='';
  String Result_six ='';
  String Result_seven ='';
  String Result_eight ='';

  String Remark_one ='';
  String Remark_two ='';
  String Remark_three ='';
  String Remark_four ='';
  String Remark_five ='';
  String Remark_six ='';
  String Remark_seven ='';
  String Remark_eight ='';


  String Pre_one ='';
  String Pre_two ='';


  DatabaseReference _detailRef;
  DatabaseReference _numref;





  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();

    _detailRef = database
        .reference()
        .child('Assesment')
        .child(widget.text)
        .child('bent_lift');

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    _detailRef.once().then((DataSnapshot snapshot){
      setState(() {
        Result_one = snapshot.value['Result_one'].toString();
        Result_two = snapshot.value['Result_two'].toString();
        Result_three = snapshot.value['Result_three'].toString();
        Result_four = snapshot.value['Result_four'].toString();
        Result_five = snapshot.value['Result_five'].toString();
        Result_six = snapshot.value['Result_six'].toString();
        Result_seven = snapshot.value['Result_seven'].toString();
        Result_eight = snapshot.value['Result_eight'].toString();

        Remark_one = snapshot.value['Remark_one'].toString();
        Remark_two = snapshot.value['Remark_two'].toString();
        Remark_three = snapshot.value['Remark_three'].toString();
        Remark_four = snapshot.value['Remark_four'].toString();
        Remark_five = snapshot.value['Remark_five'].toString();
        Remark_six = snapshot.value['Remark_six'].toString();
        Remark_seven = snapshot.value['Remark_seven'].toString();
        Remark_eight = snapshot.value['Remark_eight'].toString();


        Pre_one = snapshot.value['Pre_one'].toString();
        Remark_one = snapshot.value['Remark_one'].toString();
        Result_two = snapshot.value['Result_two'].toString();

        Pre_two = snapshot.value['Pre_two'].toString();

        Remark_two = snapshot.value['Remark_two'].toString();

//        print('Data_two : ${retrievedData}');

      });
    });
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
                            DataCell(Text('${Result_one}')),
                            DataCell(Text('${Remark_one}')),


                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Anterior')),
                            DataCell(Text('Knee')),
                            DataCell(Text('Move Inward')),
                            DataCell(Text('${Result_two}')),
                            DataCell(Text('${Remark_two}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Anterior')),
                            DataCell(Text('Torso')),
                            DataCell(Text('Lateral Shift')),
                            DataCell(Text('${Result_three}')),
                            DataCell(Text('${Remark_three}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Feet')),
                            DataCell(Text('Heal Lifted')),
                            DataCell(Text('${Result_four}')),
                            DataCell(Text('${Remark_four}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Hip & knee')),
                            DataCell(Text('Dominance')),
                            DataCell(Text('${Result_five}')),
                            DataCell(Text('${Remark_five}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Tibia & Torso')),
                            DataCell(Text('Unable to achieve || Position')),
                            DataCell(Text('${Result_six}')),
                            DataCell(Text('${Remark_six}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Contacts beind knee')),
                            DataCell(Text('Hamsteing touch calves')),
                            DataCell(Text('${Result_seven}')),
                            DataCell(Text('${Remark_seven}')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Sagittal')),
                            DataCell(Text('Lumbar & Thoracic \n Spine')),
                            DataCell(Text('Back excessively arches \n '

                                'Back Rounds Foward')),
                            DataCell(Text('${Result_eight}')),
                            DataCell(Text('${Remark_eight}')),

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
