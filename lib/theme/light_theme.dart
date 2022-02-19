import 'package:flutter/material.dart';


class CustomLightTheme{

  static ThemeData get lighttheme{

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      shadowColor: Colors.grey[400],
      focusColor: Colors.blue[200],
      fontFamily: 'Arial',
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.blueGrey[300], 
        cursorColor: Colors.blueGrey[300],
        selectionColor: Colors.blue[200],
      ),
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.red[200],
        focusColor: Colors.blue[200],
        labelStyle: TextStyle(color: Colors.red[300]),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[200]!)
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 32.0),
        headline6: TextStyle(fontSize: 18.0),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[350],
        selectedItemColor: Colors.blue[200],
        unselectedItemColor: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      cardColor: Colors.grey[200],
      dividerTheme: const DividerThemeData(
        color: Colors.blue,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      dataTableTheme: DataTableThemeData(
        dataTextStyle: const TextStyle(
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black
          )
        )
      ),
      
    );
  }
}