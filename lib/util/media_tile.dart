import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MediaTile extends StatelessWidget {
  final String songName;
  final String artist;
  final String imageSrc;


  MediaTile({
    super.key,
    required this.songName,
    required this.artist,
    required this.imageSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        height: 200,
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
                child: Image.asset(
                  'assets/test_images/hendrix.webp',
                  fit: BoxFit.contain,
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