import 'package:flutter/material.dart';

class WaveClipper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path0 = Path();
    path0.moveTo(size.width*0.0502000,size.height*1.0100000);
    path0.lineTo(size.width*1.0010000,size.height*1.0100000);
    path0.lineTo(size.width*1.0010000,size.height*0.7084000);
    path0.quadraticBezierTo(size.width*0.6451000,size.height*1.0131000,size.width*0.5412000,size.height*0.8524000);
    path0.cubicTo(size.width*0.3914000,size.height*0.6689000,size.width*0.3606000,size.height*0.6159000,size.width*0.2602000,size.height*0.5492000);
    path0.quadraticBezierTo(size.width*0.1760500,size.height*0.5228000,size.width*-0.0050000,size.height*0.7380000);
    path0.lineTo(size.width*-0.0050000,size.height*1.0020000);


    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}