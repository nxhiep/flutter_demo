import 'package:flutter/material.dart';
import 'package:flutter_demo/models/photo.dart';
import 'package:flutter_demo/repositories/repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    List<Photo> _photos = [];

    @override
    void initState() {
        super.initState();
        Repositories.getPhotos().then((photos) {
            setState(() {
                _photos = photos;
            });
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Home"),
            ),
            body: _photos.isNotEmpty ? _makePhotos(_photos) : const Center(
                child: Text("Loading..."),
            ),
        );
    }

    Widget _makePhotos(List<Photo> _photos) {

        return ListView.builder(
            itemCount: _photos.length,
            itemBuilder: (context, index) {
                return ListTile(
                    leading: Text(_photos[index].id.toString()),
                    title: Text(_photos[index].title),
                );
            },
        );
    }
}