import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:map_view/map_view.dart';
//import 'dart:async';

var apiKey = "";

class ViewMapPage extends StatefulWidget{
  @override
  ViewMapState createState() => new ViewMapState();
}

class ViewMapState extends State<ViewMapPage>{
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider(apiKey);
  Uri staticMapUri;

  showMap(){
    mapView.show(
      new MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: new CameraPosition(new Location(-27.340060, 153.038300), 15.0),
        showUserLocation: true,
        title: "My Tree Locations",

      )
    );
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
        children: <Widget>[
          /*View Map Button*/
          new Container(
            child: new InkWell(
              child: new Center(
                child:new Image.network(staticMapUri.toString()),
              ),
              onTap: showMap,
            ),
          ),
          new Text("View Map"),
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
