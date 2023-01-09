import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        canvasColor: creamColor,
        // ignore: deprecated_member_use
        buttonColor: darkbluishColor,
        // ignore: deprecated_member_use
        accentColor: darkbluishColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          // textTheme: Theme.of(context).textTheme,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        // ignore: deprecated_member_use
        buttonColor: lightbluishColor,
        // ignore: deprecated_member_use
        accentColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          // textTheme: Theme.of(context).textTheme,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      );

  //colors

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkbluishColor = Color(0xff403b58);
  static Color lightbluishColor = Vx.indigo500;
  static Color darkcreamColor = Vx.gray900;
}
