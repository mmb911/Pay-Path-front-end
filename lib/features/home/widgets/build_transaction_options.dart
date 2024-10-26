import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';

Widget buildTransactionOption(
    {required IconData icon,
      required String text,
      required bool isSelected,
      required VoidCallback onTap

    }) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: 
        BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? primaryAppColor : Colors.grey,
        ),
        height: 85,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 40.0,
                color:  Colors.white,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.0,
                  color:   Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

