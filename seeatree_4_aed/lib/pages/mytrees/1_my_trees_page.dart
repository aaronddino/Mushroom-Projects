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
//import 'dart:async';

var apiKey = "";

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
    new Marker("1", "Home", -27.340060, 153.038300,
    color: Colors.green[200], markerIcon: new MarkerIcon(
        "assets/tree1.png", //Asset to be used as icon
        width: 100.0, //New width for the asset
        height: 100.0, // New height for the asset
    )), 
    new Marker("2", "Some Place", -27.339524, 153.039460, color: Colors.green[200], 
    markerIcon: new MarkerIcon("assets/Shape.png", width: 100.0, height: 100.0)),
    new Marker("3", "Some Place", -27.341278, 153.039535, color: Colors.green[200], 
    markerIcon: new MarkerIcon("assets/Shape.png", width: 100.0, height: 100.0)),
  ];

  Marker x = new Marker("1", "Home", -27.340060, 153.038300,
    color: Colors.green[200], markerIcon: new MarkerIcon(
        "assets/tree1.png", //Asset to be used as icon
        width: 112.0, //New width for the asset
        height: 75.0, // New height for the asset
      ));
  
  showMap(){
    mapView.show(
      new MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: new CameraPosition(new Location(-27.340060, 153.038300), 15.0),
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
    cameraPosition = new CameraPosition(new Location(/*latitude*/-27.340060, /*longitude*/153.038300), /*zoom*/2.0);
    staticMapUri = staticMapProvider.getStaticUri(new Location(-27.340060,153.038300), 12, height: 100, width: 400, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context){
    //int x = 0;
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Trees"), backgroundColor: Colors.green),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /*View Map Button*/
          new Container(
            child: new Column(
              children: <Widget>[
                new InkWell(
                  child: new Center(
                    child:new Image.network(staticMapUri.toString()),
                  ),
                  onTap: showMap,
              ),
              new Text("View Map"),
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
          new Container(
            height: 400.0,
            child: new ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index){
                  return new Container(
                    child: new Column(
                      children: <Widget>[
                        new Image(image: new AssetImage("assets/sampletree.jpg"), height: 200.0, width: 500.0),
                        new Text("Date:"+"29/05/18", style: new TextStyle(fontSize: 12.0, color: Colors.black)),
                        new Text("Name:"+"Sample Name", style: new TextStyle(fontSize: 12.0, color: Colors.black)),
                      ],
                    )
                  );
                }
              ),
          ),
        ],
      ),
    );
  }
}
