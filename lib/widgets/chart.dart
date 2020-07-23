import 'package:Inout/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Bar> get groupedTransactionValue {
    return List.generate(recentTransaction.length, (index) {
      var weakDay=DateTime.now().subtract(Duration(days: index));
      double amount=0;
      for(var i=0;i<recentTransaction.length;i++){
        if (weakDay.day==recentTransaction[i].date.day&&
            weakDay.hour==recentTransaction[i].date.hour&&
            weakDay.year==recentTransaction[i].date.year){
               amount+=recentTransaction[i].cost;
            }
            
      }
      return Bar(DateFormat.E(weakDay),amount);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 12, 15, 5),
      elevation: 6,
      child: Row(children: []),
    );
  }
}
