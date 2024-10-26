import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/features/home/screens/home_screen.dart';
import 'package:paypath_last/widgets/custom_button.dart';

class TransferSuccessScreen extends StatelessWidget {
  final String receiverName;
  final int amount;
  const TransferSuccessScreen({super.key,
    required this.receiverName,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: appGradient
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/transfersuccess.png',
                height: 200), // Add your image
            const SizedBox(height: 20),
            const Text(
              'Transfer successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'You have successfully transferred \n',
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("\$$amount",
                  style: const  TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.purple,
                  ),
                ),
                const Text(" to ",
                  style:   TextStyle(
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
                Text("$receiverName!",
                  style: const  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: primaryAppColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomButton(buttonText: "Confirm",
                buttonTextColor: Colors.white,
                onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
                borderRadius: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}