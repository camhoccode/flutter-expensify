import 'package:flutter/material.dart';
import 'package:flutter_expensify/widgets/addExpenseForm.dart';
import 'package:flutter_expensify/widgets/expenseItem.dart';
import 'package:flutter_expensify/models/transaction.dart';
import 'package:flutter_expensify/widgets/expenseList.dart';
import 'package:flutter_expensify/widgets/UserExpensesManage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expensify',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  // late String titleInput;
  final titleController = TextEditingController();

  final amountController = TextEditingController();
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

  void _startAddingExpense(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: AddNewExpense(addExpense: _addNewExpense));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddingExpense(context),
              icon: const Icon(
                Icons.add,
              ))
        ],
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
          // const UserExpensesManage()
          ExpenseList(_userTransactions),
          // Column(
          //   children: [ExpenseList(_userTransactions)],
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddingExpense(context),
          child: const Icon(Icons.add)),
    );
  }
}
