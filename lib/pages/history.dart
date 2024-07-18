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
  List<MediaTile> mediaList = [];

  void addMediaTile(MediaTile tile) {
    setState(() {
      mediaList.add(tile);
    });
  }

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
      body: mediaList.isEmpty
          ? Center(
              child:
                  Text('No items yet', style: TextStyle(color: Colors.white)))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 10 / 2,
              ),
              itemCount: mediaList.length,
              itemBuilder: (context, index) => mediaList.reversed.toList()[index],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog<void>(
            context: context,
            builder: (context) {
              return PopupDialog(onAdd: addMediaTile);
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent[0],
      ),
    );
  }
}

class PopupDialog extends StatefulWidget {
  final Function(MediaTile) onAdd;

  PopupDialog({required this.onAdd});

  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  Uint8List? _image;
  final _formKey = GlobalKey<FormState>();
  TextEditingController songTitleEditingController = TextEditingController();
  TextEditingController artistNameEditingController = TextEditingController();

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              SizedBox(height: 10),
              GestureDetector(
                onTap: selectImage,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: _image != null
                      ? Image.memory(_image!, fit: BoxFit.cover)
                      : Icon(Icons.add_photo_alternate, size: 50),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onAdd(MediaTile(
                songName: songTitleEditingController.text,
                artist: artistNameEditingController.text,
                imageSrc: _image,
              ));
              Navigator.of(context).pop();
            }
          },
          child: Text("Done"),
        ),
      ],
    );
  }
}
