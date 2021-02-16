import 'package:emp/widgets/daily_report_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyComeGoReport extends StatefulWidget {
  DailyComeGoReport({this.come, this.today});
  final bool come;
  final String today;
  @override
  _DailyComeGoReportState createState() => _DailyComeGoReportState();
}

class _DailyComeGoReportState extends State<DailyComeGoReport> {
  final _fireStore = Firestore.instance;
  String name, dept, time;
  String comeGo = 'حضور';
  //---------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          widget.today,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (widget.come == true)
            ? _fireStore.collection("حضور ${widget.today}").snapshots()
            : _fireStore.collection("انصراف ${widget.today}").snapshots(),
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
          List<Widget> dailyReportList = [];

          for (var item in items) {
            name = item.data['name'];
            dept = item.data['department'];
            time = item.data['time'];
            var element = DailyReportCard(
              name: name,
              dept: dept,
              time: time,
            );
            dailyReportList.add(element);
          }
          //------------------------------------------------------
          return (dailyReportList.length == 0)
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
                        'لم يتم تسجيل بيانات حتى الآن',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : ListView(
                  children: dailyReportList,
                );
        },
      ),
    );
  }
}
