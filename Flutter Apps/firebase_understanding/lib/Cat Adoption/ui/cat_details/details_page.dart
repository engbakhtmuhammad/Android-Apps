import 'package:firebase_understanding/Cat%20Adoption/modal/cat.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui/cat_details/details_body.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui/cat_details/footer/details_footer.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui/cat_details/header/details_header.dart';
import 'package:flutter/material.dart';

class CatDetailsPage extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  const CatDetailsPage({Key key, this.cat, this.avatarTag}) : super(key: key);
  @override
  _CatDetailsPageState createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {

    var linearGradient = new BoxDecoration(
      gradient: new LinearGradient(begin: FractionalOffset.centerRight,
      end: FractionalOffset.bottomLeft,
        colors: [
          Colors.blue.shade200,
          Colors.pinkAccent.shade400
        ]
      )
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new CatDetailsHeader(
                cat:widget.cat,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
              child: new CatDetailsBody(cat: widget.cat),
              ),
              new CatShowcase(cat: widget.cat,
              avatarTag: widget.avatarTag,
              )
            ],
          ),
        ),
      ),
    );
  }
}
