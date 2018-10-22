/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Lack of Leaves Info
Purpose: 
- Displays thorough information of what qualifies as a landmark tree.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

class LackLeavesInfoPage extends StatelessWidget{
  final String lackleavesinfo = "A tree lacking leaves is a trait that belongs to veteran trees. Examples can be seen in the images above. "
  + " Put simply, are a skeleton of their former self, prime with leaves.\n"; 
  final String info = "As a general rule, a veteran tree can be distinguished by the following features:\n";

  final List<String> features = [
  "Maximum pollination and seed capacity\n",
  "Onset of natural limb loss\n",
  "Accelerated fungal colonisation and activity\n",
  "Increased colonisation by flora and fauna\n",
  "Crown collapse or peak\n",
  "Maximum folliage and vitality\n",
  "Moderate to high wood decay\n",
  "Presence of hollows\n",
  ];

  Container myBullet(){
  @override
  Container i = new Container(
    height: 20.0,
    width: 20.0,
    decoration: new BoxDecoration(
    color: Colors.green[200],
    shape: BoxShape.circle,
  ),
  );
  return i;
  }

  List<Widget> featuresList(){
    List<Widget> list = new List();
    list.add(new Text(lackleavesinfo, 
                style: new TextStyle(fontSize: 15.0, color: Colors.black)),);
    list.add(new Text(info, 
                style: new TextStyle(fontSize: 15.0, color: Colors.black)),);
    for(int i =0;i<features.length; i++){
      list.add(new ListTile(leading: myBullet(),
    title: new Text(features[i], 
                style: new TextStyle(fontSize: 15.0, color: Colors.black),)
    ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: new Text("What does a Lack of Leaves Mean?"), backgroundColor: Colors.green),
      body: new Column(
        children: <Widget>[
          new Image(image: new AssetImage("assets/lack_leaves.png"), height: 250.0, width: 300.0),
          new Flexible( //Information
           
            child: new ListView(
              children: featuresList(),
            ),
          ),

        ],
      ),
    );
  }
}