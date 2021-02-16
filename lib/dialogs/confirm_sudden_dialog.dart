import 'package:flutter/material.dart';

class ConfirmSuddenDialog extends StatefulWidget {
  @override
  _ConfirmSuddenDialogState createState() => _ConfirmSuddenDialogState();
}

class _ConfirmSuddenDialogState extends State<ConfirmSuddenDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Image.asset(
        'images/check.gif',
        height: 150,
        width: 100,
      ),
      content: Text(
        'تم تسجيل العرضة بنجاح',
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
