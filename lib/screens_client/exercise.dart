import 'package:flutter/material.dart';
import 'package:fms/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fms/authentication/authentication_service.dart';
import 'package:fms/constants_client.dart';
import 'package:provider/provider.dart';

class Exercise_All extends StatefulWidget {
  final String number;
  const Exercise_All({Key key, @required this.number}) : super(key: key);

  @override
  State<Exercise_All> createState() => _Exercise_AllState();
}

class _Exercise_AllState extends State<Exercise_All> {
 int a = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout',
      home: DefaultTabController(

        length: a,

        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor:Colors.white,
            toolbarHeight: 15,
            bottom: TabBar(
              labelColor: Palette.thirdColor,
              unselectedLabelColor: Colors.black,


          tabs: [

            Tab(text: 'CHEST'),
            Tab(text: 'BACK'),
            Tab(text: 'SHOULDER'),
            Tab(text: 'LEGS'),
            Tab(text: 'TRI/BICEPS'),

          ],


//              tabs: [
//
//                  Tab(text: 'CHEST'),
//                  Tab(text: 'BACK'),
//                  Tab(text: 'SHOULDER'),
//                  Tab(text: 'LEGS'),
//                  Tab(text: 'TRI/BICEPS'),
//
//              ],
            ),
            title: Text(''),
          ),

          body:
          TabBarView(
            children: [
              Excercise(phone: widget.number,),
              Back(phone: widget.number,),
              Shoulder(),
              Legs(),
              Biceps(),

            ],
          ),

        ),
      ),
    );
  }
}






class Excercise extends StatefulWidget {
    final String phone;
  const Excercise({Key key, @required this.phone}) : super(key: key);
  @override
  State<Excercise> createState() => _ExcerciseState();
}

class _ExcerciseState extends State<Excercise> {
  Color _containerColor = Colors.blue;

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  String retrievedData_one ='';

  String rep_one ='';
  String rep_two ='';
  String rep_three ='';
  String rep_four ='';
  String rep_five ='';
  String rep_six ='';


  DatabaseReference _detailRef;
  DatabaseReference _numref;





  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();



    _detailRef = database
        .reference()
        .child('Exercise')
        .child(widget.phone)
        .child('chest');
    super.initState();

  }


  @override

  Widget build(BuildContext context) {

      _detailRef.once().then((DataSnapshot snapshot){
      setState(() {
        rep_one = snapshot.value['Rep_one'].toString();

        rep_two = snapshot.value['Rep_two'].toString();

        rep_three = snapshot.value['Rep_three'].toString();

        rep_four = snapshot.value['Rep_four'].toString();

        rep_five = snapshot.value['Rep_five'].toString();

        rep_six = snapshot.value['Rep_six'].toString();

        print('Data_two : ${retrievedData}');

      });
    });


    return Scaffold(
      backgroundColor: Colors.grey[50],
//      appBar: AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.grey[50],
////        leading: Icon(
////          Icons.arrow_back,
////          color: Colors.grey,
////
////        ),
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Day 1 : Bi Tri legs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/pushups.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Seated Chest press',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${rep_one} reps, ${retrievedData_one} sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/crunches.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Pec-Dec',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${rep_two} reps, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/planks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Push Ups',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${rep_three} reps, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/climbers.jpg'),
                    radius: 25,
                  ),
                  title: Text('Flat Bench Press',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${rep_four} reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/squats.jpg'),
                    radius: 25,
                  ),
                  title: Text('Incline Bench Press',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${rep_five} reps, 3 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Decline Bench Press',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${rep_six} reps, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}





class Back extends StatefulWidget {
  final String phone;
  const Back({Key key, @required this.phone}) : super(key: key);
  @override
  State<Back> createState() => _BackState();
}

class _BackState extends State<Back> {
  Color _containerColor = Colors.blue;

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  String rep_one ='';
  String rep_two ='';
  String rep_three ='';
  String rep_four ='';
  String rep_five ='';
  String rep_six ='';


  DatabaseReference _detailRef;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _detailRef = database
        .reference()
        .child('Exercise')
        .child(widget.phone)
        .child('Back');
    super.initState();
  }


  @override


  Widget build(BuildContext context) {

    _detailRef.once().then((DataSnapshot snapshot){
      setState(() {



         });
    });
    return Scaffold(
      backgroundColor: Colors.grey[50],
//      appBar: AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.grey[50],
////        leading: Icon(
////          Icons.arrow_back,
////          color: Colors.grey,
////
////        ),
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Day 1 :04',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/pushups.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Seated Rows',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${retrievedData} reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/crunches.jpg'),
                    radius: 25,
                  ),
                  title: Text('Lat Pull Down',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('30 reps, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/planks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Chin/Pull Ups',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/climbers.jpg'),
                    radius: 25,
                  ),
                  title: Text('Bent Over Rows',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('25 reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/squats.jpg'),
                    radius: 25,
                  ),
                  title: Text('Shrugs',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('20 reps, 3 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Pulley Rows',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Hyperextension',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class Shoulder extends StatefulWidget {
  @override
  State<Shoulder> createState() => _ShoulderState();
}

class _ShoulderState extends State<Shoulder> {
  Color _containerColor = Colors.blue;

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  DatabaseReference _detailRef;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _detailRef = database
        .reference()
        .child('Exercise')
        .child('9999999999')
        .child('chest');
    super.initState();
  }


  @override


  Widget build(BuildContext context) {

    _detailRef.once().then((DataSnapshot snapshot){
      setState(() {
        retrievedData = snapshot.value['rep_one'].toString();
      });
    });
    return Scaffold(
      backgroundColor: Colors.grey[50],
//      appBar: AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.grey[50],
////        leading: Icon(
////          Icons.arrow_back,
////          color: Colors.grey,
////
////        ),
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Day 1 : Bi Tri legs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/pushups.jpg'),
                    radius: 25,
                  ),
                  title: Text('Shoulder press',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${retrievedData} reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/crunches.jpg'),
                    radius: 25,
                  ),
                  title: Text('Rear Delt Fly',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('30 reps, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/planks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Front Raises',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/climbers.jpg'),
                    radius: 25,
                  ),
                  title: Text('Lateral Raises',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('25 reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

            ],
          ),
        ),
      ),
    );
  }
}


class Legs extends StatefulWidget {
  @override
  State<Legs> createState() => _LegsState();
}

class _LegsState extends State<Legs> {
  Color _containerColor = Colors.blue;

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  DatabaseReference _detailRef;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _detailRef = database
        .reference()
        .child('Exercise')
        .child('9999999999')
        .child('chest');
    super.initState();
  }


  @override


  Widget build(BuildContext context) {

    _detailRef.once().then((DataSnapshot snapshot){
      setState(() {
        retrievedData = snapshot.value['rep_one'].toString();
      });
    });
    return Scaffold(
      backgroundColor: Colors.grey[50],
//      appBar: AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.grey[50],
////        leading: Icon(
////          Icons.arrow_back,
////          color: Colors.grey,
////
////        ),
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Day 1 : Bi Tri legs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/pushups.jpg'),
                    radius: 25,
                  ),
                  title: Text('Squats',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${retrievedData} reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/crunches.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Leg Press',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('30 reps, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/planks.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Leg Curl',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/climbers.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Leg Extn',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('25 reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/squats.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c adduction/abductor',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('20 reps, 3 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),




              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Setp Ups',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Calf Raises',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}


class Biceps extends StatefulWidget {
  @override
  State<Biceps> createState() => _BicepsState();
}

class _BicepsState extends State<Biceps> {
  Color _containerColor = Colors.blue;

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var retrievedData = '';
  DatabaseReference _detailRef;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _detailRef = database
        .reference()
        .child('Exercise')
        .child('9999999999')
        .child('chest');
    super.initState();
  }


  @override


  Widget build(BuildContext context) {

    _detailRef.once().then((DataSnapshot snapshot){
      setState(() {
        retrievedData = snapshot.value['rep_one'].toString();
      });
    });
    return Scaffold(
      backgroundColor: Colors.grey[50],
//      appBar: AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.grey[50],
////        leading: Icon(
////          Icons.arrow_back,
////          color: Colors.grey,
////
////        ),
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Day 1 : Bi Tri legs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/pushups.jpg'),
                    radius: 25,
                  ),
                  title: Text('Trips Extn',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('${retrievedData} reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/crunches.jpg'),
                    radius: 25,
                  ),
                  title: Text('Rev. Grip Pulley Push down',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('30 reps, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/planks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Kickback',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/climbers.jpg'),
                    radius: 25,
                  ),
                  title: Text('m/c Leg Extn',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('25 reps, 4 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/squats.jpg'),
                    radius: 25,
                  ),
                  title: Text('Tricep Dip',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('20 reps, 3 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),




              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Skull crushers',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Bicep Curls',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Rev Grip Pulley curl',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),


              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Hammer curl',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Preacher curl',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.2,
                          offset: Offset(0.3, 0.5),
                          spreadRadius: 0.5)
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    ExactAssetImage('assets/images/sideplanks.jpg'),
                    radius: 25,
                  ),
                  title: Text('Concentration curls',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('60 secs, 2 sets',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                  trailing: Ink(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _containerColor = _containerColor == Colors.red ?
                          Colors.blue :
                          Colors.red;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}