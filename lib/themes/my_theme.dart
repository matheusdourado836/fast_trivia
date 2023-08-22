import 'package:flutter/material.dart';

class MyTheme {
  static const Color backgroundColor = Color.fromRGBO(245, 245, 245, 1);
  static const Color primaryColor = Color.fromRGBO(99, 183, 108, 1);
  static const Color secondaryColor = Color.fromRGBO(147, 112, 219, 1);
  static const Color dangerColor = Color.fromRGBO(187, 33, 36, 1);
  static const Color questionContainerColor = Color.fromRGBO(255, 255, 241, 1);
  
  Widget customElevatedButton({required Function() function, required Color backgroundColor, required Widget child}) {
    return ElevatedButton(
        onPressed: (() {function();}),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: MyTheme.backgroundColor,
          fixedSize: const Size(300, 45),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
        child: child
    );
  }
}