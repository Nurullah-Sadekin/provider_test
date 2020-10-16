import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Page/ProductDetailsPage.dart';
import 'package:provider_test/Store/albums.dart';
import 'package:provider_test/albumModel.dart';
import 'package:provider_test/Service/service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getAllAlbum();
    return Scaffold(
        body: FutureBuilder<List<Album>>(
            future: getAllAlbum(),
            builder: (context, snapshot) {
              {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  var data = snapshot.data;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Card(
                            elevation: 10,
                            child: ListTile(
                              leading: Text(data[index].title),
                              trailing: Text(
                                data[index].id.toString(),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AlbumDetails()),
                              ),
                            ),
                          ));
                } else
                  return CircularProgressIndicator();
              }
            }));
  }
}
