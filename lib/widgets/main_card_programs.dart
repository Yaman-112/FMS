import 'package:flutter/material.dart';

class MainCardPrograms extends StatelessWidget {
  final Map<String, String> cardInfo = {
    'title': 'Active Users',
    'time': '8',
    'image': 'assets/images/imagebc.jpeg',
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.cardInfo['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                this.cardInfo['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              )
            ],
          ),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.blue[600].withOpacity(0.50),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
      width: size.width - 30,
      height: (size.width - 10) / 2,
      margin: EdgeInsets.only(
        top: 20.0,
        left: 10.0,
        right: 10.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.cardInfo['image']),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.50),
            blurRadius: 10.0,
            offset: Offset(3.0, 2.0),
          ),
        ],
      ),
    );
  }
}
