import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title:"My flutter app",
      home:Scaffold(
        backgroundColor: Colors.yellow,
        appBar:AppBar(
          title: Text('title'),
        ),
        body:Center(
          child: Text('This is a text.', textDirection: TextDirection.ltr,)
        )
      ),
    ),
  );
}