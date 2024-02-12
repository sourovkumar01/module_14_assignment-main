import 'package:flutter/material.dart';
import 'package:module_14_assignment/Screens/photo_list_screen.dart';

class PhotoAlbumApp extends StatelessWidget {
  const PhotoAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'PhotoAlbumApp',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
        ),
      ),
      home: PhotoListScreen(),
    );
  }
}
