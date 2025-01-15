import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'budget_screen.dart';
import 'expense_summary_screen.dart';
import 'bar_graph_screen.dart';
import 'expense_list_screen.dart';
import 'add_expense_screen.dart';
import '../models/expense.dart';
import '../models/budget.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;
  final List<Expense> expenses;
  final Budget budget;
  final Function(double) setBudget;

  const HomeScreen({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
    required this.expenses,
    required this.budget,
    required this.setBudget,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions() {
    return [
      _buildHomeTab(),
      BarGraphScreen(expenses: widget.expenses),
      ExpenseSummaryScreen(expenses: widget.expenses),
      BudgetScreen(budget: widget.budget.initialAmount, setBudget: widget.setBudget),
      ExpenseListScreen(expenses: widget.expenses, onDelete: _deleteExpense),
    ];
  }

  void _deleteExpense(int index) {
    setState(() {
      final double amount = widget.expenses[index].amount;
      widget.expenses.removeAt(index);
      widget.budget.remainingAmount += amount;
    });
  }

  Widget _buildHomeTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBudgetOverview(),
          const SizedBox(height: 20),
          const Text(
            'Transactions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          const SizedBox(height: 10),
          Expanded(child: _buildTransactionList()),
        ],
      ),
    );
  }

  Widget _buildBudgetOverview() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${widget.budget.remainingAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Income: \$${widget.budget.initialAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
                Text(
                  'Expenses: \$${(widget.budget.initialAmount - widget.budget.remainingAmount).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (ctx, index) {
        final expense = widget.expenses[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('\$${expense.amount.toStringAsFixed(2)}'),
                ),
              ),
            ),
            title: Text(expense.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${expense.category} - ${DateFormat.yMMMd().format(expense.date)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteExpense(index),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: _widgetOptions().elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddExpenseScreen(
              expenses: widget.expenses,
              budget: widget.budget,
              updateBudget: (amount) {
                setState(() {
                  widget.budget.remainingAmount -= amount;
                });
              },
            ),
          ),
        ),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Weekly Expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Summary'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Budget'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Expenses'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
