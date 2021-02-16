import 'package:flutter/material.dart';

class DaysDialog extends StatefulWidget {
  @override
  _DaysDialogDialogState createState() => _DaysDialogDialogState();
}

class _DaysDialogDialogState extends State<DaysDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.red,
        child: Icon(Icons.close,color: Colors.white,size: 50,),
      ),
      content: Text(
        'برجاء إدخال عدد الأيام',
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
          width: 90,
        ),
      ],
    );
  }
}
