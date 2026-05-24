import 'dart:math';

import 'package:first_flutter_project/util.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  const SecondClass({super.key});
 @override
  Widget build(BuildContext context) {
    return Material(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children:<Widget>[
              Expanded(
                child:Container(
                  color: Colors.purple,
                    child: Text(
                      "Expaneded",
                      style: TextStyle(fontSize: 25.0),
                      ),
                  ),
                ),
                Flexible(
                  child:Container(
                     color: Colors.yellow,
                     child:Text(
                      "Flexible",
                      style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
            ],
          ),
          Row(
            children:<Widget>[
              Flexible(
                child:Container(
                  color: Colors.yellow,
                  child: Text(
                    "Flexible",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Flexible(
                child:Container(
                  color: Colors.yellow,
                  child: Text(
                    "Flexible",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children:<Widget>[
              Expanded(
                flex:1,
                child:Container(
                  color: Colors.purple,
                    child: Text(
                      "Expaneded",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
                Expanded(
                  flex:3,
                  child:Container(
                  color: Colors.red,
                    child: Text(
                      "Expaneded",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
            ],
          )
        ]
     ,)
    );
  }
}