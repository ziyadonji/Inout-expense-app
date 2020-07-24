import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalAmountSpent;
  final double amountPcntTotal;

  ChartBar({this.amountPcntTotal, this.label, this.totalAmountSpent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(totalAmountSpent.toString()),
        SizedBox(height: 2),
        Stack(
          children: <Widget>[
            Container(
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                
              ),
              height: 100,
              child: FractionallySizedBox(
              heightFactor: amountPcntTotal,
              child: Container(
                width: 10,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
              ),
            ),
            ),
            
          ],
        ),
        SizedBox(height: 2),
        Text(label),
        SizedBox(height: 5),
      ],
    );
  }
}
