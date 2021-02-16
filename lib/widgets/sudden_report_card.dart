import 'package:flutter/material.dart';

class SuddenReportCard extends StatelessWidget {
  SuddenReportCard({this.day});
  final String day;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[100],
      margin: EdgeInsets.all(15.0),
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          day,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
