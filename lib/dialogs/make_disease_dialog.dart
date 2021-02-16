import 'package:emp/dialogs/desc_dialog.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:emp/dialogs/confirm_disease_dialog.dart';
import 'package:emp/dialogs/days_must_dialog.dart';

class MakeDiseaseDialog extends StatefulWidget {
  MakeDiseaseDialog({this.name,this.date});
  final String name,date;
  @override
  _MakeDiseaseDialogState createState() => _MakeDiseaseDialogState();
}

class _MakeDiseaseDialogState extends State<MakeDiseaseDialog> {
  int numOfDays=0;
  String fromDate, toDate,desc;
  //--------------------------------------------------------------
  void daysDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => DaysDialog(),
    );
  }
  //--------------------------------------------------------------
  void descDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => DescDialog(),
    );
  }
  //--------------------------------------------------------------
  void confirmDiseaseDialog(
      String from, String to, String numOfDays, String name,String date,String desc) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmDiseaseDialog(
        from: from,
        to: to,
        numOfDays: numOfDays,
        name: name,
        date: date,
        desc: desc,
      ),
    );
  }

  //------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'تسجيل مرضي',
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
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              textAlign: TextAlign.start,
              onChanged: (value) {
                desc=value;
              },

              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ادخل التشخيص",
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
                    }else if(desc==null){
                      Navigator.pop(context);
                      descDialog();
                    }
                    else {
                      Navigator.pop(context);
                      confirmDiseaseDialog(
                          fromDate, toDate, numOfDays.toString(), widget.name,widget.date,desc);
                    }
                    //-------------------------------------------------
                  },
                ),
              ),
              Text(
                ': اختر التاريخ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
      elevation: 8.0,
    );
  }
}
