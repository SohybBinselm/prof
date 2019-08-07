import 'package:flutter/material.dart';
import 'package:professor/database/student.dart';

class Students extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List x = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Students Data"),
      ),
      body: ListView.builder(
          itemCount: x.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: ()=>Navigator.pushNamed(context, '/months',arguments: Student.fromMap(x[index]).id),
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(title: Text("${Student.fromMap(x[index]).id}"),),
                    ListTile(title: Text("${Student.fromMap(x[index]).name}"),),
                    ListTile(title: Text("${Student.fromMap(x[index]).phone}"),),
                    ListTile(title: Text("${Student.fromMap(x[index]).address}"),),
                    ListTile(title: Text("${Student.fromMap(x[index]).group}"),),

                  ],
                ),
              ),
            );
          }),
    );
  }
}
