import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _YserTransactionState createState() => _YserTransactionState();
}

class _YserTransactionState extends State<UserTransaction> {
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
        NewTransaction(),
        TransactionList(_transaction),
      ],
    );
  }
}
