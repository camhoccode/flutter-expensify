import 'package:flutter/material.dart';
import 'package:flutter_expensify/expenseItem.dart';
import 'package:flutter_expensify/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expensify',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Chart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: transactions
                .map((e) => ExpenseItem(
                      amount: e.amount,
                      date: e.date,
                      title: e.title,
                      id: e.id,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
