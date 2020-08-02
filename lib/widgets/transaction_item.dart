import 'package:flutter/material.dart';
import "../models/transaction.dart";
import 'package:intl/intl.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.removeItem,
    @required this.transactionItem,
  }) : super(key: key);

  final Transaction transactionItem;
  final Function removeItem;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    '${transactionItem.cost.toStringAsFixed(0)} Rs',
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
                Text(transactionItem.title,
                    style:
                        Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat.yMMMd()
                      .format(transactionItem.date),
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
                  
                  return removeItem(
                      transactionItem.id);
                })
            : FlatButton.icon(
                onPressed: () {
                 
                  return removeItem(
                     transactionItem.id);
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
  }
}
