import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaperapp/screens/SearchScreen.dart';
import 'package:wallpaperapp/screens/categoriesGridScreen.dart';
import 'package:wallpaperapp/screens/mainNavScreen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.hippieBlue),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.hippieBlue,
        darkIsTrueBlack: true,
      ),
      home: MainNavScreen(),
    );
  }
}