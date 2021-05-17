import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: App(),
      title: "My Application",
    )
  );
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Colors.redAccent,
      ),

      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text("Hello There User",style: TextStyle(
          color: Colors.blue,
          fontSize: 27.0,
          letterSpacing: 2
        ),),
      ),
    );
  }
}


