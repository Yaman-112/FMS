import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:my_gym_manager/screens/equipments/equipments_screen.dart';
import 'package:fms/screens/home/home_screen.dart';
//import 'package:my_gym_manager/screens/income_expenses/inc_exp_screen.dart';
import 'package:fms/screens/members/members_screen.dart';
import 'package:fms/screens/members/w.dart';
//import 'package:my_gym_manager/screens/trainers/trainers_screen.dart';



class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

//  final referenceDatabase = FirebaseDatabase.instance;
//
//  final FirebaseAuth auth = FirebaseAuth.instance;
//
//   String retrievedData ='' ;
//
//  String retrievedData_one ='';
//
//  DatabaseReference _detailRef;
//
//  DatabaseReference numref;
//
//  @override
//  void initState() {
//    final FirebaseDatabase database = FirebaseDatabase();
//
//    numref = database
//        .reference()
//        .child('members')
//        .child(FirebaseAuth.instance.currentUser.uid);
//    numref.once().then((DataSnapshot snapshot){
//      setState(() {
//        retrievedData_one = snapshot.value['phone'].toString();
//        print('Data_two : ${retrievedData_one}');
//
//      });
//    });
//
//    super.initState();
//  }




  final List screens = [
//    TrainersScreen(),
    HomePage(),
    //MembersScreen(),
    www(),
    //HomePage(),
//    EquipmentsScreen(),
//    IncExpScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        elevation: 0.0,
        items: [
          Icons.home,
          Icons.group,
          //Icons.home,
//          Icons.fitness_center,
//          Icons.bar_chart,
        ]
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                BottomNavigationBarItem(
                  label: '',
                  icon: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: _currentIndex == key
                          ? Color(0xFF39A2DB)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(value),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
