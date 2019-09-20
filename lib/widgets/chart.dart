import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      double totalSum = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      for(var transaction in recentTransactions){
        if(transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year){
            totalSum += transaction.amount;
        }
      }
//      for(var i = 0; i < recentTransactions.length; i++){
//        if(recentTransactions[i].date.day == weekDay.day &&
//            recentTransactions[i].date.month == weekDay.month &&
//            recentTransactions[i].date.year == weekDay.year){
//          totalSum += recentTransactions[i].amount;
//
//        }
//
//      }
      print(DateFormat.E(weekDay));
      print(totalSum);
      return {'Day': DateFormat.E(weekDay),
        'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[

        ],
      ),
    );
  }
}
