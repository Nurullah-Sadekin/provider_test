import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider_test/Service/service.dart';
import 'package:provider_test/albumModel.dart';

// class MyStore extends ChangeNotifier {
//   List<Album> _albums = [];
//   List<Album> _busket = [];
//   Album _activeAlbum = null;

//   List<Album> get albums => _albums;
//   List<Album> get buskets => _busket;
//   Album get activeAlbum => _activeAlbum;
// }
class Albums with ChangeNotifier {
  List<Album> _items = [];
  int id;

  Albums(this._items);

  List<Album> get items {
    return [..._items];
  }

  Album findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  MyStore() {
    getAllAlbum().then((value) {
      var _items = value;
      print(_items);
    });
  }
}
