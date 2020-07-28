import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:intl/intl.dart';

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

                    Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Container(
                              width: 85,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(7, 7)),
                                border: Border.all(
                                  color: Colors.deepPurple[500],
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                height: 20,
                                child: FittedBox(
                                  child: Text(
                                    '${widget._transaction[index].cost.toStringAsFixed(0)} Rs',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(widget._transaction[index].title,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DateFormat.yMMMd()
                                      .format(widget._transaction[index].date),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        MediaQuery.of(context).size.width < 420
                            ? IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).errorColor,
                                ),
                                onPressed: () {
                                  print(widget._transaction[index].id);
                                  return widget.removeItem(
                                      widget._transaction[index].id);
                                })
                            : FlatButton.icon(
                                onPressed: () {
                                  print(widget._transaction[index].id);
                                  return widget.removeItem(
                                      widget._transaction[index].id);
                                },
                                label: Text("Delete"),
                                textColor: Theme.of(context).errorColor,
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).errorColor,
                                ),
                              ),
                      ]),
                );
              },
            ),
    );
  }
}
