import 'package:flutter/material.dart';
import 'package:medical_app/Common/Color_extentions.dart';

class Button_Style extends StatelessWidget {
  Button_Style({super.key, required this.title, required this.onpressed});
  final String title;
  VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(title),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              TColor.primary), // Set the background color.
          textStyle: MaterialStateProperty.all(TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Quicksand-Regular")), // Set the text color.
          padding:
              MaterialStateProperty.all(EdgeInsets.all(16)), // Set padding.
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Set button border radius.
          )),
        ),
      ),
    );
  }
}
