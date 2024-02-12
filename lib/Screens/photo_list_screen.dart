import 'dart:async';
import 'package:flutter/material.dart';
import 'package:module_14_assignment/Api_Services/api_services.dart';
import 'package:module_14_assignment/Screens/photoDetailsScreen.dart';
import 'package:module_14_assignment/ModelClass/photo_album_model.dart';

class PhotoListScreen extends StatelessWidget {
  PhotoListScreen({super.key});

  final ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: FutureBuilder(
        future: apiServices.getPhotosList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PhotoAlbumModel>? photoAlbumList = snapshot.data;
            return ItemList(photoAlbumList: photoAlbumList);
          } else if (snapshot.hasError is TimeoutException) {
            return const Center(
              child: Text(
                  'Connection timeout. Please check your internet connection'),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('SomeThing Wrong'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.photoAlbumList});

  final List<PhotoAlbumModel>? photoAlbumList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.separated(
          itemBuilder: (context, index) =>
              PhotoAlbum(photoAlbumList: photoAlbumList![index]),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: photoAlbumList!.length),
    );
  }
}

class PhotoAlbum extends StatelessWidget {
  const PhotoAlbum({super.key, required this.photoAlbumList});

  final PhotoAlbumModel photoAlbumList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoDetailsScreen(photoAlbum: photoAlbumList),
        ),
      ),
      child: ListTile(
        title: Text('${photoAlbumList.title}'),
        leading: SizedBox(
          height: 60,width: 60,
          child: Image.network(
            photoAlbumList.thumbnailUrl ?? '',
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress==null) return child;
              return const Center(child:CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }
}
