import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
        snapshot.documents[index].data["timestamp"].seconds * 1000);
    var dateFormatted = new DateFormat("EEEE, MMM d").format(timeToDate);
    //snapshot.documents[index].data["description"]
    var snapshotData = snapshot.documents[index].data;
    var docId = snapshot.documents[index].documentID;

    TextEditingController nameInputController =
        new TextEditingController(text: snapshotData['name']);
    TextEditingController titleInputController =
        new TextEditingController(text: snapshotData['title']);
    TextEditingController descriptionInputController =
        new TextEditingController(text: snapshotData['description']);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 170,
          child: Card(
            elevation: 9,
            child: Column(
              children: [
                ListTile(
                  title: Text(snapshotData['title']),
                  subtitle: Text(snapshotData["description"]),
                  leading: CircleAvatar(
                    radius: 34,
                    child: Text(snapshotData['title'][0]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("By: ${snapshotData["name"]} "),
                      Text(dateFormatted),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(
                          FontAwesomeIcons.edit,
                          size: 15,
                        ),
                        onPressed: () async {
                          await showDialog(
                              builder: (context) => AlertDialog(
                                    contentPadding: EdgeInsets.all(10),
                                    content: Column(
                                      children: [
                                        Text("Please fill out the form"),
                                        Expanded(
                                            child: TextField(
                                          autofocus: true,
                                          autocorrect: true,
                                          decoration: InputDecoration(
                                              labelText: "Your Name*"),
                                          controller: nameInputController,
                                        )),
                                        Expanded(
                                            child: TextField(
                                          autofocus: true,
                                          autocorrect: true,
                                          decoration: InputDecoration(
                                              labelText: "Title*"),
                                          controller: titleInputController,
                                        )),
                                        Expanded(
                                            child: TextField(
                                          autofocus: true,
                                          autocorrect: true,
                                          decoration: InputDecoration(
                                              labelText: "Description*"),
                                          controller:
                                              descriptionInputController,
                                        ))
                                      ],
                                    ),
                                    actions: [
                                      FlatButton(
                                        onPressed: () {
                                          nameInputController.clear();
                                          titleInputController.clear();
                                          descriptionInputController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      FlatButton(
                                          onPressed: () {
                                            if (titleInputController
                                                    .text.isNotEmpty &&
                                                nameInputController
                                                    .text.isNotEmpty &&
                                                descriptionInputController
                                                    .text.isNotEmpty) {
                                              Firestore.instance
                                                  .collection("board")
                                                  .document(docId)
                                                  .updateData({
                                                "name":
                                                    nameInputController.text,
                                                "title":
                                                    titleInputController.text,
                                                "description":
                                                    descriptionInputController
                                                        .text,
                                                "timestamp": new DateTime.now()
                                              }).then((value) {
                                                Navigator.pop(context);
                                              });
                                              //   Firestore.instance
                                              //       .collection("board")
                                              //       .add({
                                              //     "name":
                                              //         nameInputController.text,
                                              //     "title":
                                              //         titleInputController.text,
                                              //     "description":
                                              //         descriptionInputController
                                              //             .text,
                                              //     "timestamp": new DateTime.now()
                                              //   }).then((response) {
                                              //     print(response.documentID);
                                              //     Navigator.pop(context);
                                              //     nameInputController.clear();
                                              //     titleInputController.clear();
                                              //     descriptionInputController
                                              //         .clear();
                                              //   }).catchError(
                                              //           (error) => print(error));
                                            }
                                          },
                                          child: Text("Update"))
                                    ],
                                  ),
                              context: context);
                        }),
                    SizedBox(
                      height: 19,
                    ),
                    IconButton(
                        icon: Icon(
                          FontAwesomeIcons.trashAlt,
                          size: 15,
                        ),
                        onPressed: () async {
                          print(docId);
                          var CollectionReference =
                              Firestore.instance.collection("board");
                          await CollectionReference.document(docId).delete();
                        }),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
