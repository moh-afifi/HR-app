import 'package:flutter/material.dart';
import 'package:emp/widgets/emp_home_card.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:emp/screens/vacation/emp_page.dart';

class IotEmpVacation extends StatefulWidget {
  IotEmpVacation({this.appBarTitle});
  final String appBarTitle;
  @override
  _IotEmpVacationState createState() => _IotEmpVacationState();
}

class _IotEmpVacationState extends State<IotEmpVacation> {
  String empName;
  //---------------------------------------------------
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  validate(String val) {
    if (val.isEmpty) {
      return 'Please enter emp name ..';
    }
  }

  List<String> values = [
    'محمد عبد الله محمد',
    'عبد الله سعد محمود',
    'محمد محمد بلال',
    'ابراهيم العراقي الدسوقي',
    'حسام صلاح الدين محمد',
    'بيتر نعيم عزمي بستان',
    'مصطفى سيد سنوسي'
  ];

  Map<String, String> myMap = {
    'محمد عبد الله محمد': 'images/afifi.jpg',
    'عبد الله سعد محمود': 'images/abdallah.jpg',
    'محمد محمد بلال': 'images/belal.jpg',
    'ابراهيم العراقي الدسوقي': 'images/eraky.jpg',
    'حسام صلاح الدين محمد': 'images/hossam.jpg',
    'بيتر نعيم عزمي بستان': 'images/peter.jpg',
    'مصطفى سيد سنوسي': 'images/senosy.jpg'
  };

  List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(values);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  //---------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.purple,
            title: Text(
              widget.appBarTitle,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: this._formKey,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          icon: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 35,
                              ),
                              onPressed: () {
                                if (this._formKey.currentState.validate()) {
                                  this._formKey.currentState.save();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmpPage(
                                        name: empName,
                                        imagePath: myMap[empName],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          hintText: 'ادخل اسم الموظف',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: this._typeAheadController,
                      ),
                      suggestionsCallback: (pattern) {
                        return getSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        this._typeAheadController.text = suggestion;
                      },
                      validator: (value) {
                        return validate(value);
                      },
                      onSaved: (value) {
                        setState(() {
                          empName = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              EmpHomeCard(
                imagePath: 'images/afifi.jpg',
                name: 'محمد عبد الله محمد',
                dept: 'development',
              ),
              EmpHomeCard(
                imagePath: 'images/abdallah.jpg',
                name: 'عبد الله سعد محمود',
                dept: 'development',
              ),
              EmpHomeCard(
                imagePath: 'images/belal.jpg',
                name: 'محمد محمد بلال',
                dept: 'development',
              ),
              EmpHomeCard(
                imagePath: 'images/eraky.jpg',
                name: 'ابراهيم العراقي الدسوقي',
                dept: 'development',
              ),
              EmpHomeCard(
                imagePath: 'images/gemy.jpg',
                name: 'محمد جمال ياسين',
                dept: 'development',
              ),
              EmpHomeCard(
                imagePath: 'images/hossam.jpg',
                name: 'حسام صلاح الدين محمد',
                dept: 'development',
              ),
              EmpHomeCard(
                imagePath: 'images/peter.jpg',
                name: 'بيتر نعيم عزمي بستان',
                dept: 'development',
              ),
              EmpHomeCard(
                imagePath: 'images/senosy.jpg',
                name: 'مصطفى سيد سنوسي',
                dept: 'development',
              ),
            ],
          )),
    );
  }
}
