//import 'package:flutter/material.dart';
//
//class ReusableEmpTemplate extends StatelessWidget {
//
//  ReusableEmpTemplate({this.label,this.onChanged,this.hintText,this.labelText});
//  final String label,hintText,labelText;
//  Function onChanged;
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding:EdgeInsets.all(15.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Text(
//           label,
//            style: TextStyle(fontSize: 20, color: Colors.blueAccent),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          TextField(
//            onChanged:onChanged
////                (value) {
////              entry = value;
////            },
//            ,
//            keyboardType: TextInputType.text,
//            decoration: InputDecoration(
//              border: OutlineInputBorder(),
//              hintText: hintText,
//              labelText: labelText,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
