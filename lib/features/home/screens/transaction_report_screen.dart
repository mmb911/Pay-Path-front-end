import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/home/widgets/transaction_report_item.dart';

class TransactionReportScreen extends StatelessWidget {
  const TransactionReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: appGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: value20),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
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
                    'Transactions report',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                ],
              ),
              Image.asset(
                transactionReport,
                height: 350,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ListView(
                    children: const [
                      TransactionItem(
                        icon: Icons.water,
                        color: Colors.blue,
                        title: 'Water Bill',
                        amount: '-\$280',
                        status: 'Unsuccessfully',
                      ),
                      TransactionItem(
                        icon: Icons.attach_money,
                        color: Colors.green,
                        title: 'Income: Salary Oct',
                        amount: '+\$1200',
                        status: 'Successfully',
                      ),
                      TransactionItem(
                        icon: Icons.flash_on,
                        color: Colors.orange,
                        title: 'Electric Bill',
                        amount: '-\$480',
                        status: 'Successfully',
                      ),
                      TransactionItem(
                        icon: Icons.attach_money,
                        color: Colors.purple,
                        title: 'Income: Jane transfers',
                        amount: '+\$500',
                        status: 'Successfully',
                      ),
                      TransactionItem(
                        icon: Icons.wifi,
                        color: Colors.red,
                        title: 'Internet Bill',
                        amount: '-\$100',
                        status: 'Successfully',
                      ),
                      TransactionItem(
                        icon: Icons.flash_on,
                        color: Colors.orange,
                        title: 'Electric Bill',
                        amount: '-\$480',
                        status: 'Successfully',
                      ),
                      TransactionItem(
                        icon: Icons.attach_money,
                        color: Colors.purple,
                        title: 'Income: Jane transfers',
                        amount: '+\$500',
                        status: 'Successfully',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
