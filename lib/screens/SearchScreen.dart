import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/components/SearchBar.dart';
import 'package:wallpaperapp/components/wallpaperGrid.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/models/wallpapers.dart';
import 'package:wallpaperapp/screens/searchWallpapersScreen.dart';


class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
   final TextEditingController textEditingController = TextEditingController();
   bool _validate = false;
   bool _isLoading = false;
  List<WallpaperModel> wallpapers = [];
  //API starts here
  Future getData() async {
    try{
      setState(() {
        _isLoading = true;
      });
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
    finally{
      setState(() {
        _isLoading = false;
      });
    }

  }
  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true ? Center(
        child: SpinKitWave(
          color: Colors.pink,
          size: 50.0,
        ),
      ) : Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
                  child: Row(
                    children: [
                      SearchBar(
                        controller: textEditingController,
                        errorText:
                        _validate==true?'Field Can\'t Be Empty':'',
                      ),
                      SizedBox(width: 6,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 46,
                        child: ElevatedButton(
                          onPressed: (){
                            if(textEditingController.text.isEmpty){
                              setState(() {
                                _validate = true;
                              });
                            }
                            else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SearchWallpapersScreen(
                                          searchQuery: textEditingController.text),),);
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (ctx) => SearchWallpapersScreen(searchQuery: textEditingController.text,)));
                          },
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
