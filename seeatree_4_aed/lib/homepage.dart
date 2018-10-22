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
import 'package:seeatree_4_aed/auth.dart';
import 'package:seeatree_4_aed/objects/constants.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:async';

//#1: Home Page of the See A Tree App
class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  DatabaseReference itemRef;
  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;
  List<Item> items = List();
  int index = 0;
  bool _permission = false;
  String error;
  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();

  @override
  void initState() {
    super.initState();
    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        _currentLocation = result;
      });
    });
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
  }

  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      _startLocation = location;
    });
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
    globals.allitems.clear();
    globals.myitems.clear();
    FirebaseTodos.getTodo(items[items.length - 1].key).then(_updatetodo);
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
      globals.allitems.add(new Item(
          grabhealth,
          grablandmark,
          grabheight,
          grabgirth,
          grabcanopy,
          grabbotanical,
          grabhistorical,
          grabshape,
          grabhabitat,
          grabimage1,
          grabimage2,
          grabdate,
          grabspecies,
          grablatitude,
          grablongitude,
          grabuseremail,
          grabowneraware));
      if (grabuseremail == globals.useremail) {
        globals.myitems.add(new Item(
            grabhealth,
            grablandmark,
            grabheight,
            grabgirth,
            grabcanopy,
            grabbotanical,
            grabhistorical,
            grabshape,
            grabhabitat,
            grabimage1,
            grabimage2,
            grabdate,
            grabspecies,
            grablatitude,
            grablongitude,
            grabuseremail,
            grabowneraware));
      }
      globals.amount_items_all = globals.allitems.length;
      globals.amount_items_mytrees = globals.myitems.length;
      index++;
    });
  }

  void choiceAction(String choice) {
    if (choice == Constants.Logout) {
      print('logout presdsed');
      widget.signOut();
      Navigator.of(context).pushNamed("/");
    } else if (choice == Constants.Home) {
      Navigator.of(context).pushNamed("/");
      print('home pressed');
    } else if (choice == Constants.PrivacyPolicy) {
      Navigator.of(context).pushNamed("/PrivacyPolicy");
      print('privacy pressed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
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
                new RaisedButton(
                    padding: new EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new Image(
                            image: new AssetImage("assets/tree2.png"),
                            width: 150.0,
                            height: 150.0),
                        new Text("My Trees"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/MyTrees");
                      globals.current_user_longitude =
                          _startLocation["longitude"].toString();
                      globals.current_user_latitude =
                          _startLocation["latitude"].toString();
                    }),
              ],
            ),

            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                    padding: new EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new Image(
                            image: new AssetImage("assets/tree3.png"),
                            width: 330.0,
                            height: 150.0),
                        new Text("Everyone's Tree"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/Community");
                      globals.current_user_longitude =
                          _startLocation["longitude"].toString();
                      globals.current_user_latitude =
                          _startLocation["latitude"].toString();
                    }),
              ],
            ),
          ],
        ));
  }
}
