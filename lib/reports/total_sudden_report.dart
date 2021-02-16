import 'package:emp/reports/sudden_report.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp/widgets/total_sudden_report_card.dart';
class TotalReport extends StatefulWidget {
  TotalReport({this.collectionName,this.onPressed});
  final String collectionName;
  final Function onPressed;
  @override
  _TotalReportState createState() => _TotalReportState();
}

class _TotalReportState extends State<TotalReport> {
  final _fireStore = Firestore.instance;
  String name,number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          widget.collectionName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection(widget.collectionName)
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
          List<Widget> reportList = [];

          for (var item in items) {
            name = item.data['name'];
            number = (item.data['number']).toString();

            final element = TotalSuddenReportCard(
              name:name ,
              number: number,
            );
            reportList.add(element);
          }

          //------------------------------------------------------
          return ListView(
            padding: EdgeInsets.all(15),
            children: reportList,
          );
        },
      ),
    );
  }
}
