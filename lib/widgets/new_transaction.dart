import "package:flutter/material.dart";



class NewTransaction extends StatelessWidget {
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
                      decoration: InputDecoration(hintText: "title"),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "cost"),
                    ),
                    FlatButton(onPressed: (){},
                      child: Text('Add transaction',style: TextStyle(color: Colors.deepPurple[700]),),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}