import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/global_constants.dart';


class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            logo,
            height: heightValue35,
          ),
        ),
        Center(
          child: SizedBox(
            height: heightValue70,
            width: heightValue70,
            child: const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
