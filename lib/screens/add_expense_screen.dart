import 'package:flutter/material.dart';
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
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String? selectedCategory;
  DateTime? selectedDate;

  void _submitData() {
    final description = descriptionController.text;
    final amount = double.tryParse(amountController.text);

    if (description.isEmpty || amount == null || selectedCategory == null || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields!')),
      );
      return;
    }

    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: description,
      amount: amount,
      category: selectedCategory!,
      date: selectedDate!,
    );

    widget.expenses.add(newExpense);
    widget.updateBudget(amount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedCategory,
                hint: const Text('Choose Category'),
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
                items: ['Food', 'Travel', 'Health', 'Others']
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${selectedDate!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: const Text('Choose Date'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
