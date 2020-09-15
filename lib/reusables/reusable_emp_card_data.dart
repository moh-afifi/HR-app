import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableEmpData extends StatelessWidget {
  ReusableEmpData({this.label, this.data});
  final String label, data;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      color: Colors.white,
      elevation: 5,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                fontSize: 17, color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                data,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
