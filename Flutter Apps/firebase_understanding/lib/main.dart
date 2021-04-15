import 'package:firebase_understanding/Board_app/ui/board_app.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.pinkAccent,
          fontFamily: 'Ubuntu'
        ),
          home: CatList(),
      )
  );
}
