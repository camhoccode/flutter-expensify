import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final String title;
  final String id;
  final double amount;
  final DateTime date;

  const ExpenseItem(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            amount.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(date.toString()),
            ],
          ),
        ],
      ),
    );
  }
}