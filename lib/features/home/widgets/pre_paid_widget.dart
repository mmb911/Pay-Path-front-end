import 'package:flutter/material.dart';

Widget PrePaidCard(String title, IconData trailingIcon, IconData leadingIcon) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4.0),
    child: ListTile(
      leading: Icon(leadingIcon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: Icon(trailingIcon, color: Colors.blue),
      onTap: () {
        // Handle item tap
      },
    ),
  );
}