//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import '../reusables/reusable_emp_card.dart';
//
//class IotEmps extends StatefulWidget {
//  @override
//  _IotEmpsState createState() => _IotEmpsState();
//}
//
//class _IotEmpsState extends State<IotEmps> {
//  final _firestore = Firestore.instance;
//  String name, imagePath, dept, docID;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'IOT & GIS',
//          style: TextStyle(fontSize: 35),
//        ),
//        centerTitle: true,
//        backgroundColor: Colors.blueAccent,
//      ),
//      body: StreamBuilder<QuerySnapshot>(
//        stream: _firestore.collection('data').snapshots(),
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
//          List<ReusableEmpCard> myOrders = [];
//
//
//          for (var message in messages) {
//            name = message.data['name'];
//            imagePath = message.data['url'];
//            dept = message.data['dept'];
//            docID = message.data['docID'];
//
//
//           //-----------------------------------------------------------------
//            final reusableSchedule = ReusableEmpCard(
//              name: name,
//              imagePath: imagePath,
//              docId: docID,
//            );
//
//            //---------------------------------------------------------------
//            if (dept == 'IOT & GIS') {
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
