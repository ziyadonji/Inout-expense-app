

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import '../widgets/adaptive_flat_button.dart';

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
        selectedDate = value;
      });
    });
  }

  void submitData() {
    final titleEntered = title.text;
    final amountEntered = double.parse(amount.text);

    if (titleEntered.isEmpty || amountEntered <= -1 || selectedDate == null) {
      return;
    }

    widget.addTransaction(amountEntered, titleEntered, selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Card(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                10, 10, 10, MediaQuery.of(context).viewInsets.bottom + 10),
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
                        Text(
                          (selectedDate == null
                              ? "No date Chosen"
                              : DateFormat.yMd().format(selectedDate)),
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                   AdaptiveFlatButton(text: "Choose Date", handler:  presentDatePicker,)
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
      ),
    );
  }
}
