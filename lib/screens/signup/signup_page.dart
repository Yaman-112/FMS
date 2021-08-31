// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fms/animation/fade_animation.dart';
import 'package:fms/authentication/authentication_service.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/widgets/make_input.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fms/config/constants.dart';
import 'package:fms/widgets/loading.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var _formkey = GlobalKey<FormState>();

  final referenceDatabase = FirebaseDatabase.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController Name = TextEditingController();
  final TextEditingController phonetext = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  bool loading = false;

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return loading ? Loading():Scaffold(
      backgroundColor: Palette.primaryColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: Colors.black,
          ),
          onPressed: () {

            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Form(


          key: _formkey,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    height: MediaQuery.of(context).size.height - 50,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              FadeAnimation(
                                1.0,
                                Text(
                                  'SIGN UP_',
                                  style: TextStyle(
                                    fontFamily: 'Varela Round',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              FadeAnimation(
                                1.2,
                                Text(
                                  'Create an account for your GYM',
                                  style: TextStyle(
                                    fontFamily: 'Varela Round',
                                    color: Colors.grey[700],
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              FadeAnimation(
                                1.4,
                                MakeInput(
                                  label: 'Name',
                                  obscureText: false,
                                  controllerID: Name,
                                ),
                              ),
                              FadeAnimation(
                                1.4,
                                MakeInput(
                                  label: 'Phone',
                                  obscureText: false,
                                  controllerID: phonetext,
                                ),
                              ),

                              FadeAnimation(
                                1.3,
                                MakeInput(
                                  label: 'Email',
                                  obscureText: false,
                                  controllerID: emailController,
                                ),
                              ),
                              FadeAnimation(
                                1.4,
                                MakeInput(
                                  label: 'Password',
                                  obscureText: true,
                                  controllerID: password1Controller,
                                ),
                              ),
                              FadeAnimation(
                                1.5,
                                MakeInput(
                                  label: 'Confirm Password',
                                  obscureText: true,
                                  controllerID: password2Controller,
                                ),
                              ),

                            ],
                          ),
                          FadeAnimation(
                            1.6,
                            Container(
                              padding: EdgeInsets.only(
                                top: 3.0,
                              ),

                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60.0,
                                onPressed: () {


                                  if(_formkey.currentState.validate()){

                                    if (password1Controller.text ==
                                        password2Controller.text) {

                                      context.read<AuthenticationService>().signUp(
                                        email: emailController.text.trim(),
                                        password: password1Controller.text.trim(),
                                      ).then((value) =>
                                          ref
                                              .child('trainer_uid')
                                              .child(auth.currentUser.uid)
                                              .set(
                                            {
                                              'Name': Name.text,
                                              'Phone':phonetext.text,
                                              'Email':emailController.text,
                                            },
                                          ).asStream(),
                                      );







                                      Navigator.pop(context);

                                    }else{
                                      setState((){
                                        loading = false;
                                      });
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Alert",
                                        desc: "Both passwords should match each other!",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 20),
                                            ),
                                            onPressed: () => Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  }
                                },
                                color: Palette.thirdColor,
                                shape: RoundedRectangleBorder(
//                          side: BorderSide(
//                            color: Colors.black,
//                          ),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontFamily: 'Varela Round',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FadeAnimation(
                            1.7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                              ],
                            ),
                          ),






                          FadeAnimation(
                            1.7,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                ),
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],

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

