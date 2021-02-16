import 'package:emp/dialogs/already_enrolled_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:emp/dialogs/connect_dialog.dart';

class ConfirmRegularDialog extends StatefulWidget {
  ConfirmRegularDialog({this.from, this.to, this.numOfDays, this.name,this.date});
  final String from, to, numOfDays, name,date;
  @override
  _ConfirmRegularDialogState createState() => _ConfirmRegularDialogState();
}

class _ConfirmRegularDialogState extends State<ConfirmRegularDialog> {
  final _fireStore = Firestore.instance;
  int month;
  String dash;
  int regularNumber;
  //-------------------------------------------------------------
  void alreadyEnrolledDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlreadyEnrolledDialog(),
    );
  }

  //--------------------------------------------------------------
  void connectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConnectDialog(),
    );
  }
  //--------------------------------------------------------------
  @override
  void initState() {
    dash=(widget.date).substring(5,6);
    if(dash=='-'){
      month=int.parse((widget.date).substring(3,5));
    }else{
      month=int.parse((widget.date).substring(3,4));
    }
    super.initState();
  }
  //----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.warning,
          color: Colors.white,
          size: 50,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'من : ${widget.from}',
            style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'إلى : ${widget.to}',
            style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'عدد الأيام : ${widget.numOfDays}',
            style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          )
        ],
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
            'تأكيد',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            var connectivityResult = await (Connectivity().checkConnectivity());
            if ((connectivityResult == ConnectivityResult.mobile) ||
                (connectivityResult == ConnectivityResult.wifi)) {
              DocumentReference reference =
                  _fireStore.document("اعتيادي ${widget.name}/${widget.date}");
              Map<String, dynamic> myData = {
                'from': widget.from,
                'to': widget.to,
                'numOfDays': widget.numOfDays,
                'month':month
              };
              reference.setData(myData);
              //---------------------------------------
              DocumentSnapshot come = await _fireStore
                  .collection("اعتيادي")
                  .document(widget.name)
                  .get();
              if (come.exists) {
                regularNumber = come.data['number'];
              } else {
                regularNumber = 0;
              }
              //---------------------------------------------------
                DocumentReference reference2 = _fireStore
                    .document("اعتيادي/" + '${widget.name}');
                Map<String, dynamic> myData2 = {
                  'name': widget.name,
                  'number': (regularNumber + int.parse(widget.numOfDays))
                };
                reference2.setData(myData2);
              //-------------------------------------
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
              connectDialog();
            }
          },
        ),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
