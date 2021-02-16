import 'package:connectivity/connectivity.dart';
import 'package:emp/dialogs/connect_dialog.dart';
import 'package:emp/reports/daily_come_go_report.dart';
import 'package:emp/reports/disease_report.dart';
import 'package:emp/reports/gift_report.dart';
import 'package:emp/reports/regular_report.dart';
import 'package:emp/reports/sudden_report.dart';
import 'package:emp/reports/total_sudden_report.dart';
import 'package:emp/widgets/report_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ReportHome extends StatefulWidget {
  @override
  _ReportHomeState createState() => _ReportHomeState();
}

class _ReportHomeState extends State<ReportHome> {
  String today;
  bool showSpinner = false;
  String from, to, monthFrom, monthTo, year;
  String name, dept, time;
  //--------------------------------------------------------------------
  getDate() {
    initializeDateFormatting("en", null).then((_) {
      var now = DateTime.now();
      var formatter = DateFormat('d-M-y');
      today = formatter.format(now);
    });
  }

  //---------------------------------------------------
  void connectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConnectDialog(),
    );
  }

  //-----------------------------------------

  @override
  void initState() {
    getDate();
    super.initState();
  }

  //--------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "التقارير المجمعة",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Builder(
        builder: (context) => ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                color: Colors.yellow[200],
                margin: EdgeInsets.all(15.0),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'التقرير اليومي',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            color: Colors.purple),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailyComeGoReport(
                                    come: false,
                                    today: today,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'تقرير الانصراف',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            color: Colors.red,
                            padding: EdgeInsets.all(15.0),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailyComeGoReport(
                                    come: true,
                                    today: today,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'تقرير الحضور',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            color: Colors.teal,
                            padding: EdgeInsets.all(15.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ReportCard(
                label: 'تقرير العارضة',
                icon: Icons.perm_contact_calendar,
                onTap: () async {
                  var connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if ((connectivityResult == ConnectivityResult.mobile) ||
                      (connectivityResult == ConnectivityResult.wifi)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TotalReport(
                          collectionName: 'عوارض',
                          onPressed: (){

                          },
                        ),
                      ),
                    );
                  } else {
                    connectDialog();
                  }
                },
              ),
              ReportCard(
                label: 'تقرير الاعتيادي',
                icon: Icons.person,
                onTap: () async {
                  var connectivityResult =
                  await (Connectivity().checkConnectivity());
                  if ((connectivityResult == ConnectivityResult.mobile) ||
                      (connectivityResult == ConnectivityResult.wifi)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TotalReport(
                          collectionName: 'اعتيادي',
                          onPressed: (){

                          },
                        ),
                      ),
                    );
                  } else {
                    connectDialog();
                  }
                },
              ),
              ReportCard(
                label: 'تقرير المرضي',
                icon: Icons.local_hospital,
                onTap: () async {
                  var connectivityResult =
                  await (Connectivity().checkConnectivity());
                  if ((connectivityResult == ConnectivityResult.mobile) ||
                      (connectivityResult == ConnectivityResult.wifi)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TotalReport(
                          collectionName: 'مرضي',
                          onPressed: (){

                          },
                        ),
                      ),
                    );
                  } else {
                    connectDialog();
                  }
                },
              ),
              ReportCard(
                label: 'تقرير المنح',
                icon: Icons.card_giftcard,
                onTap: () async {
                  var connectivityResult =
                  await (Connectivity().checkConnectivity());
                  if ((connectivityResult == ConnectivityResult.mobile) ||
                      (connectivityResult == ConnectivityResult.wifi)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TotalReport(
                          collectionName: 'منحة',
                          onPressed: (){

                          },
                        ),
                      ),
                    );
                  } else {
                    connectDialog();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
