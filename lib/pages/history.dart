import 'package:flutter/material.dart';
import 'package:music_logger/util/media_tile.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    //remove debug flag
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.deepPurple[900],
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 8/2,
        children: [
          MediaTile(
            songName: "Purple Haze",
            artist: "Jimi Hendrix",
            imageSrc: "lib/assets/test_images/hendrix.webp"),
            MediaTile(
            songName: "Purple Haze",
            artist: "Jimi Hendrix",
            imageSrc: "lib/assets/test_images/hendrix.webp"),
            MediaTile(
            songName: "Purple Haze",
            artist: "Jimi Hendrix",
            imageSrc: "lib/assets/test_images/hendrix.webp"),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        //TODO Add Popup for adding song
        onPressed: () async {
              await showDialog<void>(
                context: context,
                builder: 
              )
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent[0],
      )
    );
  }
}