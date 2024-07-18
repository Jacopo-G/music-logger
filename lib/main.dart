import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_logger/pages/history.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('storage');

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