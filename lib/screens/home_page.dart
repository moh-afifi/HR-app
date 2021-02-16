import 'package:flutter/material.dart';
import 'package:emp/screens/emp_data/home_emp_data.dart';
import 'vacation/home_vacation.dart';
import 'package:emp/reports/report_home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "الصفحة الرئيسية",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeVacation(),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.card_travel,
                          color: Colors.white,
                          size: 35,
                        ),
                        backgroundColor: Colors.pink,
                        radius: 30,
                      ),
                      Text(
                        'اجازات الموظفين',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeEmpData(),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 35,
                        ),
                        backgroundColor: Colors.pink,
                        radius: 30,
                      ),
                      Text(
                        'بيانات الموظفين',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportHome(),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.receipt,
                          color: Colors.white,
                          size: 35,
                        ),
                        backgroundColor: Colors.pink,
                        radius: 30,
                      ),
                      Text(
                        'التقارير المجمعة',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
