import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/widgets/height_space.dart';
import 'package:paypath_last/widgets/width_space.dart';

class LargerProfileCard extends StatelessWidget {
  final String iconImage1;
  final String profileOperation1;
  final VoidCallback onPressed1;

  final String iconImage2;
  final String profileOperation2;
  final VoidCallback onPressed2;

  final String iconImage3;
  final String profileOperation3;
  final VoidCallback onPressed3;

  final String iconImage4;
  final String profileOperation4;
  final VoidCallback onPressed4;

  final String iconImage5;
  final String profileOperation5;
  final VoidCallback onPressed5;

  const LargerProfileCard({
    Key? key,
    required this.iconImage1,
    required this.profileOperation1,
    required this.onPressed1,

    required this.iconImage2,
    required this.profileOperation2,
    required this.onPressed2,

    required this.iconImage3,
    required this.profileOperation3,
    required this.onPressed3,

    required this.iconImage4,
    required this.profileOperation4,
    required this.onPressed4,

    required this.iconImage5,
    required this.profileOperation5,
    required this.onPressed5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(heightValue20),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: onPressed1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightValue45,
                    width: heightValue45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(value10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 3, // Blur radius
                          offset: const Offset(0, 3), // Changes position of shadow
                        )
                      ]
                    ),
                    child: Center(
                      child: Image.asset(
                        iconImage1,
                        height: heightValue25,
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                  const WidthSpace(20),
                  Text(
                    profileOperation1,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: heightValue20,
                    ),
                  ),
                  const WidthSpace(156),
                  const Icon(Icons.arrow_forward_ios_rounded,
                    size: 20,)
                ],
              ),
            ),
            HeightSpace(heightValue25),
            GestureDetector(
              onTap: onPressed2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightValue45,
                    width: heightValue45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(value10),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 3, // Blur radius
                            offset: const Offset(0, 3), // Changes position of shadow
                          )
                        ]
                    ),
                    child: Center(
                      child: Image.asset(
                        iconImage2,
                        height: heightValue25,
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                  const WidthSpace(20),
                  Text(
                    profileOperation2,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: heightValue20,
                    ),
                  ),
                  const WidthSpace(65),
                  const Icon(Icons.arrow_forward_ios_rounded,
                    size: 20,)
                ],
              ),
            ),
            HeightSpace(heightValue25),
            GestureDetector(
              onTap: onPressed3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightValue45,
                    width: heightValue45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(value10),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 3, // Blur radius
                            offset: const Offset(0, 3), // Changes position of shadow
                          )
                        ]
                    ),
                    child: Center(
                      child: Image.asset(
                        iconImage3,
                        height: heightValue25,
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                  const WidthSpace(20),
                  Text(
                    profileOperation3,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: heightValue20,
                    ),
                  ),
                  const WidthSpace(125),
                  const Icon(Icons.arrow_forward_ios_rounded,
                    size: 20,)
                ],
              ),
            ),
            HeightSpace(heightValue25),
            GestureDetector(
              onTap: onPressed4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightValue45,
                    width: heightValue45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(value10),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 3, // Blur radius
                            offset: const Offset(0, 3), // Changes position of shadow
                          )
                        ]
                    ),
                    child: Center(
                      child: Image.asset(
                        iconImage4,
                        height: heightValue25,
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                  const WidthSpace(20),
                  Text(
                    profileOperation4,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: heightValue20,
                    ),
                  ),
                  const WidthSpace(83),
                  const Icon(Icons.arrow_forward_ios_rounded,
                    size: 20,)
                ],
              ),
            ),
            HeightSpace(heightValue25),
            GestureDetector(
              onTap: onPressed5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightValue45,
                    width: heightValue45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(value10),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 3, // Blur radius
                            offset: const Offset(0, 3), // Changes position of shadow
                          )
                        ]
                    ),
                    child: Center(
                      child: Image.asset(
                        iconImage5,
                        height: heightValue25,
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                  const WidthSpace(20),
                  Text(
                    profileOperation5,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: heightValue20,
                    ),
                  ),
                  const WidthSpace(80),
                  const Icon(Icons.arrow_forward_ios_rounded,
                    size: 20,)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
