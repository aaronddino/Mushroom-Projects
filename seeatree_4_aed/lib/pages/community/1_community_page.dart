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
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;
import 'package:seeatree_4_aed/objects/Firebase.dart';
//import 'dart:async';

var apiKey = "AIzaSyDG7K0hQsak5XiJQmky627NprbaB61QJwo";

class CommunityTreesPage extends StatefulWidget {
  @override
  CommunityTreesState createState() => new CommunityTreesState();
}

class CommunityTreesState extends State<CommunityTreesPage> {
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider(apiKey);
  Uri staticMapUri;
  String test = "";

  List<Marker> markers = <Marker>[

  ];

  void makemarkers(List<Marker> markers){
    for(int i = 0; i < globals.allitems.length; i++){ 
      markers.add(new Marker(i.toString(), globals.allitems[i].species, double.parse(globals.allitems[i].latitude), double.parse(globals.allitems[i].longitude), 
      markerIcon: new MarkerIcon("assets/Shape.png", width: 100.0, height: 100.0)));
    }
  }

  

  showMap() {
    mapView.show(new MapOptions(
      mapViewType: MapViewType.normal,
      initialCameraPosition:
          new CameraPosition(new Location(double.parse(globals.current_user_latitude), double.parse(globals.current_user_longitude)), 15.0),
      showUserLocation: true,
      title: "Tree Locations (Community)",
    ));
    mapView.setMarkers(markers);
    mapView.zoomToFit(padding: 100);

    mapView.onMapReady.listen((_){
      setState(() {
        mapView.setMarkers(markers);
        mapView.zoomToFit(padding: 100);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    cameraPosition = new CameraPosition(
        new Location(double.parse(globals.current_user_latitude), double.parse(globals.current_user_longitude)),
        /*zoom*/ 2.0);
    staticMapUri = staticMapProvider.getStaticUri(
        new Location(double.parse(globals.current_user_latitude), double.parse(globals.current_user_longitude)), 12,
        height: 100, width: 400, mapType: StaticMapViewType.roadmap);
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);

    
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
      
    });
  }


  _onEntryChanged(Event event) {
  
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    print(globals.allitems[0].latitude);
    print(globals.allitems[0].longitude);
    print(globals.allitems[0].latitude);
    print(globals.allitems.length);
    makemarkers(markers);
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Everyones Trees"), 
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
          /*View Map Button*/
          new Container(
            child: new Column(
              children: <Widget>[
                new InkWell(
                  child: new Center(
                    child: new Image.asset("assets/tree1.png"),
                  ),
                  onTap: showMap,
                ),
                new Text("Click to View Map"),
              ],
            ),
          ),
          /*Most Recent Trees*/
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextCard(
                  text: "Most Recent", size: 15.0, box: Colors.grey[200]),
            ],
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: FirebaseDatabase.instance.reference().child('items'),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new RaisedButton(
                  color: Colors.white,
                    onPressed: () {
                      globals.communityinfokey = items[index].key;
                      Navigator.of(context).pushNamed("/InfoCommunity");
                    },
                    child: new ListTile(
                        title: Text("Species: " +
                            snapshot.value["Species"]),
                        leading: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.blueGrey,
                          child: Image.network(snapshot.value["Image 1"]),
                        ),
                        subtitle: Text("Date: " +
                            snapshot.value["Date"]))
                                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
