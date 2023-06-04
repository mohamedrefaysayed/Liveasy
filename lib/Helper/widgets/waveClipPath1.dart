import 'package:flutter/material.dart';

class WaveClipper1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path0 = Path();
    path0.moveTo(size.width*0.0552000,size.height*1.0080000);
    path0.lineTo(size.width*1.0060000,size.height*1.0080000);
    path0.lineTo(size.width*1.0060000,size.height*0.7064000);
    path0.quadraticBezierTo(size.width*0.8591000,size.height*0.7171000,size.width*0.7552000,size.height*0.5564000);
    path0.cubicTo(size.width*0.6184000,size.height*0.3569000,size.width*0.3836000,size.height*0.9259000,size.width*0.2832000,size.height*0.8592000);
    path0.quadraticBezierTo(size.width*0.2080500,size.height*0.8588000,0,size.height*0.6080000);
    path0.lineTo(0,size.height);


    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}