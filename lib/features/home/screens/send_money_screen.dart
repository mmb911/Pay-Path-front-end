import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/home/screens/Confirm_Transaction_Screen.dart';
import 'package:paypath_last/features/home/services/home_service.dart';
import 'package:paypath_last/features/home/widgets/build-benif_button.dart';
import 'package:paypath_last/features/home/widgets/build_transaction_options.dart';
import 'package:paypath_last/widgets/custom_textfield.dart';
import 'package:paypath_last/widgets/height_space.dart';

import 'package:provider/provider.dart';

class SendMoneyScreen extends StatefulWidget {
  static const String route = '/send-money';

  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();

  final HomeService homeService = HomeService();

  int? balance = 0;
  String? successText = '';
  String errorText = 'Invalid username';
  bool? error;
  final transferKey = GlobalKey<FormState>();

   getTransferUsername() async {
    successText = await homeService.getTransferUsername(
        context: context,
        username: usernameController.text,
        onError: () {
          setState(() {
            error = true;
          });
        });
    if (successText != '') {
      setState(() {
        error = false;
      });
    }
    setState(() {});
  }

  void transferMoney() {
    final user = Provider
        .of<UserProvider>(context, listen: false)
        .user;
    if (transferKey.currentState!.validate()) {
      homeService.transferMoney(
        context: context,
        sendersUsername: user.username,
        recipientsUsername: usernameController.text,
        amount: int.parse(amountController.text),
        description: summaryController.text,
      );
    }
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
    usernameController.dispose();
    amountController.dispose();
    summaryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: appGradient
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: value20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox( height: 20.0, ),
                      Row(
                        children: [
                          IconButton(onPressed: () {
                            Navigator.pop(context);
                          },
                              icon: const Icon(Icons.arrow_back_ios,size: 20,)
                          ),
                           const Text('Transfer',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22
                            ),
                          ),
                        ],
                      ),
                      const SizedBox( height: 16.0, ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'VISA    1234 **********',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            DropdownButton<String>(
                              items: <String>['1234', '5678'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {},
                              underline: const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
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
                      const SizedBox(height: 16.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: Text(
                              'Choose a transfer method',
                              style: TextStyle(fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          buildTransactionOption(
                            onTap: () {

                            },
                            icon: Icons.credit_card,
                            text: 'Transfer via card number',
                            isSelected: true,
                          ),
                          const SizedBox(width: 12,),
                          buildTransactionOption(
                            onTap: () {

                            },
                            icon: Icons.account_balance,
                            text: 'Transfer to the same bank',
                            isSelected: false,
                          ),
                          const SizedBox(width: 12,),
                          buildTransactionOption(
                            onTap: () {

                            },
                            icon: Icons.account_balance_wallet,
                            text: 'Transfer to another bank',
                            isSelected: false,
                          ),
                        ],
                      ),
                      HeightSpace(heightValue30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: Text('Choose beneficiary',
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          buildBeneficiaryButton(
                            icon: Icons.add,
                          label: "Add",
                          onTap: () {
                          },
                          ),
                          const SizedBox(width: 8.0),
                          buildBeneficiaryButton(
                            icon: Icons.person,
                              label: 'Ali',
                            onTap: () {

                            },
                          ),
                          const SizedBox(width: 8.0),
                          buildBeneficiaryButton(
                            icon: Icons.person,
                            label: 'Mousa',
                            onTap: () {

                            },
                          ),
                        ],
                      ),
                      HeightSpace(heightValue30),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 6.0),
                            child:  Text(
                              'Find beneficiary',
                              style: TextStyle(
                                  color:
                                  textColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold

                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        decoration:
                         BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: value220,
                                    child: CustomTextField(
                                      hintText: "username",
                                      prefixIcon: const Icon(Icons.alternate_email, color: Colors.grey,),
                                      controller: usernameController,
                                      errorText: error == true ? errorText : null,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await getTransferUsername();
                                  error == false ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => ConfirmTransactionScreen(receiverName: usernameController.text,)))
                                      : print("error : $error");
                                },
                                child: Container(
                                  height: heightValue65,
                                  width: heightValue65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryAppColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: heightValue27,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      HeightSpace(heightValue10),
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );

  }
}
