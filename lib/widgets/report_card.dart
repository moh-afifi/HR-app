import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  ReportCard({this.label, this.icon, this.onTap});
  final String label;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(15.0),
        color: Colors.yellow[200],
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.purple,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
