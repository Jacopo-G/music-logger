import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_logger/util/media_tile.dart';
import 'package:music_logger/util/utils.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
    setState(() {});
  }

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
        onPressed: () async {
              await showDialog<void>(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Container(
                      height: 300,
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.music_note),
                                labelText: 'Song Title',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                labelText: 'Artist Name',
                              ),
                            ),
                            Stack(
                              children: [
                                Padding(
                                padding: const EdgeInsets.all(10),
                                child: 
                                _image != null ?
                                  Image(image: MemoryImage(_image!),)
                                :
                                  const Image(
                                    height: 150,
                                    fit: BoxFit.contain,
                                    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1BhBgvAdx2cQwiyvb-89VbGVzgQbB983tfw&s'),
                                  ),
                              ),
                              Positioned(
                                child: IconButton(
                                  onPressed: selectImage, icon: Icon(Icons.add_a_photo),
                                  ),
                                  bottom: -15,
                                  left: 135,
                                )
                              ]
                            )
                        ],
                        )
                        ),
                    ),
                      actions: [
                        TextButton(onPressed: (){
                          _image = null;
                          Navigator.of(context).pop();
                          },
                          child: Text("Okay"))
                      ],
                  );
                }
              );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent[0],
      )
    );
  }
}