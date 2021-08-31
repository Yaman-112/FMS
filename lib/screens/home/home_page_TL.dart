import 'package:flutter/material.dart';
import 'package:fms/screens/members/add_members.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import'package:flutter_screenutil/flutter_screenutil.dart';
import'package:fms/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class HomePage_TL extends StatefulWidget {
  @override
  State<HomePage_TL> createState() => _HomePage_TLState();
}

class _HomePage_TLState extends State<HomePage_TL> {




  var retrievedData = '';

  var retrievedData_two = '';
  DatabaseReference traRef;

  DatabaseReference memRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase();
    memRef = database
        .reference()
        .child('COUNT');

    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    memRef.once().then((DataSnapshot snapshot){
      setState(() {
        retrievedData_two = snapshot.value['member_c'].toString();

        retrievedData = snapshot.value['trainer_c'].toString();
        print('Data_t : ${retrievedData}');

      });

    });


    ///Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.instance = ScreenUtil(width: 828, height: 1792)..init(context);
    //drawer: AppDrawer();
    return Scaffold(

      //drawer: AppDrawer(),
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
          'FMS: TOP LEVEL ADMIN'.toUpperCase(),
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
                title: 'Total Trainers',
                subTitle: '${retrievedData}'),
            _buildGridTile(
                context: context,
                icon: Icons.person,
                title: 'Total Members',
                subTitle: '${retrievedData_two}'),
            _buildGridTile(
                context: context,
                icon: Icons.group,
                title: 'PT Member',
                subTitle: '45 Tasks'),
            _buildGridTile(
              context: context,
              icon: Icons.group,
              title: 'GT Member',
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
