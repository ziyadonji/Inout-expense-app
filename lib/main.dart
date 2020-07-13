import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "INOUT",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      cost: 100,
      date: DateTime.now(),
      id: "1",
      title: "petrol",
    ),
    Transaction(
      cost: 50,
      date: DateTime.now(),
      id: "2",
      title: "book",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InOut'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Column(children: [
        Container(
          child: Card(
            child: Center(child: Text("here is chart")),
          ),
          width: double.infinity,
          height: 150,
          margin: EdgeInsets.all(20),
        ),
        Column(
          children:transaction.map((e) {
            return Card(
              child: Row(
                children:[
                  Container(
                    child: Text(e.cost.toString()),
                  ),
                  Column(children: <Widget>[
                    Text(e.title),
                    Text(e.date.toString()),
                  ],)
                ]
              ),
            );

          }).toList()
        )
      ]),
    );
  }
}
