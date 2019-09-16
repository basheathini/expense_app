import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transactions.dart';
import './widgets/user_transactions.dart';

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

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense app'),
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
            UserTransactions()
          ],
        ),
      )
    );
  }
}
