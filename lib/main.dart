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
          margin: EdgeInsets.all(10),
        ),
        Column(
            children: transaction.map((e) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 15,
            vertical: 5,),
            child: Row(children: [
              Container(
                width: 85,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple[500],
                    width: 2,
                  ),
                ),
                child: Text(
                  
                  e.cost.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[600],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    e.title,
                    style: TextStyle(fontSize: 23,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black),
                  ),
                  SizedBox(height: 10,),
                  Text(e.date.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color:Colors.grey,
                  ),),
                ],
              )
            ]),
          );
        }).toList())
      ]),
    );
  }
}
