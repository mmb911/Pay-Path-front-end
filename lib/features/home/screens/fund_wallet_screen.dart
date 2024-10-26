/*nothing much here. This just asks the user for the amount they will like to add
Then it confirms their pin and updates their balance
You can implement an actual deposit feature if you want*/

import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/home/services/home_service.dart';
import 'package:paypath_last/features/home/widgets/confirm_pin_to_send_money_dialpad.dart';
import 'package:paypath_last/features/home/widgets/confirm_transaction_input_field.dart';
import 'package:paypath_last/widgets/custom_app_bar.dart';
import 'package:paypath_last/widgets/custom_button.dart';
import 'package:paypath_last/widgets/custom_textfield.dart';

import 'package:provider/provider.dart';

class FundWalletScreen extends StatefulWidget {
  static const String route = "/add-money";
  const FundWalletScreen({super.key});

  @override
  State<FundWalletScreen> createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends State<FundWalletScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController visaOrAccountNumberController = TextEditingController();

  int? balance = 0;
  final HomeService homeService = HomeService();

  void fundAccontWallet() {
    final username =
        Provider.of<UserProvider>(context, listen: false).user.username;
    homeService.fundWallet(
        context: context,
        username: username,
        amount: int.parse(amountController.text),
        onLandingOnHomePage: () {});
  }

  getUserBalance() async {
    final user = Provider
        .of<UserProvider>(context, listen: false)
        .user;
    balance = await homeService.getUserBalance(
      context: context,
      username: user.username,
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration:const BoxDecoration(
          gradient: appGradient
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: value20, vertical: value40),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          )),
                      const Text(
                        'Fund wallet',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24,),
                  Image.asset(
                      'assets/images/transfersuccess.png',
                      height: 200),

                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Note: max = ",
                        style: TextStyle(
                          fontSize: heightValue20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "5,000 LYD",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: 320,
                    child: ConfirmTransactionInputField(
                      label: "",
                      keyboardType: TextInputType.number,
                      hintText: "Enter you card or account number",
                      controller: visaOrAccountNumberController,

                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    width: 320,
                    child: ConfirmTransactionInputField(
                      label: "Choose amount",
                      keyboardType: TextInputType.number,
                      hintText: "Enter Amount",
                      controller: amountController,

                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Text(
                          "Available balance: ${amountFormatter.format(balance)} LYD",
                          style: const TextStyle(
                            color: primaryAppColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: value20),
                    child: CustomButton(
                      borderRadius: 20,
                      buttonText: "Continue",
                      buttonColor: primaryAppColor,
                      buttonTextColor: secondaryAppColor,
                      onTap: () => showModalBottomSheet<dynamic>(
                        context: context,
                        enableDrag: false,
                        isDismissible: false,
                        isScrollControlled: true,
                        constraints: BoxConstraints.loose(
                          Size(screenWidth, screenHeight),
                        ),
                        builder: (context) => ConfirmPinToSendMoneyDialPad(
                          onSuccess: () {
                            fundAccontWallet();
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
