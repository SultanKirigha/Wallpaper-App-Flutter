import 'package:flutter/material.dart';

import '../models/wallpapers.dart';

class WallpaperGrid extends StatelessWidget {
  final List<WallpaperModel> wallpapers;
  WallpaperGrid({required this.wallpapers});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: wallpapers.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
      ), itemBuilder: (ctx,i){
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Image.network(
              wallpapers[i].urlModels.regular,
              fit: BoxFit.cover,),),
        );
      }),
    );
  }
}
