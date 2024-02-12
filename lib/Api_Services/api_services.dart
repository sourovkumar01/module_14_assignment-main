import 'dart:convert';
import 'package:http/http.dart';
import 'package:module_14_assignment/ModelClass/photo_album_model.dart';
class ApiServices{
  Future<List<PhotoAlbumModel>> getPhotosList()async{
    String url = 'https://jsonplaceholder.typicode.com/photos';
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    if(response.statusCode==200)
      {
        List<PhotoAlbumModel> photoAlbumList =[];
        for(Map<String,dynamic>photoDetails in jsonDecode(response.body) ){
          photoAlbumList.add(PhotoAlbumModel.fromJson(photoDetails));
        }
        return photoAlbumList;
      }
    else
      {
        return throw Exception('Error');
      }
}
}