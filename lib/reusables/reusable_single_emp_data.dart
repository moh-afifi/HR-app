import 'package:flutter/material.dart';
import 'reusable_emp_card_data.dart';

class SingleEmpData extends StatelessWidget {
  SingleEmpData({this.name,this.dateOfBirth,this.experience,this.education,this.university,
    this.socialStatus,this.mail,this.address,this.age,this.joinDate,this.phone,this.id,this.url,this.dept});

   final String name,id,phone,age,joinDate,address,education,university,mail,dateOfBirth,socialStatus,experience,url,dept;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(child: Card(child: Image.network(url,width: 150,height: 150,),elevation: 10,)),
        SizedBox(height: 10,),
        ReusableEmpData(label: 'Name:',data: name,),
        ReusableEmpData(label: 'Phone number:',data:phone,),
        ReusableEmpData(label: 'ID number:',data: id,),
        ReusableEmpData(label: 'Social Status:',data: socialStatus,),
        ReusableEmpData(label: 'Age:',data: age,),
        ReusableEmpData(label: 'Date Of Birth:',data: dateOfBirth,),
        ReusableEmpData(label: 'E-mail:',data: mail,),
        ReusableEmpData(label: 'Join Date:',data: joinDate,),
        ReusableEmpData(label: 'Address:',data: address,),
        ReusableEmpData(label: 'Education:',data: education,),
        ReusableEmpData(label: 'College:',data: university,),
        ReusableEmpData(label: 'Experience:',data: experience,)
      ],
    );
  }
}
