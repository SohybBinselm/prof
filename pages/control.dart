import 'package:flutter/material.dart';
import 'package:professor/database/myhelper.dart';
import 'package:professor/database/student.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Control extends StatefulWidget {
  @override
  ControlState createState() => ControlState();
}

class ControlState extends State<Control> {
  static int groupCount =0;
  TextEditingController name= TextEditingController();
  TextEditingController phone= TextEditingController();
  TextEditingController address= TextEditingController();
  TextEditingController group= TextEditingController();

  var helper = DatabaseHelper();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new'),
        backgroundColor: Colors.black,
      ),
      body: ListView(children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.black,
            alignment: Alignment.center,
            width: 200,
            child: Text("Add New Student",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),),),),
        TextField(
          controller: name,
          decoration: InputDecoration(
            icon: Icon(Icons.perm_identity),
            labelText: "Student Name",
          ),
        ),
        TextField(
          controller: phone,
          decoration: InputDecoration(
            icon: Icon(Icons.phone),
            labelText: "Phone Number",
          ),
        ),
        TextField(
          controller: address,
          decoration: InputDecoration(
            icon: Icon(Icons.location_city),
            labelText: "Address",
          ),
        ),
        TextField(
          controller: group,
          decoration: InputDecoration(
            icon: Icon(Icons.group),
            labelText: "Group Number",
          ),
        ),
        RaisedButton(child: Text("Submit"),
        onPressed: (){
          if(name.text==''||phone.text==''||address.text==''||group.text=='') _showAlertMessage(context, "Missing Data");
          else {

            var std = Student(name.text,phone.text,address.text,int.parse(group.text));
            insertStudent(std);
            _showAlertMessage(context, "Successful Insert");

          }

        }),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.black,
            alignment: Alignment.center,
            width: 200,
            child: Text("Add New Group",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),),),),
        Padding(padding: EdgeInsets.only(top: 20),),
        CircleAvatar(child: InkWell(
          child:Icon(Icons.add),
          onTap: addNewGroup,
          ),
          backgroundColor: Colors.black,
        )

      ],),
    );
  }
//  addStudent(){
//    if(name.text==''||phone.text==''||address.text==''||group.text=='') _showAlertMessage(context, "Missing Data");
//    else {
//      debugPrint("${name.text}");
//      debugPrint("${phone.text}");
//      debugPrint("${address.text}");
//      debugPrint("${group.text}");
//
//      var std = Student(name.text,phone.text,address.text,int.parse(group.text));
//      insertStudent(std);
//      _showAlertMessage(context, "Successful Insert");
//
//    }
//
//  }
  void _showAlertMessage(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: new Text('!!'),
      content: new Text(message),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('OK'))
      ],
    );
    showDialog(context: context, child: alert);
  }


  void insertStudent(Student std) async {
    await helper.saveStudent(std);
  }

  void addNewGroup() {
    groupCount++;
    saveCount();
  }

    static saveCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("NumberOfGroups", groupCount);
  }

  static Future<int> getCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getInt("NumberOfGroups");
  }

}



