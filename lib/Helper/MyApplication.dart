// ignore_for_file: file_names, empty_catches, non_constant_identifier_names, depend_on_referenced_packages



// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveasy/Helper/Colors.dart';

class myApplication {
  static double hightClc(int myHeight, BuildContext context) {
    return MediaQuery.of(context).size.height * myHeight / 640;
  }

  static double widthClc(int myWidth, BuildContext context) {
    return MediaQuery.of(context).size.width * myWidth / 360;
  }

  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToReplace(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false,
      );



  static showToast({
    required String text,
    required color,
  }) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: myColors.lightblue,
      fontSize: 16,
    );
  }

  static keyboardFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }





}
