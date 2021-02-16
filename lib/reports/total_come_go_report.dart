import 'package:flutter/material.dart';

class TotalComeGoReport extends StatefulWidget {
  TotalComeGoReport({this.myList, this.appBarText});
  final List<Widget> myList;
  final appBarText;
  @override
  _TotalComeGoReportState createState() => _TotalComeGoReportState();
}

class _TotalComeGoReportState extends State<TotalComeGoReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          widget.appBarText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: ListView(
        children: widget.myList,
      ),
    );
  }
}
