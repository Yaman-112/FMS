import 'package:flutter/material.dart';
import 'package:fms/animation/fade_animation.dart';
import 'package:fms/config/palette.dart';
import 'package:fms/screens/login/login_page.dart';
import 'package:fms/screens/signup/signup_page.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage_t extends StatefulWidget {
  @override
  State<WelcomePage_t> createState() => _WelcomePage_tState();
}

class _WelcomePage_tState extends State<WelcomePage_t> with TickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,

    );
    //animation = CurvedAnimation(parent: controller,curve: Curves.decelerate);
    controller.forward();
    animation = ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);

    animation.addStatusListener((status) {
//      if(status == AnimationStatus.completed){
//        controller.reverse(from: 1.0);
//      }else if(status == AnimationStatus.dismissed){
//        controller.forward();
//      }

    });
    //controller.reverse(from: 1.0);
    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:    Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),),

        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 29.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    FadeAnimation(
                      1.0,
                      TyperAnimatedTextKit(
                        text: ['#fms'],
                        textStyle: TextStyle(
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0,
                          color: Colors.grey,
                          //decoration: TextDecoration.underline,
                          //decorationStyle: TextDecorationStyle.wavy,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),

                  ],
                ),


                FadeAnimation(
                  1.5,

                  Text(
                    '''Fitness Managememt System''',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                        ),],
                      fontFamily: 'ProductSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Text('Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit. Eget neque turpis elit gravida',
                    style: TextStyle(

                      fontFamily: 'Varela Round',
                      //fontWeight: FontWeight.w100,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FadeAnimation(
                      1.5,
                      Container(
                        padding: EdgeInsets.only(
                          top: 3.0,
                        ),

                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50.0,
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage_nutrtion(),
                              ),
                            );
                          },
                          color: Palette.thirdColor,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(60.0)),
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.only(
                          top: 3.0,
                        ),

                        child: MaterialButton(
                          //minWidth: double.infinity,
                          //height: 60.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage_nutrtion(),
                              ),
                            );
                          },
                          child: Text(
                            'Or Log In',
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
//                    SizedBox(
//                      height: 50,
//                    ),
                  ],
                ),
              ],
            ),
          ),
          //),
        ),
      ),
    );
  }
}
