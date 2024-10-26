import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/home/widgets/card.dart';
import 'package:paypath_last/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class AccountAndCardScreen extends StatefulWidget {
  const AccountAndCardScreen({super.key});

  @override
  State<AccountAndCardScreen> createState() => _AccountAndCardScreenState();
}

class _AccountAndCardScreenState extends State<AccountAndCardScreen> {
  Color account = primaryAppColor, card = Colors.white;
  bool check = true;
  @override
 Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
      return Container(
        decoration: const BoxDecoration(
            gradient: appGradient
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: value20),
                    child: Row(
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        },
                            icon: const Icon(Icons.arrow_back_ios,size: 20,)
                        ),
                        const Text('Accounts & Cards',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: CustomButton(buttonText: "Accounts",
                          buttonColor: account,
                          borderRadius: 20,
                          buttonTextColor: card,
                          onTap: () {
                            account = primaryAppColor;
                            card = Colors.white;
                            check =  true;
                            setState(() {

                            });
                          },),
                      ),
                      SizedBox(
                        width: 150,
                        child: CustomButton(buttonText: "Cards",
                          buttonColor: card,
                          borderRadius: 20,
                          buttonTextColor: account,
                          onTap: () {
                            account = Colors.white;
                            card = primaryAppColor;
                            check = false;
                            setState(() {
                            });
                          },),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26,),
                  CircleAvatar(
                    backgroundColor: primaryAppColor,
                    radius: 40,
                    child: Center(
                        child: Text(
                          user.fullname[0].toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.fullname,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  check == true?
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ListView(
                        children: const [
                          AccountCard(
                              accountNumber: '1900 8988 1234',
                              balance: '\$20,000',
                              branch: 'Tripoli'),
                          AccountCard(
                              accountNumber: '8988 1234',
                              balance: '\$12,000',
                              branch: 'Tripoli'),
                          AccountCard(
                              accountNumber: '1900 1234 2222',
                              balance: '\$230,000',
                              branch: 'Tripoli'),
                        ],
                      ),
                    ),
                  ) : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ListView(
                        children:  [
                          Image.asset("assets/images/visaBlue.png"),
                          Image.asset("assets/images/visaYellow.png"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: CustomButton(
                        borderRadius: 20,
                        buttonText: "Add",
                        buttonColor: primaryAppColor,
                        buttonTextColor: Colors.white,
                        onTap: () {

                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }



