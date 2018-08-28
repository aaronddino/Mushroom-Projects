import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
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

  String _path;

  Future<Null> uploadfile(String filepath) async {
    //file conversion
    final ByteData bytes = await rootBundle.load(filepath);
    final Directory tempDir = Directory.systemTemp;
    final String filename = "${Random().nextInt(10000)}.png}";
    final File file = File('${tempDir.path}/$filename');
    file.writeAsBytes(bytes.buffer.asInt8List(), mode: FileMode.write);

    //storage logic
    final StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    final StorageUploadTask task = ref.putFile(file);
    final Uri downloadUrl = (await task.future).downloadUrl;
    _path = downloadUrl.toString();
    print(_path);

  }



  @override
  Widget build(BuildContext context){
      DateTime today = new DateTime.now();
      String dateSlug ="${today.day.toString()}-${today.month.toString().padLeft(2,'0')}-${today.year.toString().padLeft(2,'0')}";
      print(dateSlug);
     return new Material(
      color: Colors.pinkAccent,
      child: new InkWell(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: filenames.map((name) => GestureDetector(
                onTap: ()async{
                  await uploadfile(name);
                },
                child: Image.asset(
                  name,
                  width: 100.0,
                ))).toList(),

                ),
                Container(
                  color: Colors.black,
                  width: 150.0,
                  height: 150.0,
                  child:Image.network(globals.item.image1),
                ),


            new Text("landmark " + globals.item.landmark, style: new TextStyle(color: Colors.white,),),
            new Text("height " + globals.item.height, style: new TextStyle(color: Colors.white,),),
            new Text("health " + globals.item.health, style: new TextStyle(color: Colors.white,),),
            new Text("girth " + globals.item.girth, style: new TextStyle(color: Colors.white,),),
            new Text("canopy " + globals.item.canopy, style: new TextStyle(color: Colors.white,),),
            new Text("botanical " + globals.item.botanical, style: new TextStyle(color: Colors.white,),),
            new Text("historical " + globals.item.historical, style: new TextStyle(color: Colors.white,),),
            new Text("shape " + globals.item.shape, style: new TextStyle(color: Colors.white,),),
            new Text("habitat " + globals.item.habitat, style: new TextStyle(color: Colors.white,),),

            new Text("Image 1 " + globals.item.image1, style: new TextStyle(color: Colors.white,),),
            new Text("Image 2 " + globals.item.image2, style: new TextStyle(color: Colors.white,),),
            new RaisedButton(
              color: Colors.black,
              onPressed: (){
                globals.item.date = dateSlug;
                itemref.push().set(send.toJson());
              },

            ),
            
          ],

        ),
  
        
      ),

    );
  }
}

List<String> filenames = <String>[
  'assets/tree1.png',
  'assets/tree2.png',
  'assets/tree3.png',

];