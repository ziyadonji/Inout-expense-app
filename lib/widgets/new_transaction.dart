import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final amount = TextEditingController();
  DateTime selectedDate;
  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate=value;
      });
      
    });
  }

  void submitData() {
    final titleEntered = title.text;
    final amountEntered = double.parse(amount.text);

    if (titleEntered.isEmpty || amountEntered <= -1) {
      return;
    }
    widget.addTransaction(amountEntered, titleEntered);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: title,
                decoration: InputDecoration(hintText: "title"),
                onSubmitted: (_) {
                  submitData();
                },
              ),
              TextField(
                onSubmitted: (_) {
                  submitData();
                },
                controller: amount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "cost"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('selected date',style:TextStyle(fontSize: 12,color: Colors.grey)),
                      SizedBox(height: 5,),
                      Text( (selectedDate==null?"No date Chosen":DateFormat.yMd().format(selectedDate)),style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  
                  FlatButton(
                      onPressed: presentDatePicker,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: RaisedButton(
                  elevation: 4,
                  onPressed: submitData,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Add transaction',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.button.color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
