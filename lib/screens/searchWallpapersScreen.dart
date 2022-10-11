import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/components/wallpaperGrid.dart';
import 'package:wallpaperapp/models/wallpapers.dart';
class SearchWallpapersScreen extends StatefulWidget {
  final String searchQuery;
  SearchWallpapersScreen({required this.searchQuery});
  @override
  State<SearchWallpapersScreen> createState() => _SearchWallpapersScreenState();
}

class _SearchWallpapersScreenState
    extends State<SearchWallpapersScreen> {
  bool _isLoading = false;
  List<WallpaperModel> wallpapers = [];
 Future getSearchWallpapers(String query) async{
   try{

     setState(() {
       _isLoading = true;
     });
     final url = Uri.parse('https://api.unsplash.com/search/photos?page=1&query=$query&client_id=tbPljhm_jt755Rvr5DGSnkrEoYpnrJp8spzmHWFZsJI');
     var response = await http.get(url);

     Map<String,dynamic> jsonData = jsonDecode(response.body);
     jsonData['results'].forEach((data){
       setState(() {
         WallpaperModel wallpaperModel = WallpaperModel.fromMap(data);
         wallpaperModel= WallpaperModel.fromMap(data);
         wallpapers.add(wallpaperModel);
       });
     });
   } finally{
     setState(() {
       _isLoading = false;
     });
   }
 }

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true ? Center(child: SpinKitWave(color:Colors.pink, size: 50.0),):Stack(
        children:[SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(10),
                child: WallpaperGrid(wallpapers: wallpapers,),
              ),
            ],
          ),
        ),
          Positioned(
              top: 35,
              left: 10,
              child: new CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
              )
          )
        ],
      ),
    );
  }
}
