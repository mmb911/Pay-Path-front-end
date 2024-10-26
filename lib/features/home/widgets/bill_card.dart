import 'package:flutter/material.dart';

Widget billCard(String title, String subtitle, String image) {
  return SizedBox(
    height: 120,
    child: Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 150,
          child:  Center(child: Image.asset(image)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    ),
  );
}
