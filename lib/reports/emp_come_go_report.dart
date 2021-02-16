//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:emp/widgets/daily_report_card.dart';
//class EmpComeGoReport extends StatefulWidget {
//  EmpComeGoReport({this.date,this.name});
//  final String date;
//  final String name;
//  @override
//  _EmpComeGoReportState createState() => _EmpComeGoReportState();
//}
//
//class _EmpComeGoReportState extends State<EmpComeGoReport> {
//  final _firestore = Firestore.instance;
//  String dept,time;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Come Report'),
//      ),
//      body: StreamBuilder<QuerySnapshot>(
//        stream: _firestore.collection("حضور ${widget.date}").snapshots(),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) {
//            return Center(
//              child: CircularProgressIndicator(
//                backgroundColor: Colors.blueAccent,
//              ),
//            );
//          }
//
//          final messages = snapshot.data.documents.reversed;
//
//
//          List<DailyReportCard> myOrders = [];
//
//
//          for (var message in messages) {
//            dept = message.data['department'];
//            time = message.data['time'];
//            //-----------------------------------------------------------------
//            final reusableSchedule = DailyReportCard(
//              name: widget.name,
//              dept: dept,
//              time: time,
//            );
//
//            //---------------------------------------------------------------
//            if (widget.name ==message.data['name']) {
//              myOrders.add(reusableSchedule);
//            }
//          }
//          return ListView(
//            padding: EdgeInsets.all(15),
//            children: myOrders,
//          );
//        },
//      ),
//    );
//  }
//}
