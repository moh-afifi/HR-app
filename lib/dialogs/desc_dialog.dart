import 'package:flutter/material.dart';

class DescDialog extends StatefulWidget {
  @override
  _DescDialogState createState() => _DescDialogState();
}

class _DescDialogState extends State<DescDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.red,
        child: Icon(Icons.close,color: Colors.white,size: 50,),
      ),
      content: Text(
        'برجاء ادخال التشخيص',
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
