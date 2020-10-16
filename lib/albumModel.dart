import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Album> allalbumsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Album>.from(jsonData.map((x) => Album.fromJson(x)));
} //ef

class AlbumList {
  final List<Album> albums;

  AlbumList({
    this.albums,
  });

  factory AlbumList.fromJson(List<dynamic> parsedJson) {
    List<Album> albums = List<Album>();
    albums = parsedJson.map((i) => Album.fromJson(i)).toList();

    return AlbumList(albums: albums);
  }
} //ef

class Album with ChangeNotifier {
  int userId;
  int id;
  String title;

  Album({this.userId, this.id, this.title});

  Album.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }
  notifyListeners();
} //ef

Album albumFromJson(String str) {
  final jsonData = json.decode(str);
  return Album.fromJson(jsonData);
} //ef
