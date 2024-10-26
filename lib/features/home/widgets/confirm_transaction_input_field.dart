import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/widgets/border_painter.dart';

Widget ConfirmTransactionInputField({required String label,
  required String hintText,
  required final TextEditingController controller,
  final inputFormatters,
  final TextInputType? keyboardType,
  final String? errorText
}) {
  return SizedBox(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w700
          ), // Label style
        ),
        const SizedBox(height: 6.0),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            errorText: errorText,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey,
              fontWeight: FontWeight.normal
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1.0
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                  color: Colors.white
                  , width: 1.0
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const  BorderSide(
                  color: Colors.blue,
                  width: 1.0
              ),
            ),
          ),
        ),
      ],
    ),
  );
}