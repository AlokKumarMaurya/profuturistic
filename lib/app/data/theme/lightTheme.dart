import 'package:flutter/material.dart';

ThemeData light({Color color = Colors.red}) => ThemeData(
    useMaterial3: true,
    disabledColor: Colors.grey,
    primaryColor: const Color(0xff0270bd),
    indicatorColor: const Color(0xff001532),
    scaffoldBackgroundColor: Colors.white,
    primaryColorDark: const Color(0xff054c7c),
    errorColor: Colors.red,
    shadowColor: const Color(0xff282626),
    hoverColor: Colors.transparent,
    dividerColor: Colors.green,
    canvasColor: Colors.black,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        wordSpacing: 2,
        overflow: TextOverflow.ellipsis,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25,
      ),
    ));
