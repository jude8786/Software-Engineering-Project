import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  final double budget;
  final Function(double) setBudget;

  const BudgetScreen({
    Key? key,
    required this.budget,
    required this.setBudget,
  }) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  late TextEditingController _budgetController;

  @override
  void initState() {
    super.initState();
    _budgetController = TextEditingController(text: widget.budget.toString());
  }

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  void _submitBudget() {
    final input = _budgetController.text;
    final newBudget = double.tryParse(input);

    if (newBudget == null || newBudget < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid budget amount.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    widget.setBudget(newBudget);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Budget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your budget:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Budget',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitBudget,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.teal,
              ),
              child: const Text('Set Budget'),
            ),
          ],
        ),
      ),
    );
  }
}