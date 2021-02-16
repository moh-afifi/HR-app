import 'package:flutter/material.dart';

class ReusableDepartment extends StatelessWidget {
  ReusableDepartment({this.text,this.icon,this.onTap,this.color});
  final String text;
  final IconData icon;
  final Function onTap;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Card(
              //margin: EdgeInsets.all(20.0),
//              color: Colors.purple,
              elevation: 10,
              child: Padding(
                padding:  EdgeInsets.only(left :15.0 , right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),),
                    Icon(icon,size: 40,color: color,),
                  ],
                ),
              ),
            ),
          ),
          onTap: onTap
      ),
    );
  }
}