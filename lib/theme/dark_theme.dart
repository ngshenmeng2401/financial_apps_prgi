import 'package:flutter/material.dart';

class CustomDarkTheme{
  static ThemeData get darktheme{

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      shadowColor: Colors.grey[600],
      focusColor: Colors.blue[100],
      fontFamily: 'Arial',
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.blueGrey[400], 
        cursorColor: Colors.blueGrey[300],
        selectionColor: Colors.blue[200] 
      ),
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.red[200],
        focusColor: Colors.blue[200],
        labelStyle: const TextStyle(color: Colors.white60),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[200]!)
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 32.0),
        headline6: TextStyle(fontSize: 18.0),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.blue[200],
        unselectedItemColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      cardColor: Colors.grey[900],
      dividerTheme: const DividerThemeData(
        color: Colors.white
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      dataTableTheme: DataTableThemeData(
        dataTextStyle: const TextStyle(
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white
          )
        )
      ),
    );
  }
}