import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp/widgets/disease_report_card.dart';
import 'package:emp/widgets/total_days_card.dart';

class DiseaseReport extends StatefulWidget {
  DiseaseReport({this.name});
  final String name;
  @override
  _DiseaseReportState createState() => _DiseaseReportState();
}

class _DiseaseReportState extends State<DiseaseReport> {
  final _fireStore = Firestore.instance;
  String from, to, numOfDays,desc;
  int totalDays = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'تقرير المرضي',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection('مرضي ${widget.name}')
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
          List<Widget> diseaseReportList = [];

          for (var item in items) {
            from = item.data['from'];
            to = item.data['to'];
            numOfDays = item.data['numOfDays'];
            desc = item.data['desc'];
            totalDays += int.parse(numOfDays);
            final element = DiseaseReportCard(
              from: from,
              to: to,
              numOfDays: numOfDays,
              desc: desc,
            );
            diseaseReportList.add(element);
          }
          var totalCard = TotalCard(
            totalDays: totalDays.toString(),
          );
          diseaseReportList.insert(0, totalCard);
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
                        'لا يوجد مرضي حتى الآن',
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
                  children: diseaseReportList,
                );
        },
      ),
    );
  }
}
