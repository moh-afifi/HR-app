import 'package:flutter/material.dart';
import '../reusables/reusable_dept_card.dart';
import 'package:emp/screens/emp_search/search_by_date.dart';
import 'package:emp/screens/emp_search/search_by_skill.dart';
import 'package:emp/components/rounded_button.dart';
import 'dart:io';
import 'package:emp/screens/department_emps.dart';

class HomeEmpData extends StatefulWidget {
  @override
  _HomeEmpDataState createState() => _HomeEmpDataState();
}

class _HomeEmpDataState extends State<HomeEmpData> {
  String searchBy = 'Join Date';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ReusableDepartment(
            text: 'IOT & GIS - 11',
            icon: Icons.wifi,
            color: Colors.yellow,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeptEmps(
                    department: 'IOT & GIS',
                  ),
                ),
              );
            },
          ),
          //SizedBox(height: 10,),
          Divider(
            color: Colors.black,
            indent: 50,
            endIndent: 50,
          ),
          ///////////////////////////////////////////////////////////////////////////////////
          ReusableDepartment(
            text: 'Development - 27',
            icon: Icons.android,
            color: Colors.lightGreenAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeptEmps(
                    department: 'Development',
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
          ///////////////////////////////////////////////////////////////////////////////////
          ReusableDepartment(
            text: 'Cyber Security - 13',
            icon: Icons.security,
            color: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeptEmps(
                    department: 'Cyber Security',
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
          SizedBox(
            height: 10,
          ),
          //---------------------------------------------------------------
          Text(
            'Search By :',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButton<String>(
            isExpanded: true,
            hint: Text('chooose'),
            value: searchBy,
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            onChanged: (String newValue) {
              setState(() {
                searchBy = newValue;
              });
            },
            items: <String>['Join Date', 'Skills']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20,),
          //--------------------------------------------
          Center(
            child: RoundedButton(
                colour: Colors.teal,
                title: 'Sreach',
                onPressed: () {
                  if (searchBy == 'Join Date') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchDate(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchSkill(),
                      ),
                    );
                  }
                }),
          ),

          //------------------------------------------------
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
