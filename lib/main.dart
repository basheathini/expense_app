import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

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
    Transaction(id: 'tranTwo', title: 'Fridge', amount: 17000.00, date: DateTime.now()),
    Transaction(id: 'tranThree', title: 'Microwave', amount: 5000.00, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions{
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    });
  }

  void _addNewTransaction(String title, double amount){
    final newTransaction = Transaction(title: title, amount: amount, date: DateTime.now(), id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext cont) {
    showModalBottomSheet(context: cont, builder: (_) {
      return NewTransaction(_addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense app'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
      ),
    );
  }
}
