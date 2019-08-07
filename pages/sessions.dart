import 'package:flutter/material.dart';

class Sessions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List l = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sessions"),
      ),
      body: ListView.builder(
          itemCount:8,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("Session ${index+1}"),
              onTap: ()=> Navigator.pushNamed(context,'/score',arguments: [l[0],l[1],index+1]),
            );
          }),
    );
  }
}
