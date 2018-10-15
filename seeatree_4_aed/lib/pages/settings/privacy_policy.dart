


import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';


class PrivacyPolicy extends StatelessWidget{
 @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Privacy Policy"), 
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.of(context).pushNamed("/");
                },
              ),
            ],
            backgroundColor: Colors.green,
            ),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               new Text("Insert Privacy policies here.. need to add it from google drive \n \n test", style: new TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
            ]
          )
        )
    );
  }

}