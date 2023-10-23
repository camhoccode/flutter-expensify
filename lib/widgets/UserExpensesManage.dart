import 'package:flutter/material.dart';
import 'package:flutter_expensify/models/transaction.dart';
import 'package:flutter_expensify/widgets/addExpenseForm.dart';
import 'package:flutter_expensify/widgets/expenseList.dart';

class UserExpensesManage extends StatefulWidget {
  const UserExpensesManage({super.key});

  @override
  State<UserExpensesManage> createState() => _UserExpensesManageState();
}

class _UserExpensesManageState extends State<UserExpensesManage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '001',
      title: 'Car',
      amount: 12,
      date: DateTime.now(),
    ),
    Transaction(
      id: '001',
      title: 'House',
      amount: 15,
      date: DateTime.now(),
    ),
    Transaction(
      id: '001',
      title: 'Cat food',
      amount: 2,
      date: DateTime.now(),
    ),
  ];

  void _addNewExpense(String title, double amount) {
    final newExpense = Transaction(
        id: DateTime.now().toString(),
        date: DateTime.now(),
        title: title,
        amount: amount);
    setState(() {
      _userTransactions.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddNewExpense(addExpense: _addNewExpense),
        ExpenseList(_userTransactions)
      ],
    );
  }
}
