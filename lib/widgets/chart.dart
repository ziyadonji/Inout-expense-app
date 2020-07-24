import 'package:Inout/models/transaction.dart';
import 'package:Inout/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Bar> get groupedTransactionValue {
    return List.generate(7, (index) {
      var weakDay=DateTime.now().subtract(Duration(days: index));
      double amount=0;
      for(var i=0;i<recentTransaction.length;i++){
        if (weakDay.day==recentTransaction[i].date.day&&
            weakDay.hour==recentTransaction[i].date.hour&&
            weakDay.year==recentTransaction[i].date.year){
               amount+=recentTransaction[i].cost;
            }
            
      }
      print(amount);
      print(DateFormat.E().format(weakDay));
      return Bar(DateFormat.E().format(weakDay),double.parse(amount.toStringAsFixed(0)));
      
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      margin: EdgeInsets.fromLTRB(15, 12, 15, 5),
      elevation: 6,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        ...groupedTransactionValue.map((e) {
          return 
          ChartBar(amountPcntTotal:.5 ,label: e.day,totalAmountSpent: double.parse(e.amount.toString()));
          
          
        })
      ]),
    );
  }
}
