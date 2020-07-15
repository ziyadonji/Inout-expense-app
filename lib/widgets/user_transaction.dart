import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  var id='srt';
  void addTransaction( costt,tittle){
    
    
    setState(() {
      _transaction.insert(0, Transaction(cost: costt, date:DateTime.now(), id:DateTime.now().toString() , title: tittle));
      
    });

  }


  final List<Transaction> _transaction = [
    Transaction(
      cost: 100,
      date: DateTime.now(),
      id: "1",
      title: "petrol",
    ),
    Transaction(
      cost: 50,
      date: DateTime.now(),
      id: "2",
      title: "book",
    ),
  ];

  

  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: <Widget>[
        Container(
          height :150,child: SingleChildScrollView(child: NewTransaction(addTransaction))),
        TransactionList(_transaction),
      ],
    );
  }
}
