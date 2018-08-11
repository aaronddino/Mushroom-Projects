/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Add Tree
Purpose: 
- Displays instructions for optimal tree photo submission.
- Opens camera feature to take a photo of a tree.
- Redirects to pages: Rules.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//#2 Add Tree Page

class AddTreePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new AddTreePageState();
  }

}
class AddTreePageState extends State<AddTreePage>{
  File image;
  File image2;

  picker()async{
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if(img != null){
      if(image != null){
        image2 = img;
      }else{
        image = img;
      }
      setState(() {});
    }
  }




  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Add Tree"), backgroundColor: Colors.green),
      body: new Container(
        child: new Center(
          child: new Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text("Upload at Least One Image That:", style: new TextStyle(fontSize: 20.0), textAlign: TextAlign.center,),
              new Text("Contains the full size of the tree", style: new TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
              new Text("OPTIONAL: Extra images of close-ups, leaves, roots, or special features", style: new TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
              new Image(image: new AssetImage("assets/AddTreeSpecs.png"), width: 300.0, height: 150.0),
              new TextCard(text:"Would you like to add an image?", size: 12.0, box:Colors.grey[200]),
              new Column(
                children: <Widget>[
                  new IconButton(
                    color: Colors.grey[200],
                    icon: new Icon(Icons.camera_alt, color: Colors.black),
                    iconSize: 50.0, 
                    onPressed: picker, ///here
                  ),
                  new Text("Take Photo!", style: new TextStyle(fontSize: 15.0), textAlign: TextAlign.center,),
                ],
              ),
              new TextCard(text:"Are you happy with these images?", size: 12.0, box:Colors.grey[200]),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                     child: image == null
                        ? new Text('No Image to Show ')
                        : new Image.file(image),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                     child: image2 == null
                        ? new Text('No Image to Show ')
                        : new Image.file(image2),
                  ),
                ],
              ),
              new RaisedButton(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Text("Submit"),
                  ],
                ),
                onPressed: () {Navigator.of(context).pushNamed("/Rules");},
              )
            ]
          )
        )
      ),
    );
  }
}