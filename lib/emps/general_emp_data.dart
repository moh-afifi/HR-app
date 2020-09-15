import 'package:emp/reusables/reusable_single_emp_data.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IotEmpData extends StatefulWidget {
  IotEmpData({this.docId});
  final String docId;
  @override
  _IotEmpDataState createState() => _IotEmpDataState();
}

class _IotEmpDataState extends State<IotEmpData> {
  final _firestore = Firestore.instance;
  String name,
      id,
      phone,
      age,
      joinDate,
      address,
      education,
      university,
      mail,
      dateOfBirth,
      socialStatus,
      experience,
      url,
      dept;
  String docid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          title: Text(
            "Employee Data",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
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

              List<SingleEmpData> myOrders = [];

              for (var message in messages) {
                name = message.data['name'];
                joinDate = message.data['joinDate'];
                phone = message.data['phone'];
                address = message.data['address'];
                age = message.data['age'];
                university = message.data['university'];
                mail = message.data['mail'];
                education = message.data['education'];
                dateOfBirth = message.data['birth'];
                socialStatus = message.data['status'];
                id = message.data['id'];
                experience = message.data['experience'];

                docid = message.data['docID'];
                dept = message.data['dept'];
                url = message.data['url'];

                final reusableSchedule = SingleEmpData(
                  name: name,
                  id: id,
                  address: address,
                  url: url,
                  education: education,
                  age: age,
                  dateOfBirth: dateOfBirth,
                  dept: dept,
                  experience: experience,
                  joinDate: joinDate,
                  mail: mail,
                  phone: phone,
                  socialStatus: socialStatus,
                  university: university,
                );

                if (widget.docId == docid) {
                  myOrders.add(reusableSchedule);
                }
              }
              return ListView(
                padding: EdgeInsets.all(15),
                children: myOrders,
              );
            }));
  }
}
