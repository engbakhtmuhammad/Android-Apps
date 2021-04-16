import 'package:firebase_understanding/Cat%20Adoption/modal/cat.dart';
import 'package:flutter/material.dart';

class PictureShowCase extends StatelessWidget {
  final Cat cat;

  PictureShowCase(this.cat);
  @override
  Widget build(BuildContext context) {
    var items = <Widget> [];
    for(var i=0; i < cat.pictures.length; i++){
      var image = new Image.network(
        cat.pictures[i],
        width: 200.0,
        height: 200.0,
      );
      items.add(image);
    }

    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
    crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0
    );

    return new GridView(padding: const EdgeInsets.only(top: 16.0),
    gridDelegate: delegate,
      children: items,
    );

  }
}
