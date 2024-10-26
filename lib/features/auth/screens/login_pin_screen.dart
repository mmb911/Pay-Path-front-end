// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:paypath_last/config/routes/custom_push_navigators.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/auth/screens/forgort_pin_screen.dart';
import 'package:paypath_last/features/auth/services/auth_service.dart';
import 'package:paypath_last/features/profile/services/profile_services.dart';
import 'package:paypath_last/widgets/custom_app_bar.dart';
import 'package:paypath_last/widgets/custom_button.dart';
import 'package:paypath_last/widgets/height_space.dart';
import 'package:paypath_last/widgets/number_dial_pad.dart';
import 'package:paypath_last/widgets/pin_input_field.dart';

import 'package:provider/provider.dart';

class LoginPinScreen extends StatefulWidget {
  const LoginPinScreen({super.key});

  @override
  State<LoginPinScreen> createState() => _LoginPinScreenState();
}

class _LoginPinScreenState extends State<LoginPinScreen> {
  final AuthService authService = AuthService();
  final ProfileServices profileServices = ProfileServices();
  var selectedindex = 0;
  String pin = '';

  addDigit(int digit) {
    if (pin.length > 3) {
      return;
    }
    setState(() {
      pin = pin + digit.toString();
      print('pin is $pin');
      selectedindex = pin.length;
      if (pin.length > 3) {
        loginUsingPersonalPin();
      }
    });
  }

  backspace() {
    if (pin.isEmpty) {
      return;
    }
    setState(() {
      pin = pin.substring(0, pin.length - 1);
      selectedindex = pin.length;
    });
  }

  void logOut() {
    profileServices.logOut(context);
  }

  void loginUsingPersonalPin() {
    final username =
        Provider.of<UserProvider>(context, listen: false).user.username;
    authService.loginUsingPin(
      context: context,
      pin: pin,
      username: username,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      //appBar: const CustomAppBar(image: mainLogo),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: appGradient
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: value20, vertical: value20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(mainLogo),
                  HeightSpace(heightValue20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome back, ${user.fullname}",
                        style: TextStyle(
                          fontSize: heightValue30,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Please enter your PIN",
                    style:
                    TextStyle(
                      color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  HeightSpace(heightValue50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PinInputField(
                        index: 0,
                        selectedIndex: selectedindex,
                        pin: pin,
                      ),
                      PinInputField(
                          index: 1, selectedIndex: selectedindex, pin: pin),
                      PinInputField(
                          index: 2, selectedIndex: selectedindex, pin: pin),
                      PinInputField(
                          index: 3, selectedIndex: selectedindex, pin: pin),
                    ],
                  ),
                  HeightSpace(heightValue20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberDialPad(onTap: () => addDigit(1), numberText: '1'),
                      NumberDialPad(onTap: () => addDigit(2), numberText: '2'),
                      NumberDialPad(onTap: () => addDigit(3), numberText: '3'),
                    ],
                  ),
                  HeightSpace(heightValue20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberDialPad(onTap: () => addDigit(4), numberText: '4'),
                      NumberDialPad(onTap: () => addDigit(5), numberText: '5'),
                      NumberDialPad(onTap: () => addDigit(6), numberText: '6'),
                    ],
                  ),
                  HeightSpace(heightValue20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberDialPad(onTap: () => addDigit(7), numberText: '7'),
                      NumberDialPad(onTap: () => addDigit(8), numberText: '8'),
                      NumberDialPad(onTap: () => addDigit(9), numberText: '9'),
                    ],
                  ),
                  HeightSpace(heightValue20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        color: textColor,
                        iconSize: heightValue40,
                        style: ButtonStyle(
                            // backgroundColor:
                            //     MaterialStatePropertyAll(primaryAppColor),
                            fixedSize: MaterialStatePropertyAll(
                                Size(heightValue75, heightValue75))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: greyScale850,
                                    surfaceTintColor: greyScale850,
                                    icon: Image.asset(
                                      infoCircle,
                                      height: heightValue100,
                                      width: heightValue100,
                                      color: whiteColor,
                                    ),
                                    title: Text("Caution",
                                        style: TextStyle(
                                            fontSize: value18,
                                            fontWeight: FontWeight.bold)),
                                    content: Text(
                                      "Are you sure you want to logout",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: heightValue13,
                                          color: Colors.grey[600]),
                                    ),
                                    actions: <Widget>[
                                      CustomButton(
                                        buttonText: "Yes",
                                        onTap: () {
                                          logOut();
                                        },
                                        buttonColor: primaryAppColor,
                                        buttonTextColor: secondaryAppColor,
                                      ),
                                      HeightSpace(heightValue10),
                                      CustomButton(
                                        buttonText: "Cancel",
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        buttonColor: primaryAppColor,
                                        buttonTextColor: secondaryAppColor,
                                      )
                                    ],
                                  ));
                        },
                        icon: const Icon(
                          Icons.logout,
                        ),
                      ),
                      NumberDialPad(onTap: () => addDigit(0), numberText: '0'),
                      TextButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(heightValue75, heightValue75),
                          ),
                        ),
                        //height: double.maxFinite,
                        onPressed: () {
                          backspace();
                        },
                        child: Icon(
                          Icons.backspace_outlined,
                          color: textColor,
                          size: heightValue30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  TextButton(
                    onPressed: () {
                      namedNav(context, ForgortPinScreen.route);
                    },
                    child: const Text(
                      "forgot PIN?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
