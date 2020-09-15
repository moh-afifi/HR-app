import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../reusables/reusable_emp_card.dart';

class EmpSkill extends StatefulWidget {
  EmpSkill({this.skill});
  final String skill;
  @override
  _EmpSkillState createState() => _EmpSkillState();
}

class _EmpSkillState extends State<EmpSkill> {
  final _firestore = Firestore.instance;
  String name, imagePath, exp, docID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employees',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
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
            docID = message.data['docID'];
            exp = message.data['experience'];

            //-----------------------------------------------------------------
            final reusableSchedule = ReusableEmpCard(
              name: name,
              imagePath: imagePath,
              docId: docID,
            );

            //---------------------------------------------------------------
            if (exp.toLowerCase().contains(widget.skill.toLowerCase())) {
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
