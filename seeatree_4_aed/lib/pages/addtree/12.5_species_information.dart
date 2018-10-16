import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

class SpeciesinformationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SpeciesinformationPageState();
  }
}

class SpeciesinformationPageState extends State<SpeciesinformationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
            title: new Text(globals.displayspecies.commoname), 
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
                  Navigator.of(context).pushNamed("/");
                },
              ),
            ],
            backgroundColor: Colors.green,
            ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:5.0),
                child: Container(
                  color: Colors.grey,
                  width: 300.0,
                  height: 200.0,
                  child: new Image(
                      image: new AssetImage(globals.displayspecies.mainImage)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      width: 110.0,
                      height: 100.0,
                      child: new Image(
                          image: new AssetImage(globals.displayspecies.image1)),
                    ),
                    Container(
                      color: Colors.grey,
                      width: 110.0,
                      height: 100.0,
                      child: new Image(
                          image: new AssetImage(globals.displayspecies.image2)),
                    ),
                    Container(
                      color: Colors.grey,
                      width: 110.0,
                      height: 100.0,
                      child: new Image(
                          image: new AssetImage(globals.displayspecies.image3)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                child: new Text(
                    "Scientific Name: " + globals.displayspecies.speicesname,
                    style: new TextStyle(fontSize: 15.0, color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: new Text(globals.displayspecies.description,
                    style: new TextStyle(fontSize: 15.0, color: Colors.black)),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.brown,
                      elevation: 5.0,
                      child: MaterialButton(
                        minWidth: 150.0,
                        height: 42.0,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/Species");
                        },
                        color: Colors.grey,
                        child:
                            Text('Back', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.brown,
                      elevation: 5.0,
                      child: MaterialButton(
                        minWidth: 150.0,
                        height: 42.0,
                        onPressed: () {
                          globals.item.species =
                              globals.displayspecies.speicesname;
                          Navigator.of(context).pushNamed("/Submission");
                        },
                        color: Colors.green.shade600,
                        child: Text('This is the one!',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
