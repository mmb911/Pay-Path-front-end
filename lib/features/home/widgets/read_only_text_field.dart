
import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';

class ReadOnlyTextField extends StatelessWidget {
  final String value;
  final String label;

  const ReadOnlyTextField({super.key,
    required this.value,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: const TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w700
          ),
        ),
        const SizedBox(height: 6.0,),
        Container(
          padding: const EdgeInsets.all(14.0),
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}