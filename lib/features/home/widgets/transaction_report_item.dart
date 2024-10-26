import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String amount;
  final String status;

  const TransactionItem({super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
      subtitle: Text(status,
        style: const TextStyle(
          color: Colors.grey
        ),
      ),
      trailing: Text(
        amount,
        style: TextStyle(
          color: amount.startsWith('-') ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    );
  }
}
