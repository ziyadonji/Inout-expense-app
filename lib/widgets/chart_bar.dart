import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  final String label;
  final double totalAmountSpent;
  final double amountPcntTotal;

  ChartBar({this.amountPcntTotal, this.label, this.totalAmountSpent});

  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
         Container(
           height: 20,
           child: FittedBox(child: Text(widget.totalAmountSpent.toString()))),
        SizedBox(height: 2),
        Container(
          height: 100,
          child: Stack(
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
                
              ),
               FractionallySizedBox(
                heightFactor: widget.amountPcntTotal,
                child: Container(
                  width: 10,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()),
                ),
              ),
              
            ],
          ),
        ),
        SizedBox(height: 2),
        Text(widget.label),
        SizedBox(height: 5),
      ],
    );
  }
}
