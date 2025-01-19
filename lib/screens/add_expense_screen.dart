import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';
import '../models/budget.dart';

class AddExpenseScreen extends StatefulWidget {
  final List<Expense> expenses;
  final Budget budget;
  final Function(double) updateBudget;

  const AddExpenseScreen({
    Key? key,
    required this.expenses,
    required this.budget,
    required this.updateBudget,
  }) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedCategory = 'Food';
  DateTime? _selectedDate;

  final List<String> _categories = ['Food', 'Transport', 'Health', 'Others'];

  final Map<String, String> categoryImages = {
    'Food': 'lib/assets/images/food.png',
    'Transport': 'lib/assets/images/travel.png',
    'Health': 'lib/assets/images/health.png',
    'Others': 'lib/assets/images/other.png',
  };

  bool _validateInputs() {
    if (_titleController.text.isEmpty ||
        double.tryParse(_amountController.text) == null ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return false;
    }
    return true;
  }

  void _saveExpense() {
    if (!_validateInputs()) return;

    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      category: _selectedCategory,
      date: _selectedDate!,
    );

    setState(() {
      widget.expenses.add(newExpense);
      widget.updateBudget(newExpense.amount);
    });

    Navigator.of(context).pop();
  }

  void _pickDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Row(
                    children: [
                      Image.asset(
                        categoryImages[category]!,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(category),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
                  ),
                ),
                TextButton(
                  onPressed: _pickDate,
                  child: const Text('Choose Date'),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveExpense,
                child: const Text('Save Expense'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
