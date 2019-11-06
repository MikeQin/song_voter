import 'package:flutter/material.dart';
import 'package:song_voter/models/song.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final songs = <Song>[
      Song(title: 'Waltz in Tennessee'.toUpperCase(), vote: 0),
      Song(title: 'Foxtrot Blue'.toUpperCase(), vote: 2)
    ];

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
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  itemCount: songs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final song = songs[index];
                    return GestureDetector(
                      onTap: () {
                        print('tapped...');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            song.title,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 24.0,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            '${song.vote}',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 24.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
