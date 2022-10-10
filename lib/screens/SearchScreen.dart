import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/components/SearchBar.dart';
import 'package:wallpaperapp/components/wallpaperGrid.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/models/wallpapers.dart';


class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<WallpaperModel> wallpapers = [];
  //API starts here
  Future getData() async {
    try{
      final url = Uri.parse(
          'https://api.unsplash.com/photos/?client_id=tbPljhm_jt755Rvr5DGSnkrEoYpnrJp8spzmHWFZsJI');

      var response = await http.get(url);

      List<dynamic> jsonData = jsonDecode(response.body);
      jsonData.forEach((data) {
        setState(() {
          WallpaperModel wallpaperModel = WallpaperModel.fromMap(data);
          wallpaperModel = WallpaperModel.fromMap(data);
          wallpapers.add(wallpaperModel);

        });
      });
    }
    catch(error){
      print(error);
    }

  }
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
                  child: Row(
                    children: [
                      SearchBar(),
                      SizedBox(width: 6,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 46,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Icon(Icons.search),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen
                          ),
                        ),),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: WallpaperGrid(wallpapers: wallpapers,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
