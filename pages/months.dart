import 'package:flutter/material.dart';

class Months extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Months"),
      ),
      body: ListView.builder(
          itemCount: 11,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("Month ${index+1}"),
              onTap: ()=> Navigator.pushNamed(context, '/sessions',arguments: [id,index+1]),
            );
          }),
    );
  }
}
