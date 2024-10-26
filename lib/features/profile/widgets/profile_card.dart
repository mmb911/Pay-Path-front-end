import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/global_constants.dart';


class ProfileCard extends StatelessWidget {
  final String iconImage;
  final Color iconColor;
  final String profileOperation;
  final VoidCallback onPressed;
  const ProfileCard({
    Key? key,
    required this.iconImage,
    required this.iconColor,
    required this.profileOperation,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: heightValue80,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(heightValue20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: value20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                        iconImage,
                        height: heightValue25,
                        color: iconColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: value20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profileOperation,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: heightValue20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding:  EdgeInsets.only(right: 12),
                child:  Icon(Icons.arrow_forward_ios_rounded,
                size: 20,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
