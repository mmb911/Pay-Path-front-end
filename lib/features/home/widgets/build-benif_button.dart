import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/widgets/height_space.dart';

Widget buildBeneficiaryButton(
    {required IconData icon, required label, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: heightValue30,
                foregroundColor: primaryAppColor,
                backgroundColor: Colors.white,
                child: Icon(icon, size: 40.0)
            ),
            HeightSpace(heightValue10),
            Text(label)
          ],
        ),
      ),
    ),
  );
}