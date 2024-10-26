import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/features/home/widgets/bill_card.dart';

class PayBillScreen extends StatelessWidget {
  const PayBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: appGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 12.0),
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
                    'Pay bills',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    billCard('Electric bill', 'Pay electric bill this month', electricBill),
                    billCard('Water bill', 'Pay water bill this month', waterBill),
                    billCard('Mobile bill', 'Pay mobile bill this month', mobileBill),
                    billCard('Internet bill', 'Pay internet bill this month', internetBill),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

