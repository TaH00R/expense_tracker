import 'package:expense_tracker/models/expense_items.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabase {
  final _myBox = Hive.box("expense_database");

  void saveData(List<ExpenseItems> allExpense){
    List<List<dynamic>> allExpensesFormatted = [];
    for(var expense in allExpense){
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime.toString(),
      ];
      allExpensesFormatted.add(expenseFormatted);
    }
      _myBox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  List<ExpenseItems> readData(){
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItems> allExpenses = [];

    for(int i =0; i<savedExpenses.length; i++){
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = DateTime.parse(savedExpenses[i][2]);

      ExpenseItems expense = ExpenseItems(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}