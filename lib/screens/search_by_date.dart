import 'package:flutter/material.dart';
import 'package:emp/components/rounded_button.dart';
import 'package:emp/screens/emp_by_join_date.dart';
class SearchDate extends StatefulWidget {
  @override
  _SearchDateState createState() => _SearchDateState();
}

class _SearchDateState extends State<SearchDate> {

  String joinDate= '1-9-2019';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body:  Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Image.asset('images/logo1.jpg',),),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'وحدة التحول الرقمي',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Join Date:',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text('chooose'),
                value: joinDate,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
                elevation: 16,
                onChanged: (String newValue) {
                  setState(() {
                    joinDate = newValue;
                  });
                },
                items: <String>['1-9-2019', '1-11-2019', '1-2-2020', '1-7-2020']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 50,
              ),
              //----------------------------------------------------------
              Center(
                child: RoundedButton(title: 'Search' ,
                    colour: Colors.teal,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmpJoinDate(joinDate: joinDate,),
                        ),
                      );
                    }),
              ),
            ],
          ),
      ),
    );
  }
}



