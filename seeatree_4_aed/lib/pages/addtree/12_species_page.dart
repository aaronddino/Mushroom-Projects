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
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;
  void loadData(){
    List<String> genusList = [
    "I don't know",
    "Abrophyllum",
    "Acacia",
    "Acmena",
    "Acronychia",
    "Alectryon",
    "Allocasuarina",
    "Alphitonia",
    ];
    listDrop = [];
    for(int i=0;i<genusList.length; i++){
      listDrop.add(new DropdownMenuItem(
        child: new Text(genusList[i]),
        value: genusList[i],
      ));
    }
  }

  @override
  Widget build(BuildContext context){
    loadData();
    return new Scaffold(
      appBar: new AppBar(title: new Text("What is the Species?"),backgroundColor: Colors.green,),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[ /*Ancestor */
          new Container( /*contains input fields for names */
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextCard(text:"Know the binomial name?", size: 15.0, box:Colors.grey[200]),
                //genus text input
                new TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                  hintText: 'Type Tree Genus...',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                )),
              ],
            ),
          ),

          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextCard(text:"Try to find the genus name?", size: 15.0, box:Colors.grey[200]),
            ]
          ),

          //Dropdown genus selection
          new DropdownButton(
            value: selected,
            items: listDrop,
            hint: new Text('Select a genus'),
            onChanged: (value){
              selected = value;
              setState(() {
                if(value == "Abrophyllum"){
                  globals.item.species = "Abrophyllum";


                }
          
              });
            }
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextCard(text:"Do any of these match your tree?", size: 15.0, box:Colors.grey[200]),
            ]
          ),
          new Container(
            height: 250.0,
            child: new ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return new Container(
                    child: new Column(
                      children: <Widget>[
                        new Image(image: new AssetImage("assets/samplefeature.jpg"), height: 200.0, width: 500.0),
                        new Image(image: new AssetImage("assets/samplefeature2.jpg"), height: 200.0, width: 500.0),
                      ],
                    )
                  );
                }
              ),
          ),
          
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextButton( /*Not sure Button */
                text: "Submit",
                color: Colors.white,
                nextpage: "/Submission"
              ),
            ],
          ),

      ],)
    );
  }

}