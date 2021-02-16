import 'package:emp/dialogs/already_enrolled_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp/dialogs/confirm_sudden_dialog.dart';

class MakeSuddenDialog extends StatefulWidget {
  MakeSuddenDialog({this.name,this.today});
  final String name,today;

  @override
  _MakeSuddenDialogState createState() => _MakeSuddenDialogState();
}

class _MakeSuddenDialogState extends State<MakeSuddenDialog> {
  final _fireStore = Firestore.instance;
  int month;
  String dash;

  void confirmDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => ConfirmSuddenDialog(),
    );
  }

  void alreadyEnrolledDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlreadyEnrolledDialog(),
    );
  }

  @override
  void initState() {
    dash=(widget.today).substring(5,6);
    if(dash=='-'){
      month=int.parse((widget.today).substring(3,5));
    }else{
      month=int.parse((widget.today).substring(2,4));
      print(month);
    }
    super.initState();
  }
  //----------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.warning,color: Colors.white,size: 50,),
      ),
      content: Text(
        'هل تريد تسجيل العارضة ؟',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
        textAlign: TextAlign.center,
      ),
      elevation: 8.0,
      actions: <Widget>[
        SizedBox(
          width: 30,
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
          child: Text(
            'إلغاء',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        FlatButton(
          color: Colors.teal,
          child: Text(
            'موافق',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () async{
            Navigator.pop(context);
            DocumentReference reference = _fireStore
                .document("عارضة ${widget.name}/" + '${widget.today}');
            Map<String,dynamic> myData = {'date': widget.today,'month':month};
            reference.setData(myData);
            //---------------------------------------------------
            confirmDialog();

          },
        ),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
