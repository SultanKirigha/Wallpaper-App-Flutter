class WallpaperModel {
  String id;
  UrlModels urlModels;

  WallpaperModel({required this.id, required this.urlModels});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallpaperModel(
        id: jsonData['id'],
        urlModels: UrlModels.fromMap(jsonData['urls']));
  }
}

class UrlModels{
  String regular;
  UrlModels({required this.regular});

  factory UrlModels.fromMap(Map<String,dynamic> jsonData){
    return UrlModels(regular: jsonData['regular']);
  }
}