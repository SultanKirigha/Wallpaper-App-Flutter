import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;



  SearchBar({required this.controller, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.black,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              errorText: errorText,
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10)
            ),
          ),
        ),
      ),
    );
  }
}
