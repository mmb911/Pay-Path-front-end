import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/features/home/widgets/beneficiary_card.dart';
import 'package:paypath_last/features/home/widgets/beneficiary_section_header.dart';

class BeneficiaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: appGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 42.0),
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
                    'Beneficiaries',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    sectionHeader('Transfer to card number'),
                    beneficiaryCard(benefName: "Mohammed", cardOraccountNum: "1234567"),
                    beneficiaryCard(benefName: "Monther", cardOraccountNum: "88880000"),
                    sectionHeader('Transfer to the same bank'),
                    beneficiaryCard(benefName: "Ali", cardOraccountNum: "99990000444"),
                    beneficiaryCard(benefName: "Mousa", cardOraccountNum: "10000085"),
                    sectionHeader('Transfer to another bank'),
                    beneficiaryCard(benefName: "Ibrahim", cardOraccountNum: "0008888"),
                    beneficiaryCard(benefName: "Khalifa", cardOraccountNum: "9936250"),
                    beneficiaryCard(benefName: "Rena", cardOraccountNum: "985205050"),
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

