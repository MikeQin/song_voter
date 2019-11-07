import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('Song Voter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Vote Favorite Songs',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: Firestore.instance.collection('songs').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text('Loading...');
                      }

                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot song =
                              snapshot.data.documents[index];
                          return GestureDetector(
                            onTap: () {
                              // song.reference
                              //     .updateData({'votes': song['votes'] + 1});
                              Firestore.instance
                                  .runTransaction((transaction) async {
                                DocumentSnapshot freshSnap =
                                    await transaction.get(song.reference);
                                await transaction.update(freshSnap.reference, {
                                  'votes': freshSnap['votes'] + 1,
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  song['title'],
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Container(
                                  color: Colors.black12,
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                  child: Text(
                                    '${song['votes']}',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
