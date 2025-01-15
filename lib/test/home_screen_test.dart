import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/budget.dart';
import 'package:expense_tracker/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen displays budget and transactions', (WidgetTester tester) async {
    // Mock data
    final budget = Budget(initialAmount: 500, remainingAmount: 300);
    final expenses = [
      Expense(id: '1', title: 'Coffee', amount: 20.0, category: 'Food', date: DateTime.now()),
      Expense(id: '2', title: 'Taxi', amount: 15.0, category: 'Transport', date: DateTime.now()),
    ];

    // Pump the widget
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          toggleTheme: () {},
          isDarkMode: false,
          expenses: expenses,
          budget: budget,
          setBudget: (amount) {
            budget.remainingAmount = amount;
          },
        ),
      ),
    );

    // Check if budget information is displayed
    expect(find.text('Total Balance'), findsOneWidget);
    expect(find.text('\$300.00'), findsOneWidget);

    // Check if transactions are displayed
    expect(find.text('Coffee'), findsOneWidget);
    expect(find.text('Taxi'), findsOneWidget);
  });
}
