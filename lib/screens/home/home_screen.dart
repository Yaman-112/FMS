//// TODO Implement this library.
//import 'package:flutter/material.dart';
//import 'package:fms/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fms/screens/drawer.dart';
//import 'package:fms/widgets/custom_app_bar.dart';
//import 'package:fms/widgets/stats_grid.dart';
//import'package:fms/widgets/main_card_programs.dart';
//import'package:fms/widgets/image_card_with_internal.dart';
//import 'package:fms/widgets/section.dart';
//class HomeScreen extends StatefulWidget {
//  @override
//  _HomeScreenState createState() => _HomeScreenState();
//}
//
//class _HomeScreenState extends State<HomeScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      //backgroundColor: Palette.primaryColor,
//      appBar: AppBar(
//        iconTheme: IconThemeData(color: Colors.black),
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
//      drawer: AppDrawer(),
//      body: SafeArea(
//        child: SingleChildScrollView(
//          child: Column(
//
//              children:[
//                SizedBox(
//                  height: 20,
//                ),
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,10.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: [
//                      Text('Dashboard',
//                        style: TextStyle(
//                          //fontFamily: 'Varela Round',
//                          fontSize: 33.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//                      SizedBox(
//                        height: 8,
//                      ),
//                      Text('Welcome to FMS',
//                        style: TextStyle(
//                          //fontFamily: 'Varela Round',
//                          fontSize: 20.0,
//                          color: Colors.grey,
//                          // fontWeight: FontWeight.bold,
//                        ),
//                      ),
//
//
//
//                    ],
//                  ),
//                ),
//
//                Column(
//                  children: [
//                    MainCardPrograms(),
//                    Section(
//                      title: 'Section',
//                      horizontalList: <Widget>[
//                        ImageCardWithInternal(
//                          image: 'assets/images/image004.jpg',
//                          title: 'Next \nWorkout',
//                          duration: '7 min',
//                        ),
//                        ImageCardWithInternal(
//                          image: 'assets/images/image004.jpg',
//                          title: 'Core \nWorkout',
//                          duration: '7 min',
//                        ),
//                        ImageCardWithInternal(
//                          image: 'assets/images/image004.jpg',
//                          title: 'Core \nWorkout',
//                          duration: '7 min',
//                        ),
//                      ],
//                    ),
//
//
//
//                  ],
//                ),
//              ]
//
//
//          ),
////          Column(
////            children: [
////              Container(
////                padding: const EdgeInsets.all(20.0),
////                decoration: BoxDecoration(
////                  color: Palette.secondaryColor,
////                  borderRadius: BorderRadius.only(
////                    bottomLeft: Radius.circular(40.0),
////                    bottomRight: Radius.circular(40.0),
////                  ),
////                ),
////             child: Row(
////                  mainAxisAlignment: MainAxisAlignment.center,
////                  children: [
////                    StatsGrid('Income', 'Rs. 4,500.00',
////                        'assets/images/increase_presentation_Profit_growth-512.png'),
////                    StatsGrid('Expense', 'Rs. 1,500.00',
////                        'assets/images/decrease_presentation_down_loss-512.png'),
////                  ],
////                ),
////              ),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.center,
////                children: [
////                  StatsGrid('', '',
////                      'assets/images/family_tree_members_people-512.png'),
////                  StatsGrid('Trainers', '2',
////                      'assets/images/gym_coach_trainer_fitness-512.png'),
////                ],
////              ),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.center,
////                children: [
////                  StatsGrid('Equipments', '1',
////                      'assets/images/dumbbell_gym_fitness_exercise-512.png'),
////                  StatsGrid('Equipments', '1',
////                      'assets/images/dumbbell_gym_fitness_exercise-512.png'),
////
////                ],
////              ),
////
////              Row(
////                mainAxisAlignment: MainAxisAlignment.center,
////                children: [
////                  StatsGrid('Equipments', '1',
////                      'assets/images/dumbbell_gym_fitness_exercise-512.png'),
////                    StatsGrid('Equipments', '1',
////                      'assets/images/dumbbell_gym_fitness_exercise-512.png'),
////
////                ],
////              ),
////            ],
////          ),
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:fms/screens/members/add_members.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import'package:flutter_screenutil/flutter_screenutil.dart';
import'package:fms/config/palette.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  var retrievedData = '';
  DatabaseReference _UserRef;

  DatabaseReference UseRef;
  int jmlPria;
  int number;

  var nodes = [];
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    _UserRef = database
        .reference()
        .child('trainer_uid')
        .child(FirebaseAuth.instance.currentUser.uid);


    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    _UserRef.once().then((DataSnapshot snapshot){
       setState(() {
         retrievedData = snapshot.value['Name'].toString();
         print('Data_t : ${retrievedData}');

       });

    });




    ///Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.instance = ScreenUtil(width: 828, height: 1792)..init(context);
    drawer: AppDrawer();
    return Scaffold(

      drawer: AppDrawer(),
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Palette.secondaryColor),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(
            Icons.menu,
            color: Color(0xFF433D82),
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBodyContent(context),
//        Align(
//          alignment: FractionalOffset.bottomRight,
//          child: _buildAddButton(),
//        ),
      ],
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildHelloWidget(context: context, name: 'DashBoard'),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildDateWidget(context: context),
          ),
          SizedBox(height: 20.0),
          Divider(),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildTaskTypesWidget(context: context),
          ),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 20.0),
          _buildGridView(context)
        ],
      ),
    );
  }

  Widget _buildHelloWidget(
      {@required BuildContext context, @required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'FMS:  ${retrievedData}'.toUpperCase(),
          style: Theme.of(context).textTheme.display1.copyWith(
            color: Palette.secondaryColor,
            fontSize: ScreenUtil(allowFontScaling: true).setSp(70),
          ),
        ),
        Text(
          '$name',
          style: Theme.of(context).textTheme.display2.copyWith(
            color: Palette.secondaryColor,
            fontWeight: FontWeight.w700,
            fontSize: ScreenUtil(allowFontScaling: true).setSp(100),
          ),
        ),
      ],
    );
  }

  Widget _buildDateWidget({@required BuildContext context}) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF878695),
        ),
        children: <TextSpan>[
          TextSpan(
            text: DateFormat("EEEEE", "en_US").format(DateTime.now()) + ', ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(27),
            ),
          ),
          TextSpan(
            text: DateFormat.yMMMMd("en_US").format(DateTime.now()),
            style: TextStyle(
              fontSize: ScreenUtil(allowFontScaling: true).setSp(27),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTypesWidget({@required BuildContext context}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      _buildTaskStatusWidget(context: context, count: '57', title: 'Created'),
      _buildTaskStatusWidget(context: context, count: '35', title: 'Completed'),
    ]);
  }

  Widget _buildTaskStatusWidget(
      {@required BuildContext context, String count, String title}) {
    return Row(
      children: <Widget>[
        Text(
          count,
          style: Theme.of(context).textTheme.title.copyWith(
            color: Color(0xFF433D82),
            fontSize: ScreenUtil(allowFontScaling: true).setSp(45),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          '$title \nTasks',
          style: TextStyle(
            fontSize: ScreenUtil(allowFontScaling: true).setSp(25),
            color: Color(0xFF878695),
          ),
        )
      ],
    );
  }

  Widget _buildGridView(BuildContext context) {
    return Flexible(
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: ScreenUtil.screenWidth * 0.025,
          children: <Widget>[
            _buildGridTile(
                context: context,
                icon: Icons.library_books,
                title: 'All Schedule',
                subTitle: '57 Tasks'),
            _buildGridTile(
                context: context,
                icon: Icons.person,
                title: 'Active Members',
                subTitle: '23 Tasks'),
            _buildGridTile(
                context: context,
                icon: Icons.group,
                title: 'Total Member',
                subTitle: '45 Tasks'),
            _buildGridTile(
                context: context,
                icon: Icons.add,
                title: 'Add Member',
                subTitle: '10 Tasks',
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddMembers(),
                      //builder: (context) => RegistrationScreen(),

                    ),
                  );
                },
            ),

          ].map((Widget child) {
            return GridTile(child: child);
          }).toList()),
    );
  }

  Widget _buildGridTile(
      {@required BuildContext context,
        @required IconData icon,
        String title,
        String subTitle,
        onTap,
      }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.lightGreen,
      ),
      title: Text(
        title.replaceAll(" ", "\n"),
        style: TextStyle(
          fontSize: ScreenUtil().setSp(35),
        ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.caption.copyWith(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0)),
      child: MaterialButton(
        height: 55.0,
        minWidth: 55.0,
        child: Icon(Icons.add, color: Colors.white),
        color: Color(0xFFFF4954),
        onPressed: () {

        },
      ),
    );
  }
}
