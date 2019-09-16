import 'package:flutter/material.dart';
import './new_transactions.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 'tranOne', title: "Nike Shoes", amount: 1799.00, date: DateTime.now()),
    Transaction(id: 'tranTwo', title: 'Fridge', amount: 17000.00, date: DateTime.now()),
    Transaction(id: 'tranThree', title: 'Microwave', amount: 5000.00, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount){

    final newTransaction = Transaction(title: title, amount: amount, date: DateTime.now(), id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions)
    ],);
  }
}
