import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_logger/util/media_tile.dart';
import 'package:music_logger/util/utils.dart';

List<MediaTile> mediaList = [];

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
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
          childAspectRatio: 10 / 2,
          children: mediaList,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showDialog<void>(
                context: context,
                builder: (context) {
                  return PopupDialog();
                });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.purpleAccent[0],
        ));
  }
}

class PopupDialog extends StatefulWidget {
  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  Uint8List? _image;
  final _formKey = GlobalKey<FormState>();
  TextEditingController songTitleEditingController = TextEditingController();
  TextEditingController artistNameEditingController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: songTitleEditingController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.music_note),
                          labelText: 'Song Title *',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter song title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: artistNameEditingController,

                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Artist Name *',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter artist name';
                          }
                          return null;
                        },
                      ),
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: GestureDetector(
                                    onTap: selectImage,
                                    child: Image(
                                      height: 150,
                                      fit: BoxFit.contain,
                                      image: MemoryImage(_image!),
                                      
                                    ),
                                  ))
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: GestureDetector(
                                    onTap: selectImage,
                                    child: Image(
                                      height: 150,
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1BhBgvAdx2cQwiyvb-89VbGVzgQbB983tfw&s'),
                                    ),
                                  ),
                                ),
                        ),
                      ])
                    ],
                  )),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                    mediaList.add(MediaTile(songName: songTitleEditingController.text, artist: artistNameEditingController.text, imageSrc: _image));
                    Navigator.of(context).pop();  
                    });
                    
                  }
                },
                child: Text("Done"))
          ],
        ),
      ],
    );
  }
}
