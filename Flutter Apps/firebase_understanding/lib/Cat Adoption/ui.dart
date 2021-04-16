import 'package:firebase_understanding/Cat%20Adoption/Services/api.dart';
import 'package:firebase_understanding/Cat%20Adoption/modal/cat.dart';
import 'package:firebase_understanding/Cat%20Adoption/ui/cat_details/details_page.dart';
import 'package:firebase_understanding/Cat%20Adoption/utils/routes.dart';
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
    String fileData = await DefaultAssetBundle.of(context).loadString("assests/cats.json");
    for(Cat cat in CatApi.allCatsFromJson(fileData)){
      _cats.add(cat);
    }
    print(_cats.toString());
    setState(() {
      _cats = CatApi.allCatsFromJson(fileData);
    });
  }

  _navigateToCatDetails(Cat cat,Object avatarTag){
    Navigator.of(context).push(
      new FadePageRoute(builder: (c){
        return new CatDetailsPage(cat:cat,avatarTag: avatarTag,);
      }, settings: new RouteSettings())
    );
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

  Future<Null> refresh(){
    _loadCats();
    return new Future<Null>.value();
  }

  Widget _buildCatItem(BuildContext context,int index){
    Cat cat = _cats[index];
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            new ListTile(
              leading: Hero(
                tag: index,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(cat.avatarUrl),
                ),
              ),
              title: new Text(
                cat.name,
                style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black54),

              ),
              subtitle: Text(cat.description),
              isThreeLine: true,
              dense: false,
              onTap: () => _navigateToCatDetails(cat, index),
            )
          ],

        ),
      ),
    );
  }

  Widget _getListViewWidget(){
    return new Flexible(
        child: new RefreshIndicator(
            child: new ListView.builder(physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _cats.length,
                itemBuilder: _buildCatItem
            ), onRefresh: refresh)
    );
  }

  Widget _buildBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        children: [
          _getListViewWidget()
        ],
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
      body: _buildBody(),
    );
  }
}
