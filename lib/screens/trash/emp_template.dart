//import 'package:flutter/material.dart';
//import 'package:emp/reusables/reusable_emp_template.dart';
//import 'package:emp/components/rounded_button.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:path/path.dart';
//import 'dart:io';
//import 'home_emp_data.dart';
//
//class EmpTemplate extends StatefulWidget {
//  @override
//  _EmpTemplateState createState() => _EmpTemplateState();
//}
//
//class _EmpTemplateState extends State<EmpTemplate> {
//  String dept = 'IOT & GIS';
//  String name,id,phone,age,gender,address,education,university,mail,dateOfBirth,socialStatus,experience;
////--------------------------------------------------
//  final _firestore = Firestore.instance;
//  final DocumentReference documentReference = Firestore.instance.collection('schedule').document();
//  File _image;
//  bool showSpinner = false;
//  String downloadUrl;
//  //------------------------------------------------
//  Future getImage() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    setState(() {
//      _image = image;
//    });
//  }
//
//  Future uploadPic(BuildContext context) async {
//    String fileName = basename(_image.path);
//    StorageReference firebaseStorageRef =
//    FirebaseStorage.instance.ref().child(fileName);
//    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
//    setState(() {
//      showSpinner = true;
//    });
//    await uploadTask.onComplete;
//    String downloadAddress = await firebaseStorageRef.getDownloadURL();
//    downloadUrl = downloadAddress;
//    setState(() {
//      showSpinner = false;
//    });
//  }
//  //------------------------------------------------
//  @override
//  Widget build(BuildContext context) {
//    return ModalProgressHUD(
//      inAsyncCall: showSpinner,
//      child: Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.lightBlue,
//          centerTitle: true,
//          title: Text("New Employee",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
//        ),
//        body: Builder(
//          builder: (context) => ListView(
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.all(15.0),
//                child: Column(
//                  children: <Widget>[
//                    Center(
//                      child: (_image != null)
//                          ? Container(
//                        width: 200,
//                            height: 200,
//                            child: Image.file(
//                        _image,
//                        fit: BoxFit.fill,
//                      ),
//                          )
//                          : Container(
//                        width: 100,
//                            height: 100,
//                            child: Image(
//                        image: AssetImage('images/add.png'),
//                      ),
//                          ),),
//                    //---------------------------------
//                    InkWell(child: Text('Add photo +',style: TextStyle(fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold),),
//                    onTap: (){
//                       getImage();
//                    },),
//                  ],
//                ),
//              ),
//              Padding(
//                padding:  EdgeInsets.all(15.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      'Choose Department:',
//                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
//                    ),
//                    DropdownButton<String>(
//                      isExpanded: true,
//                      //hint: Text('chooose'),
//                      value: dept,
//                      icon: Icon(Icons.keyboard_arrow_down),
//                      iconSize: 24,
//                      elevation: 16,
//                      onChanged: (String newValue) {
//                        setState(() {
//                          dept = newValue;
//                        });
//                      },
//                      items: <String>[
//                        'IOT & GIS','Development','Cyber Security'
//                      ].map<DropdownMenuItem<String>>((String value) {
//                        return DropdownMenuItem<String>(
//                          value: value,
//                          child: Text(value),
//                        );
//                      }).toList(),
//                    ),
//                  ],
//                ),
//              ),
//
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter name:',onChanged: (value){name=value;},hintText: 'Enter Employee name',labelText: 'name',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter ID:',onChanged: (value){id=value;},hintText: 'Enter ID',labelText: 'ID',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter phone:',onChanged: (value){phone=value;},hintText: 'Enter phone',labelText: 'phone',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter gender:',onChanged: (value){gender=value;},hintText: 'Enter gender',labelText: 'gender',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter age:',onChanged: (value){age=value;},hintText: 'Enter age',labelText: 'age',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter address:',onChanged: (value){address=value;},hintText: 'Enter address',labelText: 'address',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter mail:',onChanged: (value){mail=value;},hintText: 'Enter mail',labelText: 'mail',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter Social Status:',onChanged: (value){socialStatus=value;},hintText: 'Enter Social Status',labelText: 'Social Status',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter university:',onChanged: (value){university=value;} ,hintText: 'Enter university',labelText: 'university',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter education:',onChanged: (value){education=value;},hintText: 'Enter education',labelText: 'education',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter experience:',onChanged: (value){experience=value;},hintText: 'Enter experience',labelText: 'experience',),
//              //---------------------------------------------------
//              ReusableEmpTemplate(label: 'Enter date of birth:',onChanged: (value){dateOfBirth=value;},hintText: 'Enter date of birth',labelText: 'date of birth',),
//              //--------------------------------------------------
//              Padding(
//                padding:  EdgeInsets.all(15.0),
//                child:   RoundedButton(title: 'Submit',colour: Colors.teal,onPressed: ()async{
//                  await uploadPic(context);
////                        downloadImage();
//
//                  DocumentReference docRef= await _firestore.collection('data').add({
//                    'name':name,
//                    'address': address,
//                    'age':age ,
//                    'mail': mail,
//                    'id': id,
//                    'phone':phone,
//                    'gender':gender,
//                    'university':university,
//                    'education':education,
//                    'status':socialStatus,
//                    'experience':experience,
//                    'birth':dateOfBirth,
//
//                    'dept':dept,
//
//                    'url': downloadUrl,
//                    'docID':documentReference.documentID
//
//                  });
//
//                  //you can use this docId when updating:
//                  String docID=docRef.documentID;
//                  //print(docID);
//                  //---------------------------------------------
////                  Scaffold.of(context).showSnackBar(new SnackBar(
////                    backgroundColor: Colors.teal,
////                    duration: Duration(seconds: 3),
////                    content: Row(
////                      children: <Widget>[
////                        Icon(Icons.thumb_up,),
////                        SizedBox(width: 20,),
////                        Text("Your Form is sent Successfully!"),
////                      ],
////                    ),
////                  ));
////------------------------------------------------------------------------------------
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => Department(),
//                    ),
//                  );
//                }),
//              ),
//              SizedBox(height: 30,)
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
