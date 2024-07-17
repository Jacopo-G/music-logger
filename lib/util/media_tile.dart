import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MediaTile extends StatelessWidget {
  const MediaTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(7)
          ),
          padding: EdgeInsets.all(20),
        child: Text("Test"),
      ),
      );
  }
}