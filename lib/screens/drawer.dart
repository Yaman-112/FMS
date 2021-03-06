import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fms/authentication/authentication_service.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/widgets/custom_darwer_grid.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gymnameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DatabaseReference _detailRef;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _detailRef = database
        .reference()
        .child(FirebaseAuth.instance.currentUser.uid)
        .child('Details');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return Container(

      width: 180.0,
      child: Drawer(
        child: Container(

//          decoration: BoxDecoration(
//              gradient: LinearGradient(
//
//                  begin: Alignment.bottomLeft,
//                  end: Alignment.topRight,
//
//                  stops: [0.3, 0.7],
//                  colors: [Colors.deepPurpleAccent, Colors.white]),
//       borderRadius: BorderRadius.circular(0.0),
//          ),
//
//        decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(0.0),),
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20.0,50.0,10.0,0.0),
          color: Palette.primaryColor,
          child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25.0),
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/img2.jpg'),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          child: new FirebaseAnimatedList(
                              shrinkWrap: true,
                              query: _detailRef,
                              itemBuilder: (
                                  BuildContext context,
                                  DataSnapshot snapshot,
                                  Animation<double> animation,
                                  int index,
                                  ) {
                                return CustomDG(
                                  name: snapshot.value['Name'].toString(),
                                  gymname: snapshot.value['GYM_Name'].toString(),
                                  description:
                                  snapshot.value['Description'].toString(),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    FirebaseAuth.instance.currentUser.email,
                    style: TextStyle(

                        color: Palette.thirdColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  //   Text('Update Your Details in Settings!'),
                  SizedBox(height: 10.0),
                  Divider(
                    color: Palette.thirdColor,),
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Palette.secondaryColor,
                          ),
                          onPressed: () => {
                            Alert(
                                context: context,
                                title: "DETAILS",
                                content: Column(
                                  children: <Widget>[
                                    TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.person),
                                        labelText: 'Your name',

                                      ),
                                      controller: nameController,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.home_rounded),
                                        labelText: 'GYM name',
                                      ),
                                      controller: gymnameController,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.info),
                                        labelText: 'Description',
                                      ),
                                      controller: descriptionController,
                                    ),
                                  ],
                                ),
                                buttons: [
                                  DialogButton(
                                    color: Palette.secondaryColor,
                                    onPressed: () => {
                                      ref
                                          .child(auth.currentUser.uid)
                                          .child('Details')
                                          .child('1')
                                          .set(
                                        {
                                          'Name': nameController.text,
                                          'GYM_Name': gymnameController.text,
                                          'Description': descriptionController.text,
                                        },
                                      ).asStream(),
                                      nameController.clear(),
                                      gymnameController.clear(),
                                      descriptionController.clear(),
                                    },
                                    child: Text(
                                      'UPDATE',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ]).show()
                          }),


                      Text(
                        'Settings',
                        style: TextStyle(
                            color: Palette.thirdColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),

                  Divider(
                    color: Palette.thirdColor,),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: Palette.thirdColor,
                        ),
                        tooltip: 'Log Out of the App',
                        onPressed: () => {
                          context.read<AuthenticationService>().signOut(),
                        },
                      ),

                      Text(
                        'Log Out',
                        style: TextStyle(
                            color: Palette.thirdColor,
                            fontFamily: 'Varela Round',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),

                  Divider(color: Colors.black),
                ],
              )),
        ),
      ),
    );
  }
}
