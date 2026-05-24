import 'dart:math';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  const SecondClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Segunda Pantalla'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // <- Aquí engancha con tu línea 16 y 17
            onPressed: () {},
          ),
        ],
        // bottom: PreferredSize(
          //     preferredSize: Size.fromHeight(40.0),
          //   child: Text('This is a text in appbar'),
          // ),
        ),
        body: Material(
          child:ListView(
            children:<Widget>[
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Dog'),
                subtitle:Text('This is an animal'),
                trailing: Icon(Icons.access_time),
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Cat'),
                subtitle:Text('This is an animal'),
                trailing: Icon(Icons.access_time),
              ),
              Padding(
                child:Text('Dog'),
                padding: EdgeInsets.all(10.0),
                ),
              Container(
                child:Text('cat'),
                margin: EdgeInsets.symmetric(horizontal:30.0),
                color: Colors.green,
                padding: EdgeInsets.only(top:20.0),
              ),

            ]
          )
        ));
   }
   
   String generateNumbers(){
    var r=Random();
    int i=r.nextInt(20);
    return 'A random number between 0 and 20: $i';
   }
    
} 