import 'package:flutter/material.dart';
import 'package:fms/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String screenTitle;
  CustomAppBar(this.screenTitle);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //iconTheme: IconThemeData(color: Colors.black),
      //backgroundColor: Palette.secondaryColor,
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      title: Text(screenTitle,
      style: TextStyle(
        fontFamily: 'ProductSans',
        color: Colors.black,
        fontWeight: FontWeight.w600,
       // fontSize: 22,
      ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
