import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return           Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
//                    onChanged: (whatever) {
//                    titleController = whatever;
//                    },
              ),
              TextField(decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
//                    onChanged: (value) {
//                    amountInput = value;
//                    },
              ),
              RaisedButton(
                elevation: 5,
                child: Text('Add Transaction',
                  style: TextStyle(color: Colors.white),),
                onPressed: () {
                  addNewTransaction(titleController.text, double.parse( amountController.text));
//                  print(titleController.text);
//                  print(amountController.text);
                },
                color: Colors.purple,)
            ],)
      ),
    );
  }
}
