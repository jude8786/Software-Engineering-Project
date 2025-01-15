import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'models/budget.dart';
import 'models/expense.dart';

void main() {
  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({Key? key}) : super(key: key);

  @override
  State<ExpenseTrackerApp> createState() => _ExpenseTrackerAppState();
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  bool _isDarkMode = false;
  final List<Expense> _expenses = [];
  final Budget _budget = Budget(initialAmount: 0, remainingAmount: 0);

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _setBudget(double newBudget) {
    setState(() {
      _budget.setNewBudget(newBudget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.teal,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.teal,
              ),
            )
          : ThemeData.light().copyWith(
              primaryColor: Colors.teal,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.teal,
              ),
            ),
      home: HomeScreen(
        toggleTheme: _toggleTheme,
        isDarkMode: _isDarkMode,
        expenses: _expenses,
        budget: _budget,
        setBudget: _setBudget,
      ),
    );
  }
}
