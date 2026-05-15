import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final double income;
  final double expense;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
          'Total Balance',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Rs ${balance.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
          'Income',
          style: TextStyle(color: Colors.white70),
        ),
        Text(
            'Rs ${income.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
        ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
          'Expense',
          style: TextStyle(color: Colors.white70),
        ),
        Text(
            'Rs ${expense.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
        ),
          ],
        ),
          ],
        )
          ],
        ),
    );
  }
}