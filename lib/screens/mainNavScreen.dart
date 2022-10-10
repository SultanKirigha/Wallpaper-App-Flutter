import 'package:flutter/material.dart';
import 'package:wallpaperapp/screens/categoriesGridScreen.dart';

import 'SearchScreen.dart';
import 'categoriesGridScreen.dart';

class MainNavScreen extends StatefulWidget {

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {

  static int _seletedIndex = 0;
  static List<Widget> _screens = <Widget>[
    SearchScreen(),
    CategoriesGridScreen()
  ];

  onTapScreen(int i){
    setState(() {
      _seletedIndex = i;
    });
  }

  @override
  void dispose(){
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens.elementAt(_seletedIndex),
          Positioned(
            bottom: 15,
             left: 50,
              right: 50,
              child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                currentIndex: _seletedIndex,
                onTap: onTapScreen,

                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category),label: 'categories',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),label: 'search',
                  ),
                ],
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
