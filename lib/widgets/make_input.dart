
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MakeInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controllerID;
  MakeInput({this.label, this.obscureText, this.controllerID});
  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 5.0,
        ),
        TextFormField(

          controller: controllerID,
          obscureText: obscureText,
          validator: (String value){
            if(value.isEmpty){
              return 'Please fill the empty text fields';
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 10.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400],
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
