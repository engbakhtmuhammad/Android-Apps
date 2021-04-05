import 'package:face_mask_app/cameraMask.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: CameraMask(),
      title: Text("Face Mask App", style: TextStyle(
          fontSize: 35,
          color: Colors.deepPurpleAccent,
          fontFamily: "Signatra",
      ),),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "From Programmer Sanket",
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 16,
          fontFamily: "Brand Bold"
        ),
      ),
    );
  }
}
