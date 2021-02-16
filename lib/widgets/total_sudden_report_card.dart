import 'package:emp/reports/sudden_report.dart';
import 'package:flutter/material.dart';

class TotalSuddenReportCard extends StatelessWidget {
  TotalSuddenReportCard({this.number, this.name});
  final String name, number;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[100],
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              number,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' :$name',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
