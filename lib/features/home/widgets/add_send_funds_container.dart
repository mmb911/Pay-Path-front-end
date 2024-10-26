import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';


class AddSendFundsContainers extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;
  const AddSendFundsContainers({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightValue50,
        width: heightValue120,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
            ),
          ],
          borderRadius: BorderRadius.circular(heightValue20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: heightValue35,
            ),
            SizedBox(
              height: value10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: heightValue17,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
