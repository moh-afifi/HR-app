import 'package:flutter/material.dart';

class DailyReportCard extends StatelessWidget {
  DailyReportCard({this.name, this.dept, this.time});
  final String name, dept, time;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      elevation: 10.0,
      color: Colors.yellow[200],
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name:                     $name',
              style: TextStyle(fontSize: 15, color: Colors.purple),
            ),
            Divider(
              color: Colors.black,
              endIndent: 50,
              indent: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Dep:                           $dept',
              style: TextStyle(fontSize: 15, color: Colors.purple),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.black,
              endIndent: 50,
              indent: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Arrival Time:                $time',
              style: TextStyle(fontSize: 15, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
