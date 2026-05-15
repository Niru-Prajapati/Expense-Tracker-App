import 'package:flutter/material.dart';

class AddTransactionSheet extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final bool isIncome;
  final String selectedCategory;
  final List<String> categories;
  final Function(bool) onIncomeChanged;
  final Function(String?) onCategoryChanged;
  final VoidCallback onAdd;
  const AddTransactionSheet({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.isIncome,
    required this.selectedCategory,
    required this.categories,
    required this.onIncomeChanged,
    required this.onCategoryChanged,
    required this.onAdd,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            const Text(
            'Add Transaction',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Amount',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField(
          value: selectedCategory,
          items: categories.map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: onCategoryChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SwitchListTile(
          title: const Text('Is Income?'),
          value: isIncome,
          onChanged: onIncomeChanged,
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: onAdd,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(fontSize: 18),
          ),
        ),
            ],
        ),
    );
  }
}