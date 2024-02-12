import 'package:flutter/cupertino.dart';
import 'package:module_14_assignment/photo_album_app.dart';

void main(){
  return runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhotoAlbumApp();
  }
}

