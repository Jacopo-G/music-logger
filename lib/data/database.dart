import 'package:hive/hive.dart';
import 'package:music_logger/util/media_tile.dart';

class MusicHistoryDatabase {
  final _dataBox = Hive.box('storage');
  List<MediaTile> mediaList = [];
  List<List<dynamic>> mediaListPrimitive = [];

  void loadData() {
  mediaList = [];
  mediaListPrimitive = [];
  mediaListPrimitive = (_dataBox.get("MEDIAHISTORYLIST") as List<dynamic>?)?.cast<List<dynamic>>() ?? [];
  
  for (var tile in mediaListPrimitive) {
    mediaList.add(MediaTile(songName: tile[0], artist: tile[1], imageSrc: tile[2]));
  }
}

  void updateData() {
    mediaListPrimitive = [];
    for (var tile in mediaList) {
       mediaListPrimitive.add([tile.songName, tile.artist, tile.imageSrc]);
    }
    _dataBox.put("MEDIAHISTORYLIST", mediaListPrimitive);
  }
}