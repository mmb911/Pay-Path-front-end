import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/home/screens/send_money_screen.dart';
import 'package:paypath_last/features/home/services/home_service.dart';
import 'package:paypath_last/features/home/widgets/confirm_pin_to_send_money_dialpad.dart';
import 'package:paypath_last/features/home/widgets/confirm_transaction_input_field.dart';
import 'package:paypath_last/features/home/widgets/read_only_text_field.dart';
import 'package:paypath_last/widgets/custom_button.dart';
import 'package:paypath_last/widgets/height_space.dart';
import 'package:provider/provider.dart';

class ConfirmTransactionScreen extends StatefulWidget {
  final String receiverName;
  const ConfirmTransactionScreen({super.key,
    required this.receiverName});

  @override
  State<ConfirmTransactionScreen> createState() =>
      _ConfirmTransactionScreenState();
}

class _ConfirmTransactionScreenState extends State<ConfirmTransactionScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final HomeService homeService = HomeService();

  String errorText = "please enter a value!";
  bool? error = false;


  void transferMoney() {
    final user = Provider
        .of<UserProvider>(context, listen: false)
        .user;
      homeService.transferMoney(
        context: context,
        sendersUsername: user.username,
        recipientsUsername: widget.receiverName,
        amount: int.parse(amountController.text),
        description: summaryController.text,
      );
    }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final String receiverName = widget.receiverName;

     return Container(
       decoration: const  BoxDecoration(
         gradient: appGradient
       ),
       child: Scaffold(
         backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: value20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox( height: 20.0, ),
                    Row(
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const SendMoneyScreen(),)
                          );
                        },
                            icon: const Icon(Icons.arrow_back_ios,size: 20,)
                        ),
                        const Text('Confirm',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightValue40),
                    const Padding(
                      padding:  EdgeInsets.only(left: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Confirm transaction information",
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heightValue20),
                    ReadOnlyTextField(
                      value: user.username,
                      label: "From",
                    ),
                    SizedBox(height: heightValue20),
                    ReadOnlyTextField(
                      value: receiverName,
                      label: "To",
                    ),
                    SizedBox(height: heightValue20),
                    ConfirmTransactionInputField(label: "Card number",
                        hintText: "your card num",
                        controller: cardNumberController),
                    SizedBox(height: heightValue20),
                    ConfirmTransactionInputField(label: "Amount",
                        hintText: "value to transfer \$",
                        controller: amountController,
                        errorText: error == true ? errorText : null,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(height: heightValue20),
                    ConfirmTransactionInputField(label: "Description",
                        hintText: "Write short note",
                        controller: summaryController),
                    HeightSpace(heightValue65),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: CustomButton(
                        borderRadius: 20,
                        buttonText: "Send Money",
                        buttonColor: primaryAppColor,
                        buttonTextColor: Colors.white,
                        onTap: () {
                        if (amountController.text.isNotEmpty)
                        {
                          error = false;
                            showModalBottomSheet<dynamic>(
                              context: context,
                              enableDrag: false,
                              isDismissible: false,
                              isScrollControlled: true,
                              constraints: BoxConstraints.loose(
                                Size(
                                  screenWidth,
                                  screenHeight,
                                ),
                              ),
                              builder: (context) =>
                                  ConfirmPinToSendMoneyDialPad(
                                    onSuccess: () {
                                      transferMoney();
                                    },
                                  ),
                            );
                        } else  {error = true; print("error: $error");}
                        }
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
