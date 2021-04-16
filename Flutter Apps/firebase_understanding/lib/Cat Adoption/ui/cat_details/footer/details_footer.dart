import 'package:firebase_understanding/Cat%20Adoption/modal/cat.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui/cat_details/footer/showCasePictures.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui/cat_details/footer/showCase_cattributes.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui/cat_details/footer/showCase_details.dart';
import 'package:flutter/material.dart';

class CatShowcase extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  const CatShowcase({Key key, this.cat, this.avatarTag}) : super(key: key);
  @override
  _CatShowcaseState createState() => _CatShowcaseState();
}

class _CatShowcaseState extends State<CatShowcase> with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      new Tab(text: 'Pictures'),
      new Tab(text: 'Details'),
      new Tab(text: 'Cattributes')
    ];
    _pages =[
      new PictureShowCase(widget.cat),
      new DetailsShowCase(widget.cat),
      new CattributeShowCase(widget.cat)
    ];

    _controller = new TabController(length: _tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16.0),
    child: new Column(
      children: [
        new TabBar(controller: _controller,
        tabs: _tabs,
        indicatorColor: Colors.white,
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(300.0),
          child: new TabBarView(
            controller: _controller,
            children: _pages,
          ),
        )
      ],
    ),
    );

  }
}

