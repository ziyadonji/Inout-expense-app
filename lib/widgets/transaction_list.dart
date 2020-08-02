import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './transaction_item.dart';

class TransactionList extends StatefulWidget {
  final Function removeItem;

  final List _transaction;
  TransactionList(this._transaction, this.removeItem);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: widget._transaction.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    "No Transactions yet..!!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: constraints.maxHeight * .7,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      )),
                ],
              );
            })
          : ListView.builder(
              itemCount: widget._transaction.length,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return
                    //  Padding(
                    //    padding: const EdgeInsets.symmetric(horizontal: 10),
                    //    child: Card(

                    //      elevation: 4,
                    //                 child: ListTile(
                    //        title: Text( _transaction[index].title,style: Theme.of(context).textTheme.headline6),
                    //        subtitle: Text(DateFormat.yMMMd().format(_transaction[index].date),
                    //                style: TextStyle(
                    //                 fontSize: 14,
                    //                ),),
                    //        leading: CircleAvatar(
                    //          radius: 30,
                    //          child:Padding(
                    //            padding: const EdgeInsets.symmetric( horizontal: 6),
                    //            child: FittedBox(child: Text('${_transaction[index].cost.toStringAsFixed(0)} Rs')),
                    //          )
                    //        ),

                    //      ),
                    //    ),
                    //  );

                    TransactionItem(transactionItem: widget._transaction[index],removeItem:widget.removeItem);
              },
            ),
    );
  }
}

