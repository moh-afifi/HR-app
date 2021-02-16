import 'package:flutter/material.dart';

class AlreadyEnrolledDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.warning,color: Colors.white,size: 50,),
      ),
      content: Text(
        'هذا الموظف تم تسجيله بالفعل',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
        textAlign: TextAlign.center,
      ),
      elevation: 8.0,
      actions: <Widget>[
        FlatButton(
          color: Colors.teal,
          child: Text(
            'موافق',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }
}
