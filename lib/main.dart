import 'package:Inout/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
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
              button:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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

  void removeItem(index) {
    setState(() {
      _transaction.removeWhere((element) => element.id == index);
    });
  }

  void _addTransaction(costt, tittle, DateTime chosedDate) {
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

  final List<Transaction> _transaction = [
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
  bool _showChart =false;
  List<Transaction> get _recentTransactions {
    return _transaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    
    final isLandScape= MediaQuery.of(context).orientation==Orientation.landscape;
    final appBar = AppBar(
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
    );
    final txList=Container(
              child: TransactionList(_transaction, removeItem),
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.7,
            );
    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: [
          Column(children: [
            if(isLandScape)
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Text('show chart',),
                Switch(value: _showChart, onChanged: (newValue){
                  setState(() {
                    _showChart=newValue;
                  });
                })
              ],
            ),
            if(isLandScape)_showChart?
            Container(
              child: Chart(
                _recentTransactions,
              ),
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.7,
            ):txList,
            if(!isLandScape) Container(
              child: Chart(
                _recentTransactions,
              ),
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.3,
            ),
            if(!isLandScape)txList
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
