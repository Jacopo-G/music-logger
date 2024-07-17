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
      body: ListView(
        children: [
          MediaTile(),
          MediaTile()
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent[0],
      )
    );
  }
}