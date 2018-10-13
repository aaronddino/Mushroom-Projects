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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;
import 'package:seeatree_4_aed/objects/itemconstructor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:seeatree_4_aed/objects/Firebase.dart';

//#1: Home Page of the See A Tree App
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
    DatabaseReference itemRef;
    List<Item> items = List();
     int index = 0;

   @override
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
      
    });
     globals.allitems.clear();
     globals.myitems.clear();
      FirebaseTodos.getTodo(items[items.length-1].key).then(_updatetodo); 
  }

   _updatetodo(Item value) {

   
    var grabhealth = value.health;
    var grabgirth = value.girth;
    var grabdate = value.date;
    var grabspecies = value.species;
    var grabimage1 = value.image1;
    var grabimage2 = value.image2;
    var grabheight = value.height;
    var grabcanopy = value.canopy;
    var grablongitude = value.longitude;
    var grablatitude = value.latitude;
    var grabuseremail = value.useremail;
    var grabowneraware = value.owneraware;

    var grablandmark = value.landmark;
    var grabbotanical = value.botanical;
    var grabhabitat = value.habitat;
    var grabshape = value.shape;
    var grabhistorical = value.historical;

    setState(() {
      globals.allitems.add(new Item(grabhealth, grablandmark, grabheight, grabgirth,grabcanopy,grabbotanical,grabhistorical,grabshape,grabhabitat,grabimage1,grabimage2,grabdate,grabspecies,grablatitude,grablongitude,grabuseremail,grabowneraware));
      if(grabuseremail == globals.useremail){
        globals.myitems.add(new Item(grabhealth, grablandmark, grabheight, grabgirth,grabcanopy,grabbotanical,grabhistorical,grabshape,grabhabitat,grabimage1,grabimage2,grabdate,grabspecies,grablatitude,grablongitude,grabuseremail,grabowneraware));
      }
      index++;
    }
    
    );

  }



  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("See A Tree",
                style: new TextStyle(fontSize: 40.0),
                textAlign: TextAlign.center),
            backgroundColor: Colors.green),
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
                  nextpage: "/Rules",
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
                  text: "Everyones Tree",
                  nextpage: "/Community",
                  width: 330.0,
                  height: 150.0,
                ),
              ],
            ),
          ],
        ));
  }
}
