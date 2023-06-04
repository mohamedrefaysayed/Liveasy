import 'package:flutter/material.dart';
import 'package:liveasy/Helper/Colors.dart';

class submitButton extends StatelessWidget {
  const submitButton({Key? key, required this.mywidth, required this.myhight, required this.text, required this.ontap}) : super(key: key);

  final double mywidth;
  final double myhight;
  final String text;
  final ontap;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: mywidth,
        height: myhight,
        color: myColors.darkblue,
        child: Center(
          child: Text(
            text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
          ),
        ),
      ),
    );
  }
}
