import 'package:flutter/material.dart';
import 'package:fms/config/palette.dart';

class CustomAppBar2 extends StatelessWidget with PreferredSizeWidget {
  final IconData icon;
  final String screenTitle;
  final Function func;
  CustomAppBar2(this.icon, this.func, this.screenTitle);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      title: Text(screenTitle
      ,style: TextStyle(
          color: Colors.black
        ),),
      leading: IconButton(
        icon: Icon(icon,),
        iconSize: 28.0,
        onPressed: func,
        color: Colors.black,
      ),
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.notifications_none),
      //     iconSize: 28.0,
      //     onPressed: () {},
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
