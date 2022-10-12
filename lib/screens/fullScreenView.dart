import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/wallpapers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';


class FullScreenView extends StatefulWidget {
  final String imageurl;
  final String id;


  FullScreenView({required this.id, required this.imageurl});

  @override
  _FullScreenViewState createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView> {
  bool _isLoading = false;
  List<WallpaperModel> wallpapers = [];
  Future getData() async{
    try {
      setState(() {
        _isLoading = true;
      });
    }
    finally{
      setState(() {
        _isLoading = false;
      });
    }
  }
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
  _saveImage() async{
    _requestPermission();
    var response = await Dio().get(widget.imageurl,
        options: Options(responseType: ResponseType.bytes));
    final result =await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      name: DateTime.now().toString());
      print(result);
  }

  _requestPermission() async{
    Map<Permission, PermissionStatus> statuses = await[
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true ? Center(
        child: SpinKitWave(
          color: Colors.pink,
          size: 50.0,
        ),
      ) : SafeArea(
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
              bottom: 20,
                left: 60,
                right: 60,

                child:ElevatedButton.icon(
                  onPressed: _saveImage,
                  label: const Text('Download', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                  ),
                  icon: const Icon(Icons.download),
                )
            )
          ],
        ),
      ),
    );
  }
}

