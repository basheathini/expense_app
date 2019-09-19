import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/new_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
      ),
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
            Container(
              width: double.infinity,
//            height: 200,
              margin: EdgeInsets.all(5),
              color: Colors.yellowAccent,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(5),
                child: Text('what'),
              ),
            ),
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
