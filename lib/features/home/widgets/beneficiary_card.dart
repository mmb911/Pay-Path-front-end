import 'package:flutter/material.dart';

Widget beneficiaryCard( {required String benefName, required String cardOraccountNum} ) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: const Text(""),
      ),
      title:  Text(benefName,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle:  Text(cardOraccountNum),
    ),
  );
}