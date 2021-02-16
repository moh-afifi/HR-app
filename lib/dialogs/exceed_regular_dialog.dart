import 'package:flutter/material.dart';

class ExceedRegularDialog extends StatefulWidget {
  @override
  _ExceedRegularDialogState createState() => _ExceedRegularDialogState();
}

class _ExceedRegularDialogState extends State<ExceedRegularDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.red,
        child: Icon(Icons.close,color: Colors.white,size: 50,),
      ),
      content: Text(
        'هذا الموظف استنفد أجازته',
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
