/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Home
Purpose: 
- Home Page of the app
- Redirects to pages: Add Tree, My Trees, Community.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

//#1: Home Page of the See A Tree App
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("See A Tree", style: new TextStyle(fontSize: 40.0), textAlign: TextAlign.center), backgroundColor: Colors.green),
      body: new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //new TextCard(text:"Welcome back.", size: 15.0, box:Colors.white),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PictureButton(
              image: "assets/tree1.png",
              text: "Add Tree",
              nextpage: "/AddTree",
              width: 150.0,
              height: 150.0,
              ),
            PictureButton(
              image: "assets/tree2.png",
              text: "My Trees",
              nextpage: "/MyTrees",
              width: 150.0,
              height: 150.0,
              ),
          ],
        ),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PictureButton(
              image: "assets/tree3.png",
              text: "Community",
              nextpage: "/Community",
              width: 330.0,
              height: 150.0,
              ),
            ],
          ),
          ],
      )
    );
  }
}