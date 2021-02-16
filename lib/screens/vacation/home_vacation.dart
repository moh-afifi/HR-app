import 'package:flutter/material.dart';
import 'package:emp/reusables/reusable_dept_card.dart';
import 'dev_emps_vacation.dart';
import 'iot_emps_vacation.dart';
import 'cyber_emps_vacation.dart';

class HomeVacation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'تسجيل الاجازات',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            ':من فضلك اختر القسم',
            style: TextStyle(fontSize: 30, color: Colors.pink),
          ),
          Divider(
            color: Colors.black,
            indent: 100,
            endIndent: 100,
          ),
          ReusableDepartment(
            text: 'Development',
            icon: Icons.android,
            color: Colors.teal,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DevEmpVacation(
                    appBarTitle: 'Development',
                  ),
                ),
              );
            },
          ),
          Divider(
            color: Colors.black,
            indent: 50,
            endIndent: 50,
          ),
          ReusableDepartment(
            text: 'IOT & GIS',
            icon: Icons.wifi,
            color: Colors.blueAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IotEmpVacation(
                    appBarTitle: 'IOT & GIS',
                  ),
                ),
              );
            },
          ),
          Divider(
            color: Colors.black,
            indent: 50,
            endIndent: 50,
          ),
          ReusableDepartment(
            text: 'Cyber Security',
            icon: Icons.security,
            color: Colors.pink,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CyberEmpVacation(
                    appBarTitle: 'Cyber Security',
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
