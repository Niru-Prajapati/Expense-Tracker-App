import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  final VoidCallback onDelete;

  const TransactionTile({
    super.key,
    required this.transaction,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
            leading: CircleAvatar(
                backgroundColor:
                transaction.isIncome ? Colors.green : Colors.red,
                child: Icon(
                  transaction.isIncome
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: Colors.white,
                ),
            ),
            title: Text(transaction.title),
            subtitle: Text(
              '${transaction.category} • ${transaction.date}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
            Text(
            'Rs ${transaction.amount}',
              style: TextStyle(
                color: transaction.isIncome
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
        ),
    );
  }
}