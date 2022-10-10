import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/components/wallpaperGrid.dart';
import '../models/wallpapers.dart';

class CategoriesWallpapersScreen extends StatefulWidget {
  final String collectionId;
  CategoriesWallpapersScreen({required this.collectionId});
  @override
  _CategoriesWallpapersScreenState createState() =>
      _CategoriesWallpapersScreenState();
}

class _CategoriesWallpapersScreenState
    extends State<CategoriesWallpapersScreen> {


  List<WallpaperModel> wallpapers = [];

  Future getCollectionData(String collectionId) async {
    try {
      final url = Uri.parse(
          'http://api.unsplash.com/collections/$collectionId/photos/?client_id=tbPljhm_jt755Rvr5DGSnkrEoYpnrJp8spzmHWFZsJI');

      var response = await http.get(url);
      List<dynamic> collectionData = jsonDecode(response.body);
      collectionData.forEach((colData) {
        setState(() {
          WallpaperModel wallpaperModel = WallpaperModel.fromMap(colData);
          wallpaperModel = WallpaperModel.fromMap(colData);
          wallpapers.add(wallpaperModel);
        });
      });
    }
    catch (err) {
      print(err);
    }
  }


  @override
  void initState() {
    getCollectionData(widget.collectionId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: WallpaperGrid(wallpapers: wallpapers,),
          ),
        ),
          Positioned(
              top: 40,
              left: 20,
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
                ),
              ))
    ],
      ),
    );
  }
}
