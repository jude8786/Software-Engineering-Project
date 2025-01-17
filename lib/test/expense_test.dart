import 'package:expense_tracker/models/expense.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/models/expense.dart';


void main() {
  late List<Expense> expenses;

  // Common setup for all tests
  setUp(() {
    expenses = [
      Expense(id: '1', title: 'Groceries', amount: 50, category: 'Food', date: DateTime(2023, 1, 15)),
      Expense(id: '2', title: 'Transport', amount: 20, category: 'Travel', date: DateTime(2023, 1, 15)),
      Expense(id: '3', title: 'Snacks', amount: 30, category: 'Food', date: DateTime(2023, 1, 15)),
    ];
  });

  group('Expense Model Tests', () {
    test('Expense is created correctly', () {
      final expense = Expense(
        id: '4',
        title: 'Coffee',
        amount: 15.0,
        category: 'Beverage',
        date: DateTime(2023, 1, 15),
      );

      expect(expense.id, '4');
      expect(expense.title, 'Coffee');
      expect(expense.amount, 15.0);
      expect(expense.category, 'Beverage');
    });

    test('Expenses can be grouped by category', () {
      final groupedExpenses = {
        'Food': expenses.where((e) => e.category == 'Food').toList(),
        'Travel': expenses.where((e) => e.category == 'Travel').toList(),
      };

      expect(groupedExpenses['Food']!.length, 2);
      expect(groupedExpenses['Travel']!.length, 1);
    });

    test('Handles empty expenses gracefully', () {
      final emptyExpenses = <Expense>[];

      final groupedExpenses = {
        'Food': emptyExpenses.where((e) => e.category == 'Food').toList(),
      };

      expect(groupedExpenses['Food']!.isEmpty, isTrue);
    });


    test('Handles negative amounts in expenses', () {
      final expense = Expense(
        id: '4',
        title: 'Refund',
        amount: -10.0,
        category: 'Misc',
        date: DateTime(2023, 1, 15),
      );

      expect(expense.amount, lessThan(0));
    });

    test('Handles future-dated expenses', () {
      final futureDate = DateTime.now().add(Duration(days: 30));
      final expense = Expense(
        id: '5',
        title: 'Future Expense',
        amount: 25.0,
        category: 'Misc',
        date: futureDate,
      );

      expect(expense.date.isAfter(DateTime.now()), isTrue);
    });
  });
}

