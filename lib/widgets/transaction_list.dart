import 'package:flutter/material.dart';

import 'package:intl/intl.dart';




class TransactionList extends StatelessWidget {
  final List _transaction;
  TransactionList(this._transaction);
  
  @override
  Widget build(BuildContext context) {
    return  Column(
              children: _transaction.map((e) {
            return Card(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Row(children: [
                Container(
                  width: 85,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(7, 7)),
                    border: Border.all(
                      color: Colors.deepPurple[500],
                      width: 2,
                    ),
                  ),
                  child: Text(
                    '${e.cost} Rs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      e.title,
                      style: TextStyle(
                          fontSize: 23,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat.yMd().format(e.date),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ]),
            );
          }).toList());
  }
}