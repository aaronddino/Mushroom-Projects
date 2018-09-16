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
import 'package:seeatree_4_aed/objects/item.dart' as globals;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart';
//import 'package:geolocation/geolocation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

//#2 Add Tree Page

class AddTreePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddTreePageState();
  }
}

class AddTreePageState extends State<AddTreePage> {
  File image;
  File image2;
  String _path = "";
  String _text = "";
   Map<String, double> _startLocation;
  Map<String, double> _currentLocation;

  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();
  bool _permission = false;
  String error;

  bool currentWidget = true;

  Image image1;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String,double> result) {
          setState(() {
            _currentLocation = result;
          });
        });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();


      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
        _startLocation = location;
    });

  }

 



  



 
  void _showAlert(String value){
    if(value.isEmpty) return;

    AlertDialog dialog = new AlertDialog(
      content: new Text(value,
      style: new TextStyle(fontSize: 30.0),),
      actions: <Widget>[
        new FlatButton(onPressed: (){Navigator.pop(context);} ,child: new Text('Okay'),),
      ],
    );
    showDialog(context: context, child: dialog);
  }


  Future<Null> uploadfile(File file) async {
    //file conversion
    final String filename = "${Random().nextInt(10000)}.png}";

    //storage logic
    final StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    final StorageUploadTask task = ref.putFile(file);
    final Uri downloadUrl = (await task.future).downloadUrl;
    globals.item.image1 = downloadUrl.toString();
    print(globals.item.image1);
  
  }
  Future<Null> uploadfile2(File file) async {
    //file conversion
    final String filename = "${Random().nextInt(10000)}.png}";

    //storage logic
    final StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    final StorageUploadTask task = ref.putFile(file);
    final Uri downloadUrl = (await task.future).downloadUrl;
    globals.item.image2 = downloadUrl.toString();
    print(globals.item.image2);
  
  }
  camera() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      if (image != null) {
        image2 = img;
        if (image2 != null) {
          image2 = image;
          image = img;
        }
      } else {
        image = img;
      }
      setState(() {});
    }
  }

  picker1() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
    }
    setState(() {});
  }

  picker2() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image2 = img;
    }
    setState(() {});
  }

   
  

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Permission"), 
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
      body: new Container(
          child: new Center(
              child: new Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
            new Text(
              "Upload at Least One Image That:",
              style: new TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            new Text(
              "Contains the full size of the tree",
              style: new TextStyle(fontSize: 11.0),
              textAlign: TextAlign.center,
            ),
            new Text(
              "OPTIONAL: Extra images of close-ups, leaves, roots, or special features",
              style: new TextStyle(fontSize: 11.0),
              textAlign: TextAlign.center,
            ),
            new Image(
                image: new AssetImage("assets/AddTreeSpecs.png"),
                width: 300.0,
                height: 150.0),
            new TextCard(
                text: "Would you like to add an image?",
                size: 12.0,
                box: Colors.grey[200]),
            new Column(
              children: <Widget>[
                new IconButton(
                  color: Colors.grey[200],
                  icon: new Icon(Icons.camera_alt, color: Colors.black),
                  iconSize: 50.0,
                  onPressed: camera,
                ),
                new Text(
                  "Take Photo!",
                  style: new TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            new TextCard(
                text: "Are you happy with these images?",
                size: 12.0,
                box: Colors.grey[200]),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: picker1,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: image == null
                        ? new Text('No Image to Show ')
                        : new Image.file(image),
                  ),
                ),
                new RaisedButton(
                  onPressed: picker2,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: image2 == null
                        ? new Text('No Image to Show ')
                        : new Image.file(image2),
                  ),
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
              onPressed: () {
                globals.item.longitude = _startLocation["longitude"].toString();
                globals.item.latitude = _startLocation["latitude"].toString();

                if (image != null) {
                  if (image2 != null) {
                    uploadfile2(image2);
                  }
                  uploadfile(image);

                  
                  
                  Navigator.of(context).pushNamed("/Permission");
                }else{
                  _showAlert("Please take or select a photo!");
                }
              },
            )
          ]))),
    );
  }
}
