import 'package:Inout/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "INOUT",
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  void _addTransaction(costt, tittle) {
    setState(
      () {
        _transaction.insert(
          0,
          Transaction(
            cost: costt,
            date: DateTime.now(),
            id: DateTime.now().toString(),
            title: tittle,
          ),
        );
      },
    );
  }

  final List<Transaction> _transaction = [
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _startAddNewTransaction(context);
              })
        ],
        title: Text('InOut'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
      ),
      body: ListView(
        children: [
          Column(children: [
            Container(
              child: Card(
                child: Center(child: Text("here is chart")),
              ),
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.all(10),
            ),
            TransactionList(_transaction),
          ]),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[700],
      ),
    );
  }
}
