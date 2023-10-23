import 'package:flutter/material.dart';
import 'package:flutter_expensify/models/transaction.dart';
// import 'package:flutter_expensify/models/transaction.dart';
import 'package:flutter_expensify/widgets/expenseItem.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> transactions;

  const ExpenseList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ExpenseItem(
            amount: transactions[index].amount,
            date: transactions[index].date,
            title: transactions[index].title,
            id: transactions[index].id,
          );
        },
      ),
    );
  }
}
