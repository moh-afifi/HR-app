import 'package:flutter/material.dart';

class ComeGoCard extends StatelessWidget {
  ComeGoCard({this.text,this.icon,this.cardColor,this.onTap});
  final Color cardColor ;
  final String text;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          color: cardColor,
          elevation: 10.0,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.yellow,
                  child: Icon(
                    icon,
                    color: Colors.purple,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        onTap:onTap
    );
  }
}
