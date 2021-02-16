import 'package:emp/reports/regular_report.dart';
import 'package:emp/reports/total_come_go_report.dart';
import 'package:emp/widgets/total_come_go_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emp/widgets/insert_card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../widgets/report_card.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:connectivity/connectivity.dart';
import 'package:emp/dialogs/make_sudden_dialog.dart';
import 'package:emp/dialogs/connect_dialog.dart';
import 'package:emp/dialogs/make_regular_dialog.dart';
import 'package:emp/reports/sudden_report.dart';
import 'package:emp/dialogs/make_gift_dialog.dart';
import 'package:emp/dialogs/make_disease_dialog.dart';
import 'package:emp/reports/disease_report.dart';
import 'package:emp/reports/gift_report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp/dialogs/exceed_regular_dialog.dart';
import 'package:emp/widgets/come_go_card.dart';
import 'package:emp/dialogs/come_go_dialog.dart';
import 'package:emp/dialogs/already_enrolled_dialog.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class EmpPage extends StatefulWidget {
  EmpPage({this.imagePath, this.name, this.dept});
  final String imagePath;
  final String name;
  final String dept;

  @override
  _EmpPageState createState() => _EmpPageState();
}

class _EmpPageState extends State<EmpPage> {
  String today;
  int numOfSudden = 0;
  final _fireStore = Firestore.instance;
  var nowTime;
  String from, to, monthFrom, monthTo, year;
  String dept, time, date;
  bool showSpinner = false;
  int suddenNumber;
  //---------------------------------------------------
  getDate() {
    initializeDateFormatting("en", null).then((_) {
      var now = DateTime.now();
      nowTime = now.toString().substring(11).substring(0, 8);
      var formatter = DateFormat('d-M-y');
      today = formatter.format(now);
    });
  }
  //---------------------------------------------------
  void getSuddenNumOfDays() async {
    await for (var snapshot
        in _fireStore.collection("عارضة ${widget.name}").snapshots()) {
      for (var message in snapshot.documents) {
        numOfSudden++;
      }
    }
  }
  //---------------------------------------------------
  void makeSuddenDialog(String name, String today) {
    showDialog(
        context: context,
        builder: (BuildContext context) => MakeSuddenDialog(
              name: name,
              today: today,
            ));
  }
  //---------------------------------------------------
  void makeRegularDialog(String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) => MakeRegularDialog(
              name: name,
              date: today,
            ));
  }
  //---------------------------------------------------
  void makeDiseaseDialog(String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) => MakeDiseaseDialog(
              name: name,
              date: today,
            ));
  }
  //--------------------------------------------------
  void makeGiftDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) => MakeGiftDialog(
        name: name,
        date: today,
      ),
    );
  }
  //---------------------------------------------------
  void connectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConnectDialog(),
    );
  }
  //-----------------------------------------
  void makeExceedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ExceedRegularDialog(),
    );
  }
  //-------------------------------------------------------------
  void comeGoDialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ComeGoDialog(
        text: text,
      ),
    );
  }
  //-------------------------------------------------------------
  void alreadyEnrolledDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlreadyEnrolledDialog(),
    );
  }
  //-------------------------------------------------------------
  @override
  void initState() {
    getDate();
    getSuddenNumOfDays();
    super.initState();
  }

  //---------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            widget.name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: Builder(
          builder: (context) => ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.purple,
                    title: Text(
                      'التقارير',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
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
                            builder: (context) => SuddenReport(
                              name: widget.name,
                            ),
                          ),
                        );
                      } else {
                        connectDialog();
                      }
                    },
                  ),

                  Divider(
                    color: Colors.black,
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
                            builder: (context) => RegularReport(
                              name: widget.name,
                            ),
                          ),
                        );
                      } else {
                        connectDialog();
                      }
                    },
                  ),

                  Divider(
                    color: Colors.black,
                  ),

                  //---------------------------------------------------------
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
                            builder: (context) => DiseaseReport(
                              name: widget.name,
                            ),
                          ),
                        );
                      } else {
                        connectDialog();
                      }
                    },
                  ),

                  Divider(
                    color: Colors.black,
                  ),

                  ReportCard(
                    label: 'تقرير المنحة',
                    icon: Icons.card_giftcard,
                    onTap: () async {
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if ((connectivityResult == ConnectivityResult.mobile) ||
                          (connectivityResult == ConnectivityResult.wifi)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GiftReport(
                              name: widget.name,
                            ),
                          ),
                        );
                      } else {
                        connectDialog();
                      }
                    },
                  ),

                  Divider(
                    color: Colors.black,
                  ),

                  ReportCard(
                    label: 'تقرير الحضور',
                    icon: Icons.directions_walk,
                    onTap: () async {
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if ((connectivityResult == ConnectivityResult.mobile) ||
                          (connectivityResult == ConnectivityResult.wifi)) {
                        final List<DateTime> picked =
                            await DateRagePicker.showDatePicker(
                                context: context,
                                initialFirstDate: (new DateTime.now())
                                    .subtract(new Duration(days: 5)),
                                initialLastDate: new DateTime.now(),
                                firstDate: new DateTime(2020),
                                lastDate: new DateTime(2021));
                        setState(() {
                          showSpinner = true;
                        });
                        //------------------------------------------------------
                        List<Widget> dailyReportList = [];
                        //------------------------------------------------------
                        if (picked != null && picked.length == 2) {
                          String text = picked.toString();
                          print(text);
                          if (text.substring(6, 7) == '0') {
                            monthFrom = text.substring(7, 8);
                          } else {
                            monthFrom = text.substring(6, 8);
                          }
                          //------------------------------------
                          if (text.substring(31, 32) == '0') {
                            monthTo = text.substring(32, 33);
                            print(monthTo);
                          } else {
                            monthTo = text.substring(31, 33);
                            print(monthTo);
                          }
                          //------------------------------------
                          year = text.substring(1, 5);
                          //------------------------------------
                          if (text.substring(9, 10) == '0') {
                            from = text.substring(10, 11);
                          } else {
                            from = text.substring(9, 11);
                          }
                          //------------------------------------------------------
                          String start = ',';
                          String end = ']';
                          final startIndex = text.indexOf(start);
                          final endIndex =
                              text.indexOf(end, startIndex + start.length);
                          if (text
                                  .substring(
                                      startIndex + start.length, endIndex)
                                  .substring(9, 10) ==
                              '0') {
                            to = text
                                .substring(startIndex + start.length, endIndex)
                                .substring(10, 11);
                          } else {
                            to = text
                                .substring(startIndex + start.length, endIndex)
                                .substring(9, 11);
                          }

                          if (monthFrom == monthTo) {
                            for (int i = int.parse(from);
                                i <= int.parse(to);
                                i++) {
                              print('$i-$monthFrom-$year');
                              DocumentSnapshot come = await _fireStore
                                  .collection("حضور $i-$monthFrom-$year")
                                  .document(widget.name)
                                  .get();

                              if (come.exists) {
                                date = come.data['date'];
                                time = come.data['time'];
                                dept = come.data['department'];
                                var myCard = TotalComeGoCard(
                                  date: date,
                                  name: widget.name,
                                  time: time,
                                  dept: dept,
                                );
                                dailyReportList.add(myCard);
                              }
                            }
                          } else {
                            for (int i = int.parse(from); i <= 31; i++) {
                              DocumentSnapshot come = await _fireStore
                                  .collection("حضور $i-$monthFrom-$year")
                                  .document()
                                  .get();
                              if (come.exists) {
                                date = come.data['date'];
                                time = come.data['time'];
                                dept = come.data['department'];
                                var myCard = TotalComeGoCard(
                                  date: date,
                                  name: widget.name,
                                  time: time,
                                  dept: dept,
                                );
                                dailyReportList.add(myCard);
                              }
                            }
                            //-------------------------------------------
                            for (int j = 1; j <= int.parse(to); j++) {
                              DocumentSnapshot come = await _fireStore
                                  .collection("حضور $j-$monthFrom-$year")
                                  .document()
                                  .get();

                              if (come.exists) {
                                date = come.data['date'];
                                time = come.data['time'];
                                dept = come.data['department'];
                                var myCard = TotalComeGoCard(
                                  date: date,
                                  name: widget.name,
                                  time: time,
                                  dept: dept,
                                );
                                dailyReportList.add(myCard);
                              }
                            }
                          }
                          //--------------------------------------------------
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TotalComeGoReport(
                                appBarText: 'تقرير الحضور',
                                myList: dailyReportList,
                              ),
                            ),
                          );
                        }
                      } else {
                        connectDialog();
                      }
                    },
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ReportCard(
                    label: 'تقرير الانصراف',
                    icon: Icons.sentiment_dissatisfied,
                    onTap: () async {
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if ((connectivityResult == ConnectivityResult.mobile) ||
                          (connectivityResult == ConnectivityResult.wifi)) {
                        final List<DateTime> picked =
                            await DateRagePicker.showDatePicker(
                                context: context,
                                initialFirstDate: (new DateTime.now())
                                    .subtract(new Duration(days: 5)),
                                initialLastDate: new DateTime.now(),
                                firstDate: new DateTime(2020),
                                lastDate: new DateTime(2021));
                        setState(() {
                          showSpinner = true;
                        });
                        //------------------------------------------------------
                        List<Widget> dailyReportList = [];
                        //------------------------------------------------------
                        if (picked != null && picked.length == 2) {
                          String text = picked.toString();
                          print(text);
                          if (text.substring(6, 7) == '0') {
                            monthFrom = text.substring(7, 8);
                          } else {
                            monthFrom = text.substring(6, 8);
                          }
                          //------------------------------------
                          if (text.substring(31, 32) == '0') {
                            monthTo = text.substring(32, 33);
                            print(monthTo);
                          } else {
                            monthTo = text.substring(31, 33);
                            print(monthTo);
                          }
                          //------------------------------------
                          year = text.substring(1, 5);
                          //------------------------------------
                          if (text.substring(9, 10) == '0') {
                            from = text.substring(10, 11);
                          } else {
                            from = text.substring(9, 11);
                          }
                          //------------------------------------------------------
                          String start = ',';
                          String end = ']';
                          final startIndex = text.indexOf(start);
                          final endIndex =
                              text.indexOf(end, startIndex + start.length);
                          if (text
                                  .substring(
                                      startIndex + start.length, endIndex)
                                  .substring(9, 10) ==
                              '0') {
                            to = text
                                .substring(startIndex + start.length, endIndex)
                                .substring(10, 11);
                          } else {
                            to = text
                                .substring(startIndex + start.length, endIndex)
                                .substring(9, 11);
                          }

                          if (monthFrom == monthTo) {
                            for (int i = int.parse(from);
                                i <= int.parse(to);
                                i++) {
                              print('$i-$monthFrom-$year');
                              DocumentSnapshot come = await _fireStore
                                  .collection("انصراف $i-$monthFrom-$year")
                                  .document(widget.name)
                                  .get();

                              if (come.exists) {
                                date = come.data['date'];
                                time = come.data['time'];
                                dept = come.data['department'];
                                var myCard = TotalComeGoCard(
                                  date: date,
                                  name: widget.name,
                                  time: time,
                                  dept: dept,
                                );
                                dailyReportList.add(myCard);
                              }
                            }
                          } else {
                            for (int i = int.parse(from); i <= 31; i++) {
                              DocumentSnapshot come = await _fireStore
                                  .collection("انصراف $i-$monthFrom-$year")
                                  .document()
                                  .get();
                              if (come.exists) {
                                date = come.data['date'];
                                time = come.data['time'];
                                dept = come.data['department'];
                                var myCard = TotalComeGoCard(
                                  date: date,
                                  name: widget.name,
                                  time: time,
                                  dept: dept,
                                );
                                dailyReportList.add(myCard);
                              }
                            }
                            //-------------------------------------------
                            for (int j = 1; j <= int.parse(to); j++) {
                              DocumentSnapshot come = await _fireStore
                                  .collection("انصراف $j-$monthFrom-$year")
                                  .document()
                                  .get();

                              if (come.exists) {
                                date = come.data['date'];
                                time = come.data['time'];
                                dept = come.data['department'];
                                var myCard = TotalComeGoCard(
                                  date: date,
                                  name: widget.name,
                                  time: time,
                                  dept: dept,
                                );
                                dailyReportList.add(myCard);
                              }
                            }
                          }
                          setState(() {
                            showSpinner = false;
                          });
                          //--------------------------------------------------
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TotalComeGoReport(
                                appBarText: 'تقرير الانصراف',
                                myList: dailyReportList,
                              ),
                            ),
                          );
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      } else {
                        connectDialog();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(widget.imagePath),
                ),
                SizedBox(height: 25),
                //---------------------------------------------------------
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.black,
                  indent: 100,
                  endIndent: 100,
                  //height: 50,
                ),
                SizedBox(height: 10),
                //---------------------------------------------------------
                ComeGoCard(
                  icon: Icons.directions_walk,
                  text: 'تسجيل حضور',
                  cardColor: Colors.teal,
                  onTap: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if ((connectivityResult == ConnectivityResult.mobile) ||
                        (connectivityResult == ConnectivityResult.wifi)) {
                      DocumentSnapshot emp = await _fireStore
                          .collection("حضور $today")
                          .document('${widget.name}')
                          .get();
                      if (emp.exists) {
                        alreadyEnrolledDialog();
                      } else {
                        DocumentReference reference = _fireStore
                            .document("حضور $today/" + '${widget.name}');
                        Map<String, dynamic> myData = {
                          'name': widget.name,
                          'department': widget.dept,
                          'date': today,
                          'time': nowTime
                        };
                        reference.setData(myData);
                        comeGoDialog('تم تسجيل الحضور بنجاح');
                      }
                    } else {
                      connectDialog();
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ComeGoCard(
                  icon: Icons.sentiment_dissatisfied,
                  text: 'تسجيل انصراف',
                  cardColor: Colors.red,
                  onTap: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if ((connectivityResult == ConnectivityResult.mobile) ||
                        (connectivityResult == ConnectivityResult.wifi)) {
                      DocumentSnapshot emp = await _fireStore
                          .collection("انصراف $today")
                          .document('${widget.name}')
                          .get();
                      if (emp.exists) {
                        alreadyEnrolledDialog();
                      } else {
                        DocumentReference reference = _fireStore
                            .document("انصراف $today/" + '${widget.name}');
                        Map<String, dynamic> myData = {
                          'name': widget.name,
                          'department': widget.dept,
                          'date': today,
                          'time': nowTime
                        };
                        reference.setData(myData);
                        comeGoDialog('تم تسجيل الانصراف بنجاح');
                      }
                    } else {
                      connectDialog();
                    }
                  },
                ),
                //---------------------------------------------------------
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.black,
                  indent: 100,
                  endIndent: 100,
                  //height: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InsertCard(
                      label: 'اعتيادي',
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if ((connectivityResult == ConnectivityResult.mobile) ||
                            (connectivityResult == ConnectivityResult.wifi)) {
                          //--------------------------------------------------
                          DocumentSnapshot emp = await _fireStore
                              .collection("اعتيادي ${widget.name}")
                              .document(today)
                              .get();
                          if (emp.exists) {
                            alreadyEnrolledDialog();
                          } else {
                            makeRegularDialog(widget.name);
                          }
                          //-----------------------------------------

                        } else {
                          connectDialog();
                        }
                      },
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey,
                    ),
                    InsertCard(
                      label: 'عارضة',
                      onTap: () async {
                        if (numOfSudden == 7) {
                          makeExceedDialog();
                        } else {
                          var connectivityResult =
                              await (Connectivity().checkConnectivity());
                          if ((connectivityResult ==
                                  ConnectivityResult.mobile) ||
                              (connectivityResult == ConnectivityResult.wifi)) {
                            DocumentSnapshot come = await _fireStore
                                .collection("/عوارض")
                                .document(widget.name)
                                .get();
                            if (come.exists) {
                              suddenNumber = come.data['number'];
                            } else {
                              suddenNumber = 0;
                            }
                            //---------------------------------------------------
                            DocumentSnapshot suddenCheck = await _fireStore
                                .collection("عارضة ${widget.name}")
                                .document(today)
                                .get();
                            if (suddenCheck.exists) {
                              alreadyEnrolledDialog();
                            } else {
                              DocumentReference reference2 = _fireStore
                                  .document("عوارض/" + '${widget.name}');
                              Map<String, dynamic> myData2 = {
                                'name': widget.name,
                                'number': suddenNumber + 1
                              };
                              reference2.setData(myData2);
                              makeSuddenDialog(widget.name, today);
                            }
                          } else {
                            connectDialog();
                          }
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black,
                  indent: 100,
                  endIndent: 100,
                  //height: 50,
                ),
                //---------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InsertCard(
                      label: 'منحة',
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if ((connectivityResult == ConnectivityResult.mobile) ||
                            (connectivityResult == ConnectivityResult.wifi)) {
                          DocumentSnapshot emp = await _fireStore
                              .collection("منحة ${widget.name}")
                              .document(today)
                              .get();
                          if (emp.exists) {
                            alreadyEnrolledDialog();
                          } else {
                            makeGiftDialog(widget.name);
                          }
                          //-----------------------------------------

                        } else {
                          connectDialog();
                        }
                      },
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey,
                    ),
                    InsertCard(
                      label: 'مرضي',
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if ((connectivityResult == ConnectivityResult.mobile) ||
                            (connectivityResult == ConnectivityResult.wifi)) {
                          DocumentSnapshot emp = await _fireStore
                              .collection("مرضي ${widget.name}")
                              .document(today)
                              .get();
                          if (emp.exists) {
                            alreadyEnrolledDialog();
                          } else {
                            makeDiseaseDialog(widget.name);
                          }
                          //-----------------------------------------

                        } else {
                          connectDialog();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black,
                  indent: 100,
                  endIndent: 100,
                  //height: 50,
                ),
                SizedBox(height: 10),
                //---------------------------------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
