
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {

  final String text;
  final Function handler;

  AdaptiveFlatButton({this.text,this.handler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            onPressed: handler,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          )
                        : FlatButton(
                            onPressed: handler,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          );
  }
}