import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/widgets/border_painter.dart';


class NumberDialPad extends StatelessWidget {
  final VoidCallback onTap;
  final String numberText;
  const NumberDialPad({
    Key? key,
    required this.onTap,
    required this.numberText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            height: 65,
            width: 100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //     color: primaryAppColor,
                //   width: 1.5,
                // )
              ),
               // Set the background color
            )
          //   CustomPaint(
          //     painter: BorderPainter(borderRadius: 15),
          //   ),
           ),
          Positioned(
            left: 0,
            right: 0,
            top: 10,
            bottom: 0,
            child: Text(
              numberText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: textColor,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
