import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';
import 'package:expense_tracker/models/budget.dart';
import 'package:expense_tracker/models/expense.dart';

void main() {
  testWidgets('AddExpenseScreen adds a new expense', (WidgetTester tester) async {
    // Mock data
    final budget = Budget(initialAmount: 1000, remainingAmount: 500);
    final expenses = <Expense>[];

    // Build AddExpenseScreen
    await tester.pumpWidget(
      MaterialApp(
        home: AddExpenseScreen(
          expenses: expenses,
          budget: budget,
          updateBudget: (amount) {
            budget.remainingAmount -= amount;
          },
        ),
      ),
    );

    // Interact with the screen
    await tester.enterText(find.byType(TextField).first, 'Groceries'); // Enter title
    await tester.enterText(find.byType(TextField).last, '50'); // Enter amount
    await tester.tap(find.text('Food').last); // Select category
    await tester.tap(find.text('Choose Date')); // Open date picker
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK')); // Confirm date
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save Expense')); // Save expense
    await tester.pumpAndSettle();

    // Assert
    expect(expenses.length, 1);
    expect(expenses.first.title, 'Groceries');
    expect(expenses.first.amount, 50.0);
    expect(expenses.first.category, 'Food');
    expect(budget.remainingAmount, 450);
  });
}
