import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:emp/dialogs/confirm_gift_dialog.dart';
import 'package:emp/dialogs/days_must_dialog.dart';

class MakeGiftDialog extends StatefulWidget {
  MakeGiftDialog({this.name,this.date});
  final String name,date;
  @override
  _MakeGiftDialogState createState() => _MakeGiftDialogState();
}

class _MakeGiftDialogState extends State<MakeGiftDialog> {
  int numOfDays=0;
  String fromDate, toDate;
  //--------------------------------------------------------------
  void daysDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => DaysDialog(),
    );
  }
  //--------------------------------------------------------------
  void confirmGiftDialog(
      String from, String to, String numOfDays, String name,String date) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmGiftDialog(
        from: from,
        to: to,
        numOfDays: numOfDays,
        name: name,
        date: date,
      ),
    );
  }

  //------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'تسجيل منحة',
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

                    if (
                    fromDate == null ||
                        toDate == null) {
                    }else if(numOfDays==0){
                      Navigator.pop(context);
                      daysDialog();
                    }
                    else {
                      Navigator.pop(context);
                      confirmGiftDialog(
                          fromDate, toDate, numOfDays.toString(), widget.name,widget.date);
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
