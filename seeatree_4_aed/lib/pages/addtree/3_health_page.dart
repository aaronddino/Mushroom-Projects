/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Health Status
Purpose: 
- Displays various traits of a tree's condition.
- Depending on selected checkboxes, decides upon the current health condition of the tree.
- Redirects to pages: Landmark Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//new Checkbox(value: _isChecked, onChanged: (bool value){onChanged(value);}),

//#2.11: Health Conditions Page
class HealthConditionsPage extends StatefulWidget{
  @override
  HealthConditionsState createState() => new HealthConditionsState();
}

class HealthConditionsState extends State<HealthConditionsPage>{  
  String currentcondition = " ";
  Color conditioncolor = Colors.greenAccent[500];
  List<bool> _data = new List<bool>();
  List<String> traits = [
  "A lot of fallen leaves",
  "Dropped branches with no leaves",
  "Rotten wood",
  "Holes in tree trunk",
  "Bare parts of tree trunk (no bark)",
  "Flaking bark",
  "Fungus near tree roots",
  "Pests (termites or beetles)",
  "Reduced Foliage (lack of leaves)",
  "Discoloured leaves",
  "Shrivelled leaves",
  ];
  List<String> conditions = [
    "1. Excellent",
    "2. Good",
    "3. Average",
    "4. Fair",
    "5. Poor",
    "6. Dying",
    "7. Dead"
  ];

  @override
  void initState() {
    setState(() {
          for(int i=0; i<traits.length; i++){
            _data.add(false);
          }
        });
  }
  void _onChanged(bool value, int index){
    //String currentcondition = conditions[0];
     setState(() {
       _data[index] = value;
       });
  }

  void treecondition(){
    int x = 0;
    for(int i=0; i<_data.length; i++){
      if(_data[i]==true){
        x = x + 1;
        }
      if (x==0){
         currentcondition = conditions[0];
         conditioncolor = Colors.green[300];
      }
      else if (x==3 || x==1|| x==2){
        currentcondition = conditions[1];
        conditioncolor = Colors.green[200];
      }
      else if (x==4||x==5||x==6){
      currentcondition = conditions[2];
      conditioncolor = Colors.green[100];
      }
      else if (x==7||x==8){
      currentcondition = conditions[3];
      conditioncolor = Colors.lightGreen[300];
      }
      else if (x==9||x==10){
      currentcondition = conditions[4];
      conditioncolor = Colors.lightGreen[200];
      }
      else{
      currentcondition = conditions[5];
      conditioncolor = Colors.lightGreen[100];
      }
    }
  }

  @override
  Widget build(BuildContext context){
    currentcondition = conditions[0];
    //int x = 0;
    treecondition();
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Health"), 
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new TextCard(text:"How healthy is the tree?", size: 15.0, box:Colors.grey[200]),
          //Changing state
          new TextCard(text: currentcondition, box: conditioncolor),
          new TextCard(text:"Does the tree show any of these traits? (Scroll through)", size: 11.0, box:Colors.grey[200]),
          new Container(
            height: 300.0,
            child: new ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index){
                  return new Card(
                    color: Colors.green[50],
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new CheckboxListTile(value: _data[index], title: new Text(traits[index]),onChanged: (bool value){_onChanged(value, index);}),
                        ],
                      )
                    ),
                  );
                }
              ),
          ),
          //Next button
          new RaisedButton(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Text("Next"),
                  ],
                ),
                onPressed: () {
                  globals.item.health = currentcondition.split(". ")[1];
                  Navigator.of(context).pushNamed("/LandmarkStatus");},
              ),
        ],
      ),
    );
  }

}