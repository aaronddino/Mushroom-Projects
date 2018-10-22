/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: My Trees
Purpose: 
- Lists all trees submitted by user, ordered by most recent.
- Allows google maps view to display all trees submitted by user.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:map_view/map_view.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;
import 'package:firebase_database/firebase_database.dart';
//import 'dart:async';

var apiKey = "AIzaSyDG7K0hQsak5XiJQmky627NprbaB61QJwo";


class MyTreesPage extends StatefulWidget{
  @override
  MyTreesState createState() => new MyTreesState();
}

class MyTreesState extends State<MyTreesPage>{
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider(apiKey);
  Uri staticMapUri;
 
  List<Marker> markers = <Marker>[
    
    /*new Marker("1", "mr test tree", -27.340060, 153.038300,
    color: Colors.green[200], markerIcon: new MarkerIcon(
        "assets/tree1.png", //Asset to be used as icon
        width: 100.0, //New width for the asset
        height: 100.0, // New height for the asset
    )),*/
    /*
    new Marker("1", "Home", -27.340060, 153.038300,
    markerIcon: new MarkerIcon(
        "assets/tree1.png", //Asset to be used as icon
        width: 100.0, //New width for the asset
        height: 100.0, // New height for the asset
    )), 
    new Marker("2", globals.myitems[1].species, -27.339524, 153.039460, color: Colors.green[200], 
    markerIcon: new MarkerIcon("assets/Shape.png", width: 100.0, height: 100.0)),
    new Marker("3", "Some Place", -27.341278, 153.039535, color: Colors.green[200], 
    markerIcon: new MarkerIcon("assets/Shape.png", width: 100.0, height: 100.0)),
    //This should work if Alice McKellar's code wasn't broken.
  */
  ];
  
  void makemarkers(List<Marker> markers){
    for(int i = 0; i < globals.myitems.length; i++){ //will crash if length is less than specified. Need size of myitems
      markers.add(new Marker(i.toString(), globals.myitems[i].species, double.parse(globals.myitems[i].latitude), double.parse(globals.myitems[i].longitude), 
      markerIcon: new MarkerIcon("assets/Shape.png", width: 100.0, height: 100.0)));
    }
  }
  
  showMap(){
    mapView.show(
      new MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: new CameraPosition(new Location(double.parse(globals.current_user_latitude), double.parse(globals.current_user_longitude)), 15.0),
        showUserLocation: true,
        title: "My Tree Locations",
      )
    );
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
  void initState(){
    super.initState();
    cameraPosition = new CameraPosition(new Location(double.parse(globals.current_user_latitude), double.parse(globals.current_user_longitude)), /*zoom*/2.0);
    staticMapUri = staticMapProvider.getStaticUri(new Location(double.parse(globals.current_user_latitude), double.parse(globals.current_user_longitude)), 12, height: 100, width: 400, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context){
    makemarkers(markers);
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("My Trees"), 
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
                    child:new Image.asset("assets/tree1.png")
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
              new TextCard(text:"Most Recent", size: 15.0, box:Colors.grey[200]),
            ],
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: FirebaseDatabase.instance.reference().child('items'),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {

                    if(snapshot.value["Email"]== globals.useremail){
                return new RaisedButton(
                  color: Colors.white,
                    onPressed: () {

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
                  } else{
                    return new Container(height: 0.0,);
                  }
                  
              },
            ),
          ),
        ],
      ),
    );
  }
}
