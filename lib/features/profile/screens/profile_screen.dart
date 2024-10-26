import 'package:flutter/material.dart';
import 'package:paypath_last/config/routes/custom_push_navigators.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/home/screens/comming_soon_screen.dart';
import 'package:paypath_last/features/profile/screens/change_pin_screen.dart';
import 'package:paypath_last/features/profile/services/profile_services.dart';
import 'package:paypath_last/features/profile/widgets/profile_card.dart';
import 'package:paypath_last/features/transactions/screens/all_transactions_screen.dart';
import 'package:paypath_last/widgets/custom_button.dart';
import 'package:paypath_last/widgets/height_space.dart';
import 'package:paypath_last/widgets/larger_profile_card.dart';

import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileServices profileServices = ProfileServices();

  void logOut() {
    profileServices.logOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: appGradient
          ),
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: value40,
                        child: Center(
                          child: Text(
                            user.fullname[0].toUpperCase(),
                            style: TextStyle(fontSize: value25),
                          ),
                        ),
                      ),
                  SizedBox(
                  height: heightValue5,
                  ),
                    Text(
                    user.fullname,
                    style: TextStyle(
                      fontSize: heightValue25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                    SizedBox(
                      height: heightValue30,
                    ),
                    ProfileCard(
                      iconImage: "assets/icons/profile_icon.png",
                      iconColor: primaryAppColor,
                      profileOperation: "Personal details",
                      onPressed: () {
                        Navigator.pushNamed(context, CommingSoonScreen.route);
                      },
                    ),
                    const SizedBox(height: 20),
                    LargerProfileCard(
                        iconImage1: "assets/images/mycards.png", profileOperation1: "My cards", onPressed1: () => {  },
                        iconImage2: "assets/images/widthrawdetails.png", profileOperation2: "Transactions details", onPressed2: () => namedNav(context, TransactionsScreen.route),
                        iconImage3: "assets/images/Notifications.png", profileOperation3: "Notifications", onPressed3: () => {},
                        iconImage4: "assets/images/privacy.png", profileOperation4: "Privacy & Security", onPressed4: () => namedNav(context, ChangeLoginPinScreen.route),
                        iconImage5: "assets/images/callUS.png", profileOperation5: "Customer support", onPressed5: () => {}
                    ),
                    const SizedBox(height: 20),
                    ProfileCard(
                        iconImage: "assets/icons/logout_icon.png",
                        iconColor: Colors.red,
                        profileOperation: "Sign Out",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: greyScale850,
                                    surfaceTintColor: greyScale850,
                                    icon: Image.asset(
                                      infoCircle,
                                      height: value100,
                                      width: value100,
                                      color: whiteColor,
                                    ),
                                    title: Text("Caution",
                                        style: TextStyle(
                                          fontSize: value18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    content: Text(
                                      "Are you sure you want to logout",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: heightValue15,
                                        color: Colors.grey[600],
                                      ),
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
                      )
                  ],
                ),
          )),
        ),
      ),
    );
  }
}
