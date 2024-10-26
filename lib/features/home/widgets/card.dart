import 'package:flutter/material.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountCard extends StatelessWidget {
  final String accountNumber;
  final String balance;
  final String branch;

  const AccountCard({
    required this.accountNumber,
    required this.balance,
    required this.branch,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: const  Text('Account'),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available balance'),
            Text('Branch'),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(accountNumber),
            Text(balance),
            Text(branch),
          ],
        ),
      ),
    );
  }
}