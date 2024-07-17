import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MediaTile extends StatelessWidget {
  final String songName;
  final String artist;
  final Uint8List? imageSrc;


  MediaTile({
    super.key,
    required this.songName,
    required this.artist,
    this.imageSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(7)
          ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: imageSrc != null
                    ? Image.memory(
                        imageSrc!,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1BhBgvAdx2cQwiyvb-89VbGVzgQbB983tfw&s',
                        fit: BoxFit.cover,
                      ),

              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  songName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                Text(artist)
              ],
            )
          ],
          ),
      ),
      );
  }
}