import 'package:flutter/material.dart';
import 'package:music_logger/pages/history.dart';

void main() {
  runApp(musicLogger());
}

class musicLogger extends StatelessWidget {
  const musicLogger({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Logger',
      home: History(),
      routes: {
        "/history": (context) => History(),
      },
    );
  }
}