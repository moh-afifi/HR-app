import 'package:emp/screens/emp_by_skill.dart';
import 'package:flutter/material.dart';
import 'package:emp/components/rounded_button.dart';

class SearchSkill extends StatefulWidget {
  @override
  _SearchSkillState createState() => _SearchSkillState();
}

class _SearchSkillState extends State<SearchSkill> {

  String skill= 'CCNA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Image.asset('images/logo1.jpg',),),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'وحدة التحول الرقمي',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Choose Skill:',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('chooose'),
              value: skill,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  skill = newValue;
                });
              },
              items: <String>['CCNA', 'MCSA', 'CEH', 'CyberOps','Linux',
                'Aruba','ARC','Esri','Moodle','Captivate','Java Script','ReactJS',
                'flutter','C#','Java','PHP','MySQL','HTML','CSS','Python','NodeJS',
                'Angular','Oracle','MongoDB','MySQL']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 50,
            ),
            //----------------------------------------------------------
            Center(
              child: RoundedButton(title: 'Search' ,
                  colour: Colors.teal,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmpSkill(skill: skill,),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}



