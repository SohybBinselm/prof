import 'package:flutter/material.dart';
import 'package:professor/pages/control.dart';
import 'package:professor/pages/months.dart';
import 'package:professor/pages/score.dart';
import 'package:professor/pages/sessions.dart';
import 'package:professor/pages/students.dart';
import 'package:professor/pages/timetable.dart';
import 'database/myhelper.dart';
import 'pages/groups.dart';
import 'pages/leaderboard.dart';

void main() async {
  var helper = DatabaseHelper();
  await helper.createScoreTable();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
    routes: {
      '/timetable': (context) => TimeTable(),
      '/leaderboard': (context) => LeaderBoard(),
      '/groups': (context) => Groups(),
      '/control': (context) => Control(),
      '/students': (context) => Students(),
      '/months' : (context) => Months(),
      '/sessions':(context) => Sessions(),
      '/score' : (context) => Score(),
    },
  ));
}

class MyHome extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
     ControlState.getCount().then((value){
       if(value==null) ControlState.groupCount =0;
     else ControlState.groupCount = value;
    });



    return Scaffold(
      appBar: AppBar(
        title: Text("Physics"),
        backgroundColor: Colors.blue.shade700,
        leading: Icon(Icons.book),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/timetable');
              break;
            case 1:
              Navigator.pushNamed(context, '/leaderboard');
              break;
            case 2:
              Navigator.pushNamed(context, '/groups');
              break;
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text("TimeTable"),
              icon: Icon(Icons.timer),
              activeIcon: Icon(Icons.timer)),
          BottomNavigationBarItem(
            title: Text("LeaderBoard"),
            icon: Icon(Icons.insert_chart),
            activeIcon: Icon(Icons.insert_chart),
          ),
          BottomNavigationBarItem(
            title: Text("Groups"),
            icon: Icon(Icons.group),
            activeIcon: Icon(Icons.group),
          )
        ],
      ),
      body: Container(
        child: Image.asset(
          'lib/images/physics.jpg',
          fit: BoxFit.fill,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Navigator.pushNamed(context, '/control')),
    );
  }
}
