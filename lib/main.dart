import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/chart.dart';
import 'package:flutter/services.dart';

//void main() => runApp(MyApp());
void main(){
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.green,
        textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 18)),
        fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold),
      ),
    )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
  
class _MyHomePageState extends State<MyHomePage>{

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    Transaction(id: 'tranOne', title: "Nike Shoes", amount: 1799.00, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions{
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime dateTime){
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: dateTime,
        id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext cont) {
    showModalBottomSheet(context: cont, builder: (_) {
      return NewTransaction(_addNewTransaction);
    });
  }
  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = Platform.isIOS ? CupertinoNavigationBar(
      middle: Text('Expense app'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        GestureDetector(onTap: () => _startAddNewTransaction(context),
          child: Icon(CupertinoIcons.add),)

      ],),
    ) : AppBar(
      title: Text('Expense app'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );

    final pageBody = SafeArea(child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.3,
            child: Chart(_recentTransactions), ),
          Container(
            height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.7,
            child: TransactionList(_userTransactions, _deleteTransaction),
          )
        ],
      ),
    ),);
    // TODO: implement build
    return Platform.isIOS ? CupertinoPageScaffold(child: pageBody, navigationBar: appBar,) : Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
