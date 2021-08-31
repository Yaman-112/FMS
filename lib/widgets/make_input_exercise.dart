import 'package:flutter/material.dart';
import 'package:fms/config/palette.dart';

class MakeInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controllerID;
  MakeInput({this.label, this.obscureText, this.controllerID});
  @override
  Widget build(BuildContext context) {
    return


      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Varela Round',
              fontSize: 15.0,
              fontWeight: FontWeight.w100,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height:2.5,

          ),
          SizedBox(
            width: 70,
            height: 30,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: controllerID,
              obscureText: obscureText,
              validator: (String value){
                if(value.isEmpty){
                  return '*';
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 10.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.thirdColor,
                    width: 1,
                  ),
                  //borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400],
                    width: 5,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.5,
          ),
        ],
    ),
      );
  }
}
