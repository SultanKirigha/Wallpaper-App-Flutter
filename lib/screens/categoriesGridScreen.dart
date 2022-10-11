import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/categories.dart';
import 'package:wallpaperapp/screens/categorieswallpaperScreen.dart';

class CategoriesGridScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: Categories.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ), itemBuilder:(ctx,i){
          return CategoryTile(
            imageUrl: Categories.categories[i].imageUrl,
            title: Categories.categories[i].title,
            collectionId: Categories.categories[i].collectionId,
          );
        }),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String collectionId;
  final String title;

  CategoryTile({required this.collectionId,required this.imageUrl, required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CategoriesWallpapersScreen(collectionId: collectionId,) ));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Image.network(imageUrl,fit: BoxFit.cover,),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black
                ],
                stops: [
                  0.0,
                  1
                ]
              )
            ),
          ),
          Center(child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),)
        ],
      ),
    );
  }
}

