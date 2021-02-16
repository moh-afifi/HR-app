import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import '../../reusables/reusable_dept_card.dart';
import 'package:emp/screens/emp_search/search_by_date.dart';
import 'package:emp/screens/emp_search/search_by_skill.dart';
import 'package:emp/components/rounded_button.dart';
import 'package:emp/screens/emp_data/department_emps.dart';

class HomeEmpData extends StatefulWidget {
  @override
  _HomeEmpDataState createState() => _HomeEmpDataState();
}

class _HomeEmpDataState extends State<HomeEmpData> {
  String searchBy = 'Join Date';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body:  Builder(
        builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ReusableDepartment(
            text: 'IOT & GIS',
            icon: Icons.wifi,
            color: Colors.blueAccent,
            onTap: () async{
              var connectivityResult =
              await (Connectivity().checkConnectivity());
              if ((connectivityResult != ConnectivityResult.mobile) &&
                  (connectivityResult != ConnectivityResult.wifi)) {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  backgroundColor: Colors.black,
                  duration: Duration(seconds: 2),
                  content: Text(
                    "No internet Connection !",
                    style: TextStyle(fontSize: 17),
                  ),
                ));
              }else{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeptEmps(
                      department: 'IOT & GIS',
                    ),
                  ),
                );
              }
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
            text: 'Development',
            icon: Icons.android,
            color: Colors.teal,
            onTap: () async{
              var connectivityResult =
              await (Connectivity().checkConnectivity());
              if ((connectivityResult != ConnectivityResult.mobile) &&
                  (connectivityResult != ConnectivityResult.wifi)) {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  backgroundColor: Colors.black,
                  duration: Duration(seconds: 2),
                  content: Text(
                    "No internet Connection !",
                    style: TextStyle(fontSize: 17),
                  ),
                ));
              }else{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeptEmps(
                      department: 'Development',
                    ),
                  ),
                );
              }
            },
          ),
          Divider(
            color: Colors.black,
            indent: 50,
            endIndent: 50,
          ),
          ///////////////////////////////////////////////////////////////////////////////////
          ReusableDepartment(
            text: 'Cyber Security',
            icon: Icons.security,
            color: Colors.red,
            onTap: () async{
              var connectivityResult =
              await (Connectivity().checkConnectivity());
              if ((connectivityResult != ConnectivityResult.mobile) &&
                  (connectivityResult != ConnectivityResult.wifi)) {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  backgroundColor: Colors.black,
                  duration: Duration(seconds: 2),
                  content: Text(
                    "No internet Connection !",
                    style: TextStyle(fontSize: 17),
                  ),
                ));
              }else{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeptEmps(
                      department: 'Cyber Security',
                    ),
                  ),
                );
              }

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
          Container(
            padding: EdgeInsets.symmetric(horizontal:30),
            child: Column(
              children: <Widget>[
                Text(
                  'Search By :',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width:150,
                      child: DropdownButton<String>(
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
                    ),
                    SizedBox(width: 20,),
                    RoundedButton(
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
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 50,),
          //--------------------------------------------
        ],
      ),),
    );
  }
}
