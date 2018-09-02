/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Main
Purpose: 
- Executes the app and runs the main function. 
- Page Navigation links are directed here.
*/

import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/homepage.dart';
import 'package:seeatree_4_aed/pages/addtree/1_addtree_page.dart';
import 'package:seeatree_4_aed/pages/addtree/2_rules_page.dart';
import 'package:seeatree_4_aed/pages/addtree/3_health_page.dart';
import 'package:seeatree_4_aed/pages/addtree/4_landmark_page.dart';
import 'package:seeatree_4_aed/pages/addtree/5_size_page.dart';
import 'package:seeatree_4_aed/pages/addtree/6_girth_page.dart';
import 'package:seeatree_4_aed/pages/addtree/7_canopy_page.dart';
import 'package:seeatree_4_aed/pages/addtree/8_botanical_page.dart';
import 'package:seeatree_4_aed/pages/addtree/9_historical_page.dart';
import 'package:seeatree_4_aed/pages/addtree/10_shape_page.dart';
import 'package:seeatree_4_aed/pages/addtree/11_habitat_page.dart';
import 'package:seeatree_4_aed/pages/addtree/12_species_page.dart';
import 'package:seeatree_4_aed/pages/addtree/12.5_species_information.dart';
import 'package:seeatree_4_aed/pages/addtree/13_submission_page.dart';
import 'package:seeatree_4_aed/pages/addtree/14_submitted_page.dart';
import 'package:seeatree_4_aed/pages/addtree/alice_code_stuff_will be removed.dart';
import 'package:seeatree_4_aed/pages/addtree/image_page.dart';
import 'package:seeatree_4_aed/pages/mytrees/1_my_trees_page.dart';
import 'package:seeatree_4_aed/pages/community/1_community_page.dart';
import 'package:seeatree_4_aed/pages/mytrees/view_map.dart';
import 'package:seeatree_4_aed/loginpage.dart'; 
import 'package:seeatree_4_aed/objects/item.dart' as globals; 

//info_pages
import 'package:seeatree_4_aed/pages/information/landmark_info_page.dart';
import 'package:seeatree_4_aed/pages/information/shape_info_page.dart';
import 'package:seeatree_4_aed/pages/information/rare_info_page.dart';

var apiKey = "AIzaSyDG7K0hQsak5XiJQmky627NprbaB61QJwo";

void main(){
  MapView.setApiKey(apiKey);
  runApp(new MaterialApp(
    home: new LoginPage(),
    routes: <String, WidgetBuilder>{
      "/HomePage": (BuildContext context) => new HomePage(),
      "/AddTree": (BuildContext context) => new AddTreePage(),
      "/MyTrees": (BuildContext context) => new MyTreesPage(),
      "/Community": (BuildContext context) => new CommunityTreesPage(),
      "/Rules": (BuildContext context) => new RulesPage(),
      "/HealthConditions": (BuildContext context) => new HealthConditionsPage(),
      "/LandmarkStatus": (BuildContext context) => new LandmarkStatusPage(),
      "/SizeStatus": (BuildContext context) => new SizeStatusPage(),
      "/CanopyStatus": (BuildContext context) => new CanopyStatusPage(),
      "/GirthStatus": (BuildContext context) => new GirthStatusPage(),
      "/BotanicalStatus": (BuildContext context) => new BotanicalStatusPage(),
      "/HistoricalStatus": (BuildContext context) => new HistoricalStatusPage(),
      "/ShapeStatus": (BuildContext context) => new ShapeStatusPage(),
      "/HabitatStatus": (BuildContext context) => new HabitatStatusPage(),
      "/Species": (BuildContext context) => new SpeciesPage(),
      "/ViewMap": (BuildContext context) => new ViewMapPage(),
      "/Submit": (BuildContext context) => new SubmitStatusPage(),
      "/Submission": (BuildContext context) => new SubmissionPage(),
      "/Submitted": (BuildContext context) => new SubmittedPage(),
      "/image": (BuildContext context) => new ImagePage(),
      "/speciesinfo": (BuildContext context) => new SpeciesinformationPage(),
      //info screens
      "/LandmarkInfo": (BuildContext context) => new LandmarkInfoPage(),
      "/ShapeInfo": (BuildContext context) => new ShapeInfoPage(),
      "/RareInfo": (BuildContext context) => new RareInfoPage(),
    }
  ));
}

//---------------------------------------------------------------Pages-----------------------------------------------------------------------------//

//------------------------------------------------------------------Tree Submission Pages---------------------------------------------------------//

//#2.11111111111: Name of Species Page
class NameofSpeciesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Name of Species"), backgroundColor: Colors.green),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new TextCard(text:"Do any of these match your tree?", size: 15.0, box:Colors.grey[200]),
          
      ],)
    );
  }
}
//----------------------------------------------------------------------------------Other Pages------------------------------------------------//


