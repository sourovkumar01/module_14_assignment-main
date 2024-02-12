import 'package:flutter/material.dart';
import 'package:module_14_assignment/ModelClass/photo_album_model.dart';

class PhotoDetailsScreen extends StatelessWidget {
  const PhotoDetailsScreen({super.key, required this.photoAlbum});

  final PhotoAlbumModel photoAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 40, bottom: 20),
                child: Image.network(
                 photoAlbum.imageUrl.toString(),
                  loadingBuilder: (context, child, loadingProgress){
                    if(loadingProgress==null) {
                      return child;
                    } else {
                      return const Center(
                      child: CircularProgressIndicator(),
                    );
                    }
                  }
                )),
            const SizedBox(
              height: 12,
            ),
            Wrap(children: [
              Text('Title : ${photoAlbum.title.toString()}'),
            ]),
            const SizedBox(
              height: 12,
            ),
            Text('ID: ${photoAlbum.id.toString()}'),
            const SizedBox(
              height: 12,
            ),
            Text('Album ID: ${photoAlbum.albumId.toString()}'),
          ],
        ),
      ),
    );
  }
}
