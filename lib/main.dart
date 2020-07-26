import 'package:Inout/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "INOUT",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amberAccent,
        fontFamily: 'Gruppo',
        textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          headline6: TextStyle(
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gruppo'),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
                fontSize: 25,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gruppo'),
          ),
        ),
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
  void removeItem(index){
    setState(() {
      _transaction.removeWhere((element) => element.id==index);
    });
     

  }


  void _addTransaction(costt, tittle,DateTime chosedDate) {
    setState(
      () {
        _transaction.insert(
          0,
          Transaction(
            cost: costt,
            date: chosedDate,
            id: DateTime.now().toString(),
            title: tittle,
          ),
        );
      },
    );
  }
    



   final  List<Transaction> _transaction = [
    // Transaction(
    //   cost: 100,
    //   date: DateTime.now(),
    //   id: "1",
    //   title: "petrol",
    // ),
    // Transaction(
    //   cost: 50,
    //   date: DateTime.now(),
    //   id: "2",
    //   title: "book",
    // ),
  ];
  
   List<Transaction> get _recentTransactions{
     return _transaction.where((element){
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));

     }).toList();

   }
   
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
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: ListView(
        children: [
          Column(children: [
            Chart(_recentTransactions),
            TransactionList(_transaction,removeItem),
          ]),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
