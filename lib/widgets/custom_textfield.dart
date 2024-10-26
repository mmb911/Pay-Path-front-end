import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';


class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextEditingController controller;
  final Widget? icon;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final String? errorText;
  final void Function(String)? onChanged;
  final String? successMessage;
  final Icon? prefixIcon;
  final bool willContainPrefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    this.labelText = "",
    required this.hintText,
    required this.controller,
    this.icon,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.name,
    this.validator,
    this.errorText,
    this.onChanged,
    this.successMessage,
    this.prefixIcon,
    this.willContainPrefix = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText!,
          style: TextStyle(
            fontSize: heightValue15,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        TextFormField(
          autofocus: true,
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          inputFormatters: inputFormatters,
          style: TextStyle(fontSize: heightValue20),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(heightValue15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(heightValue15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: primaryAppColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(heightValue15),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xFFC0C0C0),
                fontSize: 15
            ),
            suffixIcon: icon,
            errorText: errorText,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: platinium,
            contentPadding: EdgeInsets.all(heightValue20),
          ),
          maxLines: 1,
          validator: validator,
          onChanged: onChanged,
        ),
        Text(
          successMessage ?? "",
          style: const TextStyle(color: Colors.green),
        )
      ],
    );
  }
}
