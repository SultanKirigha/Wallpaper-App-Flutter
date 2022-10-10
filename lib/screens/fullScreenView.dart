import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/wallpapers.dart';


class FullScreenView extends StatefulWidget {
  final String imageurl;
  final String id;

  FullScreenView({required this.id, required this.imageurl});

  @override
  _FullScreenViewState createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView> {
  List<WallpaperModel> wallpapers = [];
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imageurl,fit: BoxFit.cover,),
            ),
            Positioned(
              top: 10,
                left: 20,
                child:new CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.4),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
    },

                  ),
                ),
            ),
            Positioned(
              bottom: 15,
                left: 10,
                right: 10,

                child:ElevatedButton(
                  onPressed: (){},
                  child: Text('Download', style: TextStyle(color: Colors.black))
                  ,)
            )
          ],
        ),
      ),
    );
  }
}

