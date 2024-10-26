import 'package:flutter/material.dart';

Widget buildFeatureButton(String imagePath,String text, VoidCallback onPress) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8.0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:CrossAxisAlignment.center ,
      children: [
        IconButton(
          icon: Image.asset(imagePath),
          onPressed: () {
            onPress;
            },
        ),
        Center(child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold))),
      ],
    ),

  );
}
