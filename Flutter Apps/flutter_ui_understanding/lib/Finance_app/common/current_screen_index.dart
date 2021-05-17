import 'package:flutter/material.dart';
import 'package:flutter_ui_understanding/Finance_app/card_screen.dart';
import 'package:flutter_ui_understanding/Finance_app/home_page_screen.dart';

class CurrentScreenIndex extends StatelessWidget {
  final int index;

  CurrentScreenIndex(
      this.index,
      );

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        {
          return HomePageScreen();
        }
        break;
      case 2:
        {
          return CardScreen();
        }
        break;
      case 3:
        {
          return CardScreen();
        }
        break;
      default:
        {
          return HomePageScreen();
        }
        break;
    }
  }
}