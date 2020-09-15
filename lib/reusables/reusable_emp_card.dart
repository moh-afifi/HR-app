import 'package:flutter/material.dart';
import 'package:emp/emps/general_emp_data.dart';
class ReusableEmpCard extends StatelessWidget {
  ReusableEmpCard({this.imagePath, this.name,this.docId});
  final String imagePath, name,docId;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                imagePath,
                height: 150,
                width: 150,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IotEmpData(
              docId: docId,
            ),
          ),
        );
      },
    );
  }
}
