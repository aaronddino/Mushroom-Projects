import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

//Dummy Page Layout EXAMPLE
class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Second Page"), backgroundColor: Colors.green),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.blueAccent),
                iconSize: 70.0, 
                onPressed: null
              ),
              new Text("Second Page")
            ]
          )
        )
      )
    );
  }
}

//Dummy Page #2
class DummyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Name of Species"), backgroundColor: Colors.green),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new TextCard(text:"Do any of these match your tree?", size: 15.0, box:Colors.grey[200]),
          
      ],)
    );
  }
}