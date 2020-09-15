import 'package:flutter/material.dart';
import '../reusables/reusable_dept_card.dart';
import 'iot_emps.dart';
import 'package:emp/screens/search_by_date.dart';
import 'package:emp/screens/search_by_skill.dart';
import 'package:emp/screens/dev_emps.dart';
import 'cyber_emps.dart';
import 'package:emp/components/rounded_button.dart';
import 'dart:io';

class Department extends StatefulWidget {
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  String searchBy = 'Join Date';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Center(child: Text('Warning',style: TextStyle(color: Colors.red),)),
          content: Text('Do you really want to exit ?'),
          actions: [
            FlatButton(
              child: Text('Yes'),
              onPressed: () => exit(0),
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ReusableDepartment(
                  text: 'IOT & GIS - 11',
                  icon: Icons.wifi,
                  color: Colors.purple,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IotEmps(),
                      ),
                    );
                  },
                ),
              ),
              //SizedBox(height: 10,),
              Divider(
                color: Colors.black,
                indent: 50,
                endIndent: 50,
              ),
              ///////////////////////////////////////////////////////////////////////////////////
              Expanded(
                child: ReusableDepartment(
                  text: 'Development - 27',
                  icon: Icons.android,
                  color: Colors.lightGreenAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DevEmps(),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.black,
                indent: 50,
                endIndent: 50,
              ),
              ///////////////////////////////////////////////////////////////////////////////////
              Expanded(
                child: ReusableDepartment(
                  text: 'Cyber Security - 13',
                  icon: Icons.security,
                  color: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CyberEmps(),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.black,
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(height: 10,),
              //---------------------------------------------------------------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Search By :',style: TextStyle(color: Colors.blueAccent,fontSize: 20,fontWeight: FontWeight.bold),),
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
                  ],
                ),
              ),
              //--------------------------------------------
              RoundedButton(
                  colour: Colors.teal,
                  title: 'Sreach',
                  onPressed: (){
                    if(searchBy=='Join Date'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchDate(),
                        ),
                      );
                    }
                    else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchSkill(),
                        ),
                      );
                    }
                  }
              ),

              //------------------------------------------------
              SizedBox(height: 10,)
            ],
          )
        ),
      ),
    );
  }
}
