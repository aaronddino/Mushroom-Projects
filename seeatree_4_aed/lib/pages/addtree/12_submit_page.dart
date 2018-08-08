import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals; 
import 'package:seeatree_4_aed/objects/itemconstructor.dart'; 

class SubmitStatusPage extends StatefulWidget{
  @override
  State createState() => new SubmitStatusPageState();
}

class SubmitStatusPageState extends State<SubmitStatusPage>{

  Item send = globals.item;
  DatabaseReference itemref;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemref = database.reference().child('items');

  }





  @override
  Widget build(BuildContext context){
     return new Material(
      color: Colors.pinkAccent,
      child: new InkWell(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("landmark " + globals.item.landmark, style: new TextStyle(color: Colors.white,),),
            new Text("height " + globals.item.height, style: new TextStyle(color: Colors.white,),),
            new Text("health " + globals.item.health, style: new TextStyle(color: Colors.white,),),
            new Text("girth " + globals.item.girth, style: new TextStyle(color: Colors.white,),),
            new Text("canopy " + globals.item.canopy, style: new TextStyle(color: Colors.white,),),
            new Text("botanical " + globals.item.botanical, style: new TextStyle(color: Colors.white,),),
            new Text("historical " + globals.item.historical, style: new TextStyle(color: Colors.white,),),
            new Text("shape " + globals.item.shape, style: new TextStyle(color: Colors.white,),),
            new Text("habitat " + globals.item.habitat, style: new TextStyle(color: Colors.white,),),
            new RaisedButton(
              color: Colors.black,
              onPressed: (){
                itemref.push().set(send.toJson());
              },

            ),
            
          ],
        ),
      ),
    );
  }
}