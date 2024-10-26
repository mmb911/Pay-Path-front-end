
import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';


class PinInputField extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String pin;

  const PinInputField({
    Key? key,
    required this.selectedIndex,
    required this.index,
    required this.pin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: heightValue80,
      width: heightValue80,
      margin: EdgeInsets.only(right: value10),
      decoration: BoxDecoration(
        color: platinium,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: index == selectedIndex ? primaryAppColor : Colors.transparent,
          width: 3,
        ),
      ),
      child: pin.length > index
          ? Container(
              width: value15,
              height: value15,
              decoration: const BoxDecoration(
                color: textColor,
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox(),
    );
  }
}
