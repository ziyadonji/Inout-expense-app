import 'package:flutter/material.dart';


import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List _transaction;
  TransactionList(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: _transaction.isEmpty?Column(
        children:[Text("No Transactions yet..!!",style: Theme.of(context).textTheme.headline6,),
        
        SizedBox(height:20)
          ,Container(height:200,child: Image.asset("assets/images/waiting.png",fit: BoxFit.cover,)),
        ],
      ):ListView.builder(
        itemCount: _transaction.length,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
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
                  '${_transaction[index].cost.toStringAsFixed(0)} Rs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _transaction[index].title,
                    style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateFormat.yMd().format(_transaction[index].date),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
