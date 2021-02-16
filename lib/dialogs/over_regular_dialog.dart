import 'package:flutter/material.dart';

class OverRegularDialog extends StatefulWidget {
  @override
  _OverRegularDialogState createState() => _OverRegularDialogState();
}

class _OverRegularDialogState extends State<OverRegularDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.red,
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 50,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'لا يمكن الزيادة عن 21 يوم اعتيادي',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15,),
          FlatButton(
            color: Colors.teal,
            child: Text(
              'موافق',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      elevation: 8.0,

    );
  }
}
