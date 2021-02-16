import 'package:flutter/material.dart';

class InsertCard extends StatelessWidget {
  InsertCard({this.label, this.onTap});
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: TextStyle(
                    fontSize: 20,
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
