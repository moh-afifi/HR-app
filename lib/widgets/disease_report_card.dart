import 'package:flutter/material.dart';

class DiseaseReportCard extends StatelessWidget {
  DiseaseReportCard({this.from, this.to, this.numOfDays,this.desc});
  final String from, to, numOfDays,desc;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[100],
      margin: EdgeInsets.all(15.0),
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'من : $from',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black,indent: 50,endIndent: 50,),
            Text(
              'إلى :  $to',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black,indent: 50,endIndent: 50,),
            Text(
              'عدد الأيام : $numOfDays أيام',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black,indent: 50,endIndent: 50,),
            Text(
              'التشخيص :$desc ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
