import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          SizedBox(height: constraints.maxHeight *.03),
          Container(
              height: constraints.maxHeight *.15,
              child:
                  FittedBox(child: Text(widget.totalAmountSpent.toString()))),
          SizedBox(height:constraints.maxHeight *.03 ),
          Container(
            height: constraints.maxHeight *.6,
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
                  height: constraints.maxHeight *.6,
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
          SizedBox(height: constraints.maxHeight *.04),
          Container(child: Text(widget.label,),
          height: constraints.maxHeight *.15,),
          
        ],
      );
    });
  }
}
