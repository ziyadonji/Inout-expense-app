import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  final title = TextEditingController();
  final amount = TextEditingController();

  void submitData() {
    final titleEntered = title.text;
    final amountEntered = double.parse(amount.text);
    if (titleEntered.isEmpty || amountEntered<=-1) {
      return;
    }
    addTransaction(amountEntered, titleEntered);
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
              FlatButton(
                onPressed: submitData,
                child: Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.deepPurple[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
