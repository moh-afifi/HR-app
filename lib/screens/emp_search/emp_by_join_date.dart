import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../reusables/reusable_emp_card.dart';

class EmpJoinDate extends StatefulWidget {
  EmpJoinDate({this.joinDate});
  final String joinDate;
  @override
  _EmpJoinDateState createState() => _EmpJoinDateState();
}

class _EmpJoinDateState extends State<EmpJoinDate> {
  final _firestore = Firestore.instance;
  String name, imagePath, dept, docID, myJoinDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text(
          'الموظفين',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('data').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }

          final messages = snapshot.data.documents.reversed;

          List<ReusableEmpCard> myOrders = [];

          for (var message in messages) {
            name = message.data['name'];
            imagePath = message.data['url'];
            dept = message.data['dept'];
            docID = message.data['docID'];
            myJoinDate = message.data['joinDate'];

            //-----------------------------------------------------------------
            final reusableSchedule = ReusableEmpCard(
              name: name,
              imagePath: imagePath,
              docId: docID,
            );

            //---------------------------------------------------------------
            if (widget.joinDate == myJoinDate) {
              myOrders.add(reusableSchedule);
            }
          }
          return ListView(
            padding: EdgeInsets.all(15),
            children: myOrders,
          );
        },
      ),
    );
  }
}
