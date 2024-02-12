class PhotoAlbumModel {
  int? albumId;
  int? id;
  String? title;
  String? imageUrl;
  String? thumbnailUrl;

  PhotoAlbumModel(
      {this.albumId, this.id, this.title, this.imageUrl, this.thumbnailUrl});

  PhotoAlbumModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    imageUrl = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

}
