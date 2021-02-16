import 'package:flutter/material.dart';

class TotalCard extends StatelessWidget {
  TotalCard({this.totalDays});
  final String totalDays;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('اجمالي الأيام : $totalDays يوم ',
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
