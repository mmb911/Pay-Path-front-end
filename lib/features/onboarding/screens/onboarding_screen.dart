import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/screens/signup_screen.dart';
import 'package:paypath_last/features/onboarding/screens/widgets/glassmorphic_card.dart';
import 'package:paypath_last/widgets/custom_button.dart';
import 'package:paypath_last/widgets/height_space.dart';


import '../../auth/screens/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String route = "/onboarding-screen";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Padding(
                  padding: EdgeInsets.only(top: heightValue30),
                  child: Column(
                    children: [
                      Image.asset(
                        mainLogo,
                        height: 100,
                        width: 200,
                      ),
                      SizedBox(
                        height: heightValue10,
                      ),
                      Text(
                        "The Best Way to Transfer Money Safely",
                        style: TextStyle(
                          fontSize: heightValue15,
                          color: greyScale500,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: heightValue20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          borderRadius: 20,
                          buttonText: "Create Account",
                          buttonColor: primaryAppColor,
                          buttonTextColor: scaffoldBackgroundColor,
                          onTap: () {
                            Navigator.pushNamed(context, SignUpScreen.route);
                          }),
                      SizedBox(
                        height: heightValue10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.route);
                        },
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightValue18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
// decoration: const BoxDecoration(
// gradient: appGradient,
// ),
// child: Scaffold(
// backgroundColor: Colors.transparent,
// body: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset(
// 'assets/images/logo.png',
// width: 100,
// height: 100,
// ),
// const Text("PayPath",
// style: TextStyle(
// color: Color(0xFF0064FF),
// fontSize: 45,
// fontWeight: FontWeight.bold
// ),
// ),
// ],
// ),
// const SizedBox(height: 200),
// CustomButton(buttonText: "login", buttonColor: const Color(0xFF2EA7E5), buttonTextColor: Colors.white, onTap: () { Navigator.pushNamed(context, SignUpScreen.route); }),
// const SizedBox(height: 30),
// CustomButton(buttonText: "Register", buttonColor: Colors.white, buttonTextColor: const Color(0xFF2EA7E5), onTap:() { Navigator.pushNamed(context, LoginScreen.route); },),
// ],
// ),
// ),
// );
