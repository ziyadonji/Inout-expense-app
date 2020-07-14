
import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InOut'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
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
            UserTransaction(),
          ]),
        ],
      ),
    );
  }
}
