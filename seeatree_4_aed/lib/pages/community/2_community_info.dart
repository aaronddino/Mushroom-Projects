/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Community
Purpose: 
- Lists recent trees submitted by the community, ordered by most recent.
- Allows google maps view to display recent trees submitted by community.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:map_view/map_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:seeatree_4_aed/objects/itemconstructor.dart';
import 'package:seeatree_4_aed/objects/Firebase.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;
//import 'dart:async';

class CommunityInfoPage extends StatefulWidget {
  @override
  CommunityInfoState createState() => new CommunityInfoState();
}

class CommunityInfoState extends State<CommunityInfoPage> {
  String _health = "";
  String _image1 = "";
  String _image2 = "";
  String _date = "";
  String _species = "";
  String _height = "";
  Color landmarkcolor = Colors.black;
  Color botanicalcolor = Colors.black;
  Color habitatcolor = Colors.black;
  Color historicalcolor = Colors.black;
  Color shapecolor = Colors.black;
  double logosize = 30.0;

  @override
  void initState() {
    FirebaseTodos.getTodo(globals.communityinfokey).then(_updatetodo);
    
    super.initState();
    
  }

  _updatetodo(Item value) {
    var grabhealth = value.health;
    var grabdate = value.date;
    var grabspecies = value.species;
    var grabimage1 = value.image1;
    var grabimage2 = value.image2;
    var grabheight = value.height;

    var grablandmark = value.landmark;
    var grabbotanical = value.botanical;
    var grabhabitat = value.habitat;
    var grabshape = value.shape;
    var grabhistorical = value.historical;

    setState(() {
      _health = grabhealth;
      _image1 = grabimage1;
      _image2 = grabimage2;
      _species = grabspecies;
      _date = grabdate;
      _height = grabheight;
      if (grablandmark == "Yes") {
        landmarkcolor = Colors.green;
      }
      if (grabbotanical == "Yes") {
        botanicalcolor = Colors.green;
      }
      if (grabhabitat == "Yes") {
        habitatcolor = Colors.green;
      }
      if (grabhistorical == "Yes") {
        historicalcolor = Colors.green;
      }
      if (grabshape == "Yes") {
        shapecolor = Colors.green;
      }
    }
    
    );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Information"), 
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: (){
                  Navigator.of(context).pushNamed("/poprules");
                },
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.of(context).pushNamed("/HomePage");
                },
              ),
            ],
            backgroundColor: Colors.green,
            ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    color: Colors.white,
                    width: 150.0,
                    height: 200.0,
                    child: Image.network(_image1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    color: Colors.white,
                    width: 150.0,
                    height: 200.0,
                    child: Image.network(_image2),
                  ),
                ),
              ],
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 50.0,
                child: new RaisedButton(
                  color: Colors.white,
                  child:
                      new Icon(Icons.dvr, color: landmarkcolor, size: logosize),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/LandmarkInfo");
                  },
                ),
              ),
              Container(
                width: 50.0,
                child: new RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/RareInfo");
                  },
                  child: new Icon(Icons.spa,
                      color: botanicalcolor, size: logosize),
                ),
              ),
              Container(
                width: 50.0,
                child: new RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    //Navigator.of(context).pushNamed("/RareInfo");
                  },
                  child: new Icon(Icons.local_florist,
                      color: habitatcolor, size: logosize),
                ),
              ),
              Container(
                width: 50.0,
                child: new RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/HistoricInfo");
                  },
                  child: new Icon(Icons.book,
                      color: historicalcolor, size: logosize),
                ),
              ),
              Container(
                width: 50.0,
                child: new RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/ShapeInfo");
                  },
                  child: new Icon(Icons.nature_people,
                      color: shapecolor, size: logosize),
                ),
              ),
            ],
          ),
          new Text("Species: " + _species,
              style: new TextStyle(fontSize: 20.0, color: Colors.black)),
          new Text("Date Taken: " + _date,
              style: new TextStyle(fontSize: 20.0, color: Colors.black)),
          new Text("Health: " + _health,
              style: new TextStyle(fontSize: 20.0, color: Colors.black)),
          new Text("Height: " + _height,
              style: new TextStyle(fontSize: 20.0, color: Colors.black)),
        ],
      ),
    );
  }
}
