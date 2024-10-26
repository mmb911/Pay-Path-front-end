import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/global_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  const CustomAppBar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end, // Align to the right
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 10), // Adjust padding as needed
              child: Image.asset(
                image,
                height: 70,
                // width: heightValue26,
              ),
            ),
          ],),
      // title: Padding(
      //   padding: const EdgeInsets.only(left: 170),
      //   child: Image.asset(
      //     image,
      //     height: 70,
      //
      //     // width: heightValue26,
      //   ),
      // ),
      centerTitle: false,
      iconTheme: const IconThemeData(color: Color(0xFF0377AA)),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(heightValue50);
  }
}
