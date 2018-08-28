/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Species Identification
Purpose: 
- Displays aesthetic images displaying key-
- -features of specific tree species.
- Acquires direct species name input.
- Redirects to pages: Species Info, Submission Page.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

/*might try out https://flutter.io/cookbook/lists/grid-lists/ */

class SpeciesPage extends StatefulWidget{
  @override
  SpeciesPageState createState() => new SpeciesPageState();
}

class SpeciesPageState extends State<SpeciesPage>{

  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("What is the Species?"),backgroundColor: Colors.green,),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[ /*Ancestor */
          new Container( /*contains input fields for names */
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextCard(text:"Know the name?", size: 15.0, box:Colors.grey[200]),
              ],
            ),
          ),
          new TextCard(text:"Do any of these match your tree?", size: 15.0, box:Colors.grey[200]),
          new Container(
            height: 250.0,
            child: new ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return new Container(
                    child: new Column(
                      children: <Widget>[
                        new RaisedButton(
                          onPressed: (){globals.item.species = "purple";},
                          child: new Image(image: new AssetImage("assets/samplefeature.jpg"), height: 200.0, width: 500.0),
                        ),
                        new RaisedButton(
                          onPressed: (){globals.item.species = "white";},
                          child: new Image(image: new AssetImage("assets/samplefeature2.jpg"), height: 200.0, width: 500.0),
                        ),

                      ],
                    )
                  );
                }
              ),
          ),
          new TextButton( /*Not sure Button */
            text: "I'm not sure",
            color: Colors.white,
            nextpage: "/Submission",
          ),
      ],)
    );
  }

}