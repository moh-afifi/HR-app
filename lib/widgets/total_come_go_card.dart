import 'package:flutter/material.dart';

class TotalComeGoCard extends StatelessWidget {
  TotalComeGoCard({this.date,this.name,this.time,this.dept});
  final String date;
  final String name;
  final String dept;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[100],
      margin: EdgeInsets.all(15.0),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontSize: 15, color: Colors.purple),
            ),
            Divider(
              color: Colors.black,
              endIndent: 50,
              indent: 50,
            ),
            Text(
              'التاريخ:        $date',
              style: TextStyle(fontSize: 15, color: Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'الوقت:          $time',
                style: TextStyle(fontSize: 15, color: Colors.purple),
              ),
            ),
            Divider(
              color: Colors.black,
              endIndent: 50,
              indent: 50,
            ),
            Text(
              dept,
              style: TextStyle(fontSize: 15, color: Colors.purple),
              textAlign: TextAlign.center,
            ),
          ],
        ),

      ),
    );
  }
}
