import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart'
;
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {

    return transactions.isEmpty ? Column(children: <Widget>[
        Text('No Transactions added yet!', style: Theme.of(context).textTheme.title,),
        SizedBox(height: 20,),
        Container(
          height: 200,
          child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
        )
      ],) : ListView.builder(
        itemBuilder: (context, index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text('\R${transactions[index].amount}'),),
                  )
              ),
              title: Text(transactions[index].title, style: Theme.of(context).textTheme.title,),
              subtitle: Text(DateFormat.yMMMMd().format(transactions[index].date)),
              trailing: MediaQuery.of(context).size.width > 460 ? FlatButton.icon(onPressed: () => deleteTransaction(transactions[index].id) , icon: Icon(Icons.delete), label: Text('Delete'), textColor: Theme.of(context).errorColor,) : IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => deleteTransaction(transactions[index].id),),
            ),
          );
        },
        itemCount: transactions.length,
    );
  }
}
