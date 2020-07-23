import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      
      margin: EdgeInsets.fromLTRB(15, 12, 15, 5),
      elevation: 6,
      child: Row(children: [
        Text("data")
      ]),
    );
  }
}
