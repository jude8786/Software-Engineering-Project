import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class BarGraphScreen extends StatelessWidget {
  final List<Expense> expenses;

  const BarGraphScreen({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupedData = _getGroupedData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: groupedData.isNotEmpty
                ? groupedData.values.reduce((a, b) => a > b ? a : b) + 10
                : 10,
            barGroups: _buildBarGroups(groupedData),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, _) => Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                    return Text(
                      days[value.toInt() % days.length],
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  /// Groups expenses by weekday and calculates totals for each day.
  Map<int, double> _getGroupedData() {
    final data = <int, double>{};
    for (var expense in expenses) {
      final weekday = expense.date.weekday - 1; // Monday = 1, so adjust to zero-based index
      data[weekday] = (data[weekday] ?? 0) + expense.amount;
    }
    return data;
  }

  /// Converts grouped data into bar groups for the chart.
  List<BarChartGroupData> _buildBarGroups(Map<int, double> groupedData) {
    return groupedData.entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            color: Colors.teal,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }
}
