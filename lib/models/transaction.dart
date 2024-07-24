import 'package:intl/intl.dart';

class Transaction {
  String id;
  String title;
  double value;
  DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.value,
      required this.date});

  String formatDataBR() {
    return DateFormat("dd/MM/yyyy").format(date);
  }
}
