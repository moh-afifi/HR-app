import 'package:flutter/material.dart';
import 'package:emp/screens/vacation/emp_page.dart';

class EmpHomeCard extends StatelessWidget {
  EmpHomeCard({this.imagePath, this.name,this.dept});
  final String imagePath;
  final String name;
  final String dept;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(imagePath),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        elevation: 5.0,
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmpPage(
              name: name,
              imagePath: imagePath,
              dept: dept,
            ),
          ),
        );
      },
    );
  }
}
