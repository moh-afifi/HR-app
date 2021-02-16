//import 'package:flutter/material.dart';
//import '../reusables/reusable_dept_card.dart';
//import 'iot_emps.dart';
//import 'package:emp/screens/search_by_date.dart';
//import 'package:emp/screens/search_by_skill.dart';
//import 'package:emp/screens/dev_emps.dart';
//import 'cyber_emps.dart';
//import 'package:emp/components/rounded_button.dart';
//
//class Department extends StatefulWidget {
//  @override
//  _DepartmentState createState() => _DepartmentState();
//}
//
//class _DepartmentState extends State<Department> {
//  String searchBy = 'Join Date';
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.lightBlue,
//        centerTitle: true,
//        title: Text(
//          "Home",
//          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//        ),
//      ),
//      body: ListView(
//        children: <Widget>[
//          ReusableDepartment(
//            text: 'IOT & GIS - 11',
//            icon: Icons.wifi,
//            color: Colors.purple,
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => IotEmps(),
//                ),
//              );
//            },
//          ),
//          SizedBox(height: 15,),
//          Divider(
//            color: Colors.black,
//            indent: 50,
//            endIndent: 50,
//          ),
//          ///////////////////////////////////////////////////////////////////////////////////
//          ReusableDepartment(
//            text: 'Development - 27',
//            icon: Icons.android,
//            color: Colors.lightGreenAccent,
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => DevEmps(),
//                ),
//              );
//            },
//          ),
//          SizedBox(height: 15,),
//          Divider(
//            color: Colors.black,
//            indent: 50,
//            endIndent: 50,
//          ),
//          ///////////////////////////////////////////////////////////////////////////////////
//          ReusableDepartment(
//            text: 'Cyber Security - 13',
//            icon: Icons.security,
//            color: Colors.red,
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => CyberEmps(),
//                ),
//              );
//            },
//          ),
//          SizedBox(height: 15,),
//          Divider(
//            color: Colors.black,
//            indent: 50,
//            endIndent: 50,
//          ),
//          //---------------------------------------------------------------
//          Padding(
//            padding: EdgeInsets.all(25.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text('Search By :',style: TextStyle(color: Colors.blueAccent,fontSize: 20,fontWeight: FontWeight.bold),),
//                SizedBox(
//                  height: 20,
//                ),
//                DropdownButton<String>(
//                  isExpanded: true,
//                  hint: Text('chooose'),
//                  value: searchBy,
//                  icon: Icon(Icons.keyboard_arrow_down),
//                  iconSize: 24,
//                  elevation: 16,
//                  onChanged: (String newValue) {
//                    setState(() {
//                      searchBy = newValue;
//                    });
//                  },
//                  items: <String>['Join Date', 'Skils']
//                      .map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value),
//                    );
//                  }).toList(),
//                )
//              ],
//            ),
//          ),
//          //------------------------------------------------
//          Padding(
//            padding:  EdgeInsets.all(20.0),
//            child: RoundedButton(
//                colour: Colors.teal,
//                title: 'Sreach',
//                onPressed: (){
//                  if(searchBy=='Join Date'){
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => SearchDate(),
//                      ),
//                    );
//                  }
//                  else{
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => SearchSkill(),
//                      ),
//                    );
//                  }
//                }),
//          )
//        ],
//      ),
//    );
//  }
//}
//import 'package:emp/reusables/reusable_single_emp_data.dart';
//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class IotEmpData extends StatefulWidget {
//  IotEmpData({this.docId});
//  final String docId;
//  @override
//  _IotEmpDataState createState() => _IotEmpDataState();
//}
//
//class _IotEmpDataState extends State<IotEmpData> {
//  final _firestore = Firestore.instance;
//  String name,
//      id,
//      phone,
//      age,
//      joinDate,
//      address,
//      education,
//      university,
//      mail,
//      dateOfBirth,
//      socialStatus,
//      experience,
//      url,
//      dept;
//  String docid;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.lightBlue,
//          centerTitle: true,
//          title: Text(
//            "Employee Data",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//          ),
//        ),
//        body: StreamBuilder<QuerySnapshot>(
//            stream: _firestore.collection('data').snapshots(),
//            builder: (context, snapshot) {
//              if (!snapshot.hasData) {
//                return Center(
//                  child: CircularProgressIndicator(
//                    backgroundColor: Colors.blueAccent,
//                  ),
//                );
//              }
//
//              final messages = snapshot.data.documents.reversed;
//
//              List<SingleEmpData> myOrders = [];
//
//              for (var message in messages) {
//                name = message.data['name'];
//                joinDate = message.data['joinDate'];
//                phone = message.data['phone'];
//                address = message.data['address'];
//                age = message.data['age'];
//                university = message.data['university'];
//                mail = message.data['mail'];
//                education = message.data['education'];
//                dateOfBirth = message.data['birth'];
//                socialStatus = message.data['status'];
//                id = message.data['id'];
//                experience = message.data['experience'];
//
//                docid = message.data['docID'];
//                dept = message.data['dept'];
//                url = message.data['url'];
//
//                final reusableSchedule = SingleEmpData(
//                  name: name,
//                  id: id,
//                  address: address,
//                  url: url,
//                  education: education,
//                  age: age,
//                  dateOfBirth: dateOfBirth,
//                  dept: dept,
//                  experience: experience,
//                  joinDate: joinDate,
//                  mail: mail,
//                  phone: phone,
//                  socialStatus: socialStatus,
//                  university: university,
//                );
//
//                if (widget.docId == docid) {
//                  myOrders.add(reusableSchedule);
//                }
//              }
//              return ListView(
//                padding: EdgeInsets.all(15),
//                children: myOrders,
//              );
//            }));
//  }
//}
