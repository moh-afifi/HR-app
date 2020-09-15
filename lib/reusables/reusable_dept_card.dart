import 'package:flutter/material.dart';

class ReusableDepartment extends StatelessWidget {
  ReusableDepartment({this.text,this.icon,this.onTap,this.color});
  final String text;
  final IconData icon;
  final Function onTap;
final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: Card(
            color: Colors.cyan,
            elevation: 10,
            child: Padding(
              padding:  EdgeInsets.only(left :15.0 , right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  Icon(icon,size: 40,color: color,),
                ],
              ),
            ),
          ),
        ),
        onTap: onTap
    );
  }
}