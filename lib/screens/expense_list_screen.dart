import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseListScreen extends StatelessWidget {
  final List<Expense> expenses;
  final Function(int) onDelete;

   ExpenseListScreen({Key? key, required this.expenses, required this.onDelete}) : super(key: key);

  final Map<String, String> categoryImages = {
    'Food': 'lib/assets/images/food.png',
    'Transport': 'lib/assets/images/travel.png',
    'Health': 'lib/assets/images/health.png',
    'Others': 'lib/assets/images/other.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Expenses'),
      ),
      body: expenses.isEmpty
          ? const Center(
              child: Text(
                'No expenses added yet.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (ctx, index) {
                final expense = expenses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 3,
                  child: ListTile(
                    leading: Image.asset(
                      categoryImages[expense.category]!,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      expense.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${expense.category} - ${DateFormat.yMMMd().format(expense.date)}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onDelete(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
