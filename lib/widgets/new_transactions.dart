import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/adaptive_flat_button.dart';
class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData(){
//    if(_titleController.text.isEmpty){
//      return;
//    }
//    final enteredTitle = _titleController.text;
//    final enteredAmount = double.parse(_amountController.text);
  for(int i = 0; i <= 3000; i++){
    final enteredTitle = "Nike Shoes " + i.toString();
    final enteredAmount = 2058.00;
    _selectedDate = DateTime.now();
    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }
    widget.addNewTransaction(
        enteredTitle,
        enteredAmount,
        _selectedDate
    );
  }


    Navigator.of(context).pop();
//                  print(titleController.text);
//                  print(amountController.text);
  }
  void _presentDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  onSubmitted: (_) => _submitData,

//                    onChanged: (whatever) {
//                    titleController = whatever;
//                    },
                ),
                TextField(decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData,
//                    onChanged: (value) {
//                    amountInput = value;
//                    },
                ),
                Container(
                  height: 70,
                  child:  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDate == null ? 'No Date Chosen': 'Picked Date: ${DateFormat.yMMMMd().format(_selectedDate)}'),
                      ),
                      AdaptiveFlatButton('Choose Date', _presentDatePicker),
                    ],
                  ),
                ),
                RaisedButton(
                  elevation: 5,
                  child: Text('Add Transaction',
                    style: TextStyle(color: Colors.white),),
                  onPressed: _submitData,
                  color: Theme.of(context).primaryColor,)
              ],)
        ),
      ),
    );
  }
}
