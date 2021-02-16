import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp/widgets/sudden_report_card.dart';
import 'package:emp/widgets/total_days_card.dart';

class SuddenReport extends StatefulWidget {
  SuddenReport({this.name});
  final String name;
  @override
  _SuddenReportState createState() => _SuddenReportState();
}

class _SuddenReportState extends State<SuddenReport> {
  final _fireStore = Firestore.instance;
  String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'تقرير العوارض',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection('عارضة ${widget.name}')
            .orderBy('month')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }
          //--------------------------------------------------------
          final items = snapshot.data.documents;
          List<Widget> suddenReportList = [];

          for (var item in items) {
            date = item.data['date'];
            var element = SuddenReportCard(
              day: date,
            );
            suddenReportList.add(element);
          }
          var totalCard = TotalCard(
            totalDays: (suddenReportList.length).toString(),
          );
          suddenReportList.insert(0, totalCard);
          //------------------------------------------------------
          return (date == null)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.warning,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                      Text(
                        'لا توجد عوارض حتى الآن',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : ListView(
                  padding: EdgeInsets.all(15), children: suddenReportList);
        },
      ),
    );
  }
}
