import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction_model.dart';
import '../services/storage_service.dart';
import '../widgets/add_transaction_sheet.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TransactionModel> transactions = [];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  bool isIncome = false;
  String selectedCategory = 'Food';
  final List<String> categories = [
    'Food',
    'Shopping',
    'Travel',
    'Bills',
    'Salary',
    'Entertainment',
  ];

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }
  Future<void> loadTransactions() async {
    transactions = await StorageService.loadTransactions();
    setState(() {});
  }

  double get totalIncome {
    return transactions
        .where((item) => item.isIncome)
        .fold(0, (sum, item) => sum + item.amount);
  }

  double get totalExpense {
    return transactions
        .where((item) => !item.isIncome)
        .fold(0, (sum, item) => sum + item.amount);
  }

  double get totalBalance => totalIncome - totalExpense;

  Future<void> addTransaction() async {
    if (titleController.text.isEmpty ||
        amountController.text.isEmpty) {
      return;
    }
    final transaction = TransactionModel(
      title: titleController.text,
      amount: double.parse(amountController.text),
      isIncome: isIncome,
      category: selectedCategory,
      date: DateFormat('dd MMM yyyy').format(DateTime.now()),
    );

    transactions.add(transaction);

    await StorageService.saveTransactions(transactions);

    titleController.clear();
    amountController.clear();

    Navigator.pop(context);
    setState(() {});
  }

  Future<void> deleteTransaction(int index) async {
    transactions.removeAt(index);
    await StorageService.saveTransactions(transactions);
    setState(() {});
  }

  void showAddSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return AddTransactionSheet(
            titleController: titleController,
            amountController: amountController,
            isIncome: isIncome,
            selectedCategory: selectedCategory,
            categories: categories,
            onIncomeChanged: (value) {
              setState(() {
                isIncome = value;
              });
            },
            onCategoryChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
            onAdd: addTransaction,
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showAddSheet,
          child: const Icon(Icons.add),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
              BalanceCard(
              balance: totalBalance,
              income: totalIncome,
              expense: totalExpense,
            ),
            const SizedBox(height: 20),
            Expanded(
                child: transactions.isEmpty
                    ? const Center(
                  child: Text(
                    'No Transactions Yet',
                    style: TextStyle(fontSize: 18),
                  ),
                )
                    : ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionTile(
                      transaction: transactions[index],
                      onDelete: () {
                        deleteTransaction(index);
                      },
                    );
                  },
                ),
            ),
              ],
            ),
        ),
    );
  }
}