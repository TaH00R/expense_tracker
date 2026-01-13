import 'package:expense_tracker/bar%20graph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/datetime/datetime_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeeklySummary extends StatelessWidget {
  final DateTime startOfWeek;
  const WeeklySummary({super.key, required this.startOfWeek});

  double calculateMax(ExpenseData value, String sunday, String monday, String tuesday, String wednesday, String thursday, String friday, String saturday){
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    values.sort();
    double max_val = values.last * 1.1;
    return max_val == 0 ? 100 : max_val;
  }

  double calculateWeeklyTotal(ExpenseData value, String sunday, String monday, String tuesday, String wednesday, String thursday, String friday, String saturday){
    double total = 0;
    total += value.calculateDailyExpenseSummary()[sunday] ?? 0;
    total += value.calculateDailyExpenseSummary()[monday] ?? 0;
    total += value.calculateDailyExpenseSummary()[tuesday] ?? 0;
    total += value.calculateDailyExpenseSummary()[wednesday] ?? 0;
    total += value.calculateDailyExpenseSummary()[thursday] ?? 0;
    total += value.calculateDailyExpenseSummary()[friday] ?? 0;
    total += value.calculateDailyExpenseSummary()[saturday] ?? 0;

    return total;
  }

  @override
  Widget build(BuildContext context) {

    String sunday = convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday = convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday = convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday = convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday = convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder : (context, expenseData, child)=>
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Text(
                  'Weekly Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  '₹${calculateWeeklyTotal(expenseData, sunday, monday, tuesday, wednesday, thursday, friday, saturday).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: MyBarGraph(
            maxY: calculateMax(expenseData, sunday, monday, tuesday, wednesday, thursday, friday, saturday), 
            sunAmount: expenseData.calculateDailyExpenseSummary()[sunday] ?? 0, 
            monAmount: expenseData.calculateDailyExpenseSummary()[monday] ?? 0, 
            tueAmount: expenseData.calculateDailyExpenseSummary()[tuesday] ?? 0, 
            wedAmount: expenseData.calculateDailyExpenseSummary()[wednesday] ?? 0, 
            thuAmount: expenseData.calculateDailyExpenseSummary()[thursday] ?? 0, 
            friAmount: expenseData.calculateDailyExpenseSummary()[friday] ?? 0, 
            satAmount: expenseData.calculateDailyExpenseSummary()[saturday] ?? 0,
          )),
        ],
      )
    );
  }
}