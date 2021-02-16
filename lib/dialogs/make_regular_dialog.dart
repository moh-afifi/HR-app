import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:emp/dialogs/confirm_regular_dialog.dart';
import 'package:emp/dialogs/days_must_dialog.dart';
import 'package:emp/dialogs/over_regular_dialog.dart';

class MakeRegularDialog extends StatefulWidget {
  MakeRegularDialog({this.name, this.date});
  final String name, date;
  @override
  _MakeRegularDialogState createState() => _MakeRegularDialogState();
}

class _MakeRegularDialogState extends State<MakeRegularDialog> {
  int numOfDays = 0;
  int numOfRegular = 0;
  String fromDate, toDate;
  final _fireStore = Firestore.instance;
  //--------------------------------------------------------------
  void daysDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => DaysDialog(),
    );
  }

  //--------------------------------------------------------------
  void overRegularDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => OverRegularDialog(),
    );
  }

  //---------------------------------------------------
  void getRegularNumOfDays() async {
    await for (var snapshot
        in _fireStore.collection("اعتيادي ${widget.name}").snapshots()) {
      for (var message in snapshot.documents) {
        numOfRegular += int.parse(message.data['numOfDays']);
      }
    }
  }

  //--------------------------------------------------------------
  void confirmRegularDialog(
      String from, String to, String numOfDays, String name, String date) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmRegularDialog(
        from: from,
        to: to,
        numOfDays: numOfDays,
        name: name,
        date: date,
      ),
    );
  }

  @override
  void initState() {
    getRegularNumOfDays();
    super.initState();
  }

  //------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'تسجيل اعتيادي',
          style: TextStyle(
              fontSize: 25, color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              textAlign: TextAlign.start,
              onChanged: (value) {
                numOfDays = int.parse(value);
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ادخل عدد الايام",
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(
                    Icons.today,
                    color: Colors.white,
                    size: 33,
                  ),
                  onPressed: () async {
                    final List<DateTime> picked =
                        await DateRagePicker.showDatePicker(
                            context: context,
                            initialFirstDate: (new DateTime.now())
                                .subtract(new Duration(days: 2)),
                            initialLastDate: new DateTime.now(),
                            firstDate: new DateTime(2020),
                            lastDate: new DateTime(2021));
                    if (picked != null && picked.length == 2) {
                      String text = picked.toString();
                      print(text);
                      fromDate = text.substring(1, 11);
                      print(fromDate);
                      //--------------------------------------------------
                      String start = ',';
                      String end = ']';
                      final startIndex = text.indexOf(start);
                      final endIndex =
                          text.indexOf(end, startIndex + start.length);
                      toDate = text
                          .substring(startIndex + start.length, endIndex)
                          .substring(1, 11);
                      print(toDate);
                    }

                    if (fromDate == null || toDate == null) {
                      //do nothing
                    } else if (numOfDays == 0) {
                      Navigator.pop(context);
                      daysDialog();
                    } else {
                      print('${numOfDays + numOfRegular}');
                      if ((numOfDays + numOfRegular) > 21) {
                        Navigator.pop(context);
                        overRegularDialog();
                      } else {
                        Navigator.pop(context);
                        confirmRegularDialog(fromDate, toDate,
                            numOfDays.toString(), widget.name, widget.date);
                      }
                    }
                    //-------------------------------------------------
                  },
                ),
              ),
              Text(
                ': اختر التاريخ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
          //-----------------------------------------
        ],
      ),
      elevation: 8.0,
    );
  }
}
