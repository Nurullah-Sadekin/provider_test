import 'package:provider_test/albumModel.dart';
import 'package:http/http.dart' as http;

final url = ('https://jsonplaceholder.typicode.com/albums');

Future<List<Album>> getAllAlbum() async {
  final response = await http.get(url);
  // print(response.body);
  return allalbumsFromJson(response.body);
}

Future<Album> getAlbum() async {
  final response = await http.get('$url/1');
  return albumFromJson(response.body);
}
