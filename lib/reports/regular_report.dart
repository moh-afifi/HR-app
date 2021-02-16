import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp/widgets/regular_report_card.dart';
import 'package:emp/widgets/total_days_card.dart';

class RegularReport extends StatefulWidget {
  RegularReport({this.name});
  final String name;
  @override
  _RegularReportState createState() => _RegularReportState();
}

class _RegularReportState extends State<RegularReport> {
  final _fireStore = Firestore.instance;
  String from, to, numOfDays;
  int totalDays=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'تقرير الاعتيادي',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection('اعتيادي ${widget.name}')
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
            from = item.data['from'];
            to = item.data['to'];
            numOfDays = item.data['numOfDays'];
            totalDays+=int.parse(numOfDays);
            final element = RegularReportCard(
              from: from,
              to: to,
              numOfDays: numOfDays,
            );
            suddenReportList.add(element);
          }
          var totalCard = TotalCard(totalDays: totalDays.toString(),);
          suddenReportList.insert(0, totalCard);
          //------------------------------------------------------
          return (from == null)
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
                        'لا يوجد اعتيادي حتى الآن',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : ListView(
                  padding: EdgeInsets.all(15),
                  children: suddenReportList,
                );
        },
      ),
    );
  }
}
