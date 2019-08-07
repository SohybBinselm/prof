import 'package:flutter/material.dart';
import 'package:professor/database/myhelper.dart';

import 'control.dart';


class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = DatabaseHelper();

    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
      ),
      body: ListView.builder(
        itemCount: ControlState.groupCount,
          itemBuilder: (context,index){
          return ListTile(
            title: Text("Group ${index+1}"),
            onTap: () {
             db.getStudent(index+1).then((value){
               Navigator.pushNamed(context,'/students',arguments: value);
             });
            },
          );
          }),
    );
  }
}
