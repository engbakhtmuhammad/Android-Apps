import 'package:firebase_understanding/Cat%20Adoption/Services/api.dart';
import 'package:firebase_understanding/Cat%20Adoption/modal/cat.dart';
import 'package:flutter/material.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {

  List<Cat> _cats = [];


  @override
  void initState(){
    super.initState();
    _loadCats();
  }

  _loadCats() async{
    String fileData = await DefaultAssetBundle.of(context).loadString("assests/cat.json");
    for(Cat cat in CatApi.allCatsFromJson(fileData)){
      _cats.add(cat);
    }
    print(_cats.toString());
  }

  Widget _getAppTitleWidget(){

    return new Text(
      'Cats',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.0
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade200,
         appBar: AppBar(
           title: _getAppTitleWidget(),
         ),
    );
  }
}
