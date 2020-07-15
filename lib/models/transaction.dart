import 'package:flutter/foundation.dart';


class Transaction {
  final double cost;
  final String title;
  final String id;
  final DateTime date;

  Transaction({
    @required this.cost,
    @required this.date,
    @required this.id,
    @required this.title,
  });
}
