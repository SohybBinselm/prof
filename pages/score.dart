import 'package:flutter/material.dart';
import 'package:professor/database/myhelper.dart';
import 'package:professor/database/student_score.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  TextEditingController presence= TextEditingController();
  TextEditingController sheet= TextEditingController();
  TextEditingController exam= TextEditingController();
  TextEditingController bonus= TextEditingController();
  var helper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    List l = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text("Score"),
      ),
      body: ListView(children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.black,
            alignment: Alignment.center,
            width: 200,
            child: Text("Score For Student",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),),),),
        TextField(
          controller: presence,
          decoration: InputDecoration(
            icon: Icon(Icons.perm_identity),
            labelText: "Presence",
          ),
        ),
        TextField(
          controller: sheet,
          decoration: InputDecoration(
            icon: Icon(Icons.phone),
            labelText: "Sheet",
          ),
        ),
        TextField(
          controller: exam,
          decoration: InputDecoration(
            icon: Icon(Icons.location_city),
            labelText: "Exam",
          ),
        ),
        TextField(
          controller: bonus,
          decoration: InputDecoration(
            icon: Icon(Icons.group),
            labelText: "Bonus",
          ),
        ),
        RaisedButton(child: Text("Submit"),
            onPressed: (){
              if(presence.text==''||sheet.text==''||exam.text==''||bonus.text=='') _showAlertMessage(context, "Missing Data");
              else {
                 Scores scr = Scores(l[0],l[1],l[2],int.parse(presence.text),int.parse(sheet.text),int.parse(exam.text),int.parse(bonus.text));
                insertScore(scr);
                _showAlertMessage(context, "Successful Insert");

              }

            }),
      ],),
    );
  }

  void insertScore(Scores scr) async {
    await helper.saveScore(scr);
  }
}
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

