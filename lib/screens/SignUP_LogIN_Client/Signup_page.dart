import 'package:flutter/material.dart';
//import 'package:flash_chat/components/rounded_button.dart';
import 'package:fms/config/constants.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/main_client.dart';
import 'package:fms/screens/SignUP_LogIN_Client/ClientCred.dart';
import 'package:fms/screens/members/add_members.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String Number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            SizedBox(
              height: 8.0,
            ),

            TextField(
              textAlign: TextAlign.center,

              onChanged: (value) {
                //Do something with the user input.
                Number =value ;
              },
//              decoration: kTextFieldDecoration.copyWith(
//                  hintText: 'Enter your Password'
//              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              padding: const EdgeInsets.all(5.0),width: 350,
              decoration: BoxDecoration(
                color: Palette.thirdColor,
                borderRadius: BorderRadius.all(Radius.circular(40)
                ),
              ),
              child: FlatButton(
                onPressed: () {


                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp(),)
                      );


                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//// TODO Implement this library.
//import 'package:flutter/material.dart';
//import 'package:fms/animation/fade_animation.dart';
//import 'package:fms/authentication/authentication_service.dart';
//import 'package:fms/config/palette.dart';
//import 'package:fms/widgets/make_input.dart';
//import 'package:provider/provider.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:fms/config/constants.dart';
//import 'package:fms/widgets/loading.dart';
//
//class RegistrationScreen extends StatefulWidget {
//  @override
//  State<RegistrationScreen> createState() => _RegistrationScreenState();
//}
//
//class _RegistrationScreenState extends State<RegistrationScreen> {
//  final TextEditingController nameController = TextEditingController();
//  final TextEditingController gymnameController = TextEditingController();
//  final TextEditingController emailController = TextEditingController();
//  final TextEditingController password1Controller = TextEditingController();
//  final TextEditingController password2Controller = TextEditingController();
//
//  String Number;
//  bool loading = false;
//
//  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//    return GestureDetector(
//      onTap: onTap,
//      child: Container(
//        height: 60.0,
//        width: 60.0,
//        decoration: BoxDecoration(
//          shape: BoxShape.circle,
//          color: Colors.white,
//          boxShadow: [
//            BoxShadow(
//              color: Colors.black26,
//              offset: Offset(0, 2),
//              blurRadius: 6.0,
//            ),
//          ],
//          image: DecorationImage(
//            image: logo,
//          ),
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return loading ? Loading():Scaffold(
//      backgroundColor: Palette.primaryColor,
//      resizeToAvoidBottomInset: true,
//      appBar: AppBar(
//        elevation: 0,
//        brightness: Brightness.light,
//        backgroundColor: Colors.white,
//        leading: IconButton(
//          icon: Icon(
//            Icons.arrow_back_ios,
//            size: 20.0,
//            color: Colors.black,
//          ),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//      ),
//      body: SafeArea(
//        child: Stack(
//          children: [
//            SingleChildScrollView(
//              child: Container(
//                padding: EdgeInsets.symmetric(horizontal: 40.0),
//                height: MediaQuery.of(context).size.height - 50,
//                width: double.infinity,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: [
//                    Column(
//                      children: [
//                        FadeAnimation(
//                          1.0,
//                          Text(
//                            'SIGN UP',
//                            style: TextStyle(
//                              fontFamily: 'Varela Round',
//                              fontSize: 30.0,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 20.0,
//                        ),
//                        FadeAnimation(
//                          1.2,
//                          Text(
//                            'Create an account for your GYM',
//                            style: TextStyle(
//                              fontFamily: 'Varela Round',
//                              color: Colors.grey[700],
//                              fontSize: 15.0,
//                              fontWeight: FontWeight.w700,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                    Column(
//                      children: [
//                        FadeAnimation(
//                          1.3,
//                          MakeInput(
//                            label: 'Email',
//                            obscureText: false,
//                            controllerID: emailController,
//                          ),
//                        ),
//
//                        TextField(
//
//              textAlign: TextAlign.center,
//              keyboardType: TextInputType.emailAddress,
//
//              onChanged: (value) {
//                //Do something with the user input.
//                Number =value;
//              },
////              decoration: kTextFieldDecoration.copyWith(
////                  hintText: 'Enter your E-mail'
////              ),
//            ),
//                        FadeAnimation(
//                          1.4,
//                          MakeInput(
//                            label: 'Password',
//                            obscureText: true,
//                            controllerID: password1Controller,
//                          ),
//                        ),
//                        FadeAnimation(
//                          1.5,
//                          MakeInput(
//                            label: 'Confirm Password',
//                            obscureText: true,
//                            controllerID: password2Controller,
//                          ),
//                        ),
//                      ],
//                    ),
//                    FadeAnimation(
//                      1.6,
//                      Container(
//                        padding: EdgeInsets.only(
//                          top: 3.0,
//                        ),
//
//                        child: MaterialButton(
//                          minWidth: double.infinity,
//                          height: 60.0,
//                          onPressed: () {
//                            setState((){
//                              loading = true;
//                            });
//                            if (password1Controller.text ==
//                                password2Controller.text) {
//                              context.read<AuthenticationService>().signUp(
//                                email: emailController.text.trim(),
//                                password: password1Controller.text.trim(),
//                              );
//                              Navigator.pop(context);
//                            }else{
//                              setState((){
//                                loading = false;
//                              });
//                              Alert(
//                                context: context,
//                                type: AlertType.error,
//                                title: "Alert",
//                                desc: "Both passwords should match each other!",
//                                buttons: [
//                                  DialogButton(
//                                    child: Text(
//                                      "Ok",
//                                      style: TextStyle(
//                                          color: Colors.white, fontSize: 20),
//                                    ),
//                                    onPressed: () => Navigator.pop(context,
//                                    //MaterialPageRoute(builder: (context) => MyApp(text: Number,),
//                                        MaterialPageRoute(builder: (context) => MyApp(text: Number,),)
//                                    ),
//                                    width: 120,
//                                  )
//                                ],
//                              ).show();
//                            }
//                          },
//                          color: Palette.thirdColor,
//                          shape: RoundedRectangleBorder(
////                          side: BorderSide(
////                            color: Colors.black,
////                          ),
//                              borderRadius: BorderRadius.circular(50.0)),
//                          child: Text(
//                            'Sign Up',
//                            style: TextStyle(
//                              fontWeight: FontWeight.w600,
//                              fontSize: 18.0,
//                              color: Colors.white,
//                              fontFamily: 'Varela Round',
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      height: 10.0,
//                    ),
//                    FadeAnimation(
//                      1.7,
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//
//
//                        ],
//                      ),
//                    ),
//
//
//
//
//
//
//                    FadeAnimation(
//                      1.7,
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                          Text(
//                            'Already have an account? ',
//                          ),
//                          Text(
//                            'Login',
//                            style: TextStyle(
//                              fontWeight: FontWeight.w600,
//                              fontSize: 18.0,
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  ],
//
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
