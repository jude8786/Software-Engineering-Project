import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseSummaryScreen extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseSummaryScreen({Key? key, required this.expenses}) : super(key: key);

  /// Calculate total expenses per category
  Map<String, double> getCategoryTotals() {
    return expenses.fold(<String, double>{}, (totals, expense) {
      totals[expense.category] = (totals[expense.category] ?? 0) + expense.amount;
      return totals;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = getCategoryTotals();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary by Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Expenses by Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: categoryTotals.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${entry.value.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
