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

class SpeciesPage extends StatefulWidget {
  @override
  SpeciesPageState createState() => new SpeciesPageState();
}

class SpeciesPageState extends State<SpeciesPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Species"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                Navigator.of(context).pushNamed("/poprules");
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
            ),
          ],
          backgroundColor: Colors.green,
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            /*Ancestor */
            new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new RaisedButton(
                    
                    
                    child: Container(
                      height: 80.0,
                      child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text("Do you know the tree by Name?",
                            style: new TextStyle(
                                fontSize: 15.0, color: Colors.black)),
                        new Icon(Icons.chevron_right),
                      ],
                    ),),
                    color: Colors.grey[200],
                    onPressed: () {
                      Navigator.of(context).pushNamed("/speciesextend");
                    },
                  ),
                  new TextCard(
                      text: "Do any of these match your tree?",
                      size: 15.0,
                      box: Colors.grey[200]),
                ]),
            new Container(
              height: 350.0,
              child: new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return new Container(
                    child: new Column(
                  children: <Widget>[
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Bangalow_Palm.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Bangalow_Palm.jpg";
                        globals.displayspecies.speicesname =
                            "Archontophoenix cunninghamiana";
                        globals.displayspecies.commoname = "Bangalow Palm";
                        globals.displayspecies.description =
                            "A tall palm with bright red berries, similar to the Alexandra Palm. This is the only palm tree native to the Redlands mainland.";
                        globals.displayspecies.image1 =
                            "assets/Bangalow_Palm_1.jpg";
                        globals.displayspecies.image2 =
                            "assets/Bangalow_Palm_2.jpg";
                        globals.displayspecies.image3 =
                            "assets/Bangalow_Palm_3.jpg";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Blueberry_Ash.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Blueberry_Ash.jpg";
                        globals.displayspecies.speicesname =
                            "Elaeocarpus reticulatus";
                        globals.displayspecies.commoname = "Blueberry Ash";
                        globals.displayspecies.description =
                            "An attractive tree that can be pruned to shape. Bears lots of small, bell shaped flowers and bright blue fruits. Grows to six metres tall.";
                        globals.displayspecies.image1 =
                            "assets/Blueberry_Ash_1.jpg";
                        globals.displayspecies.image2 =
                            "assets/Blueberry_Ash_2.jpg";
                        globals.displayspecies.image3 =
                            "assets/Blueberry_Ash_3.jpg";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image:
                              new AssetImage("assets/Broad_leaf_paperbark.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Broad_leaf_paperbark.jpg";
                        globals.displayspecies.speicesname =
                            "Melaleuca quinquenervia";
                        globals.displayspecies.commoname =
                            "Broad-leaf Paperbark";
                        globals.displayspecies.description =
                            "A tree with distinct papery bark that can grow up to 20 metres tall. Great for attracting wildlife. Oil extracted from leaves is used to treat colds.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Brush_Box.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Brush_Box.jpg";
                        globals.displayspecies.speicesname =
                            "Lophostemon confertus";
                        globals.displayspecies.commoname = "Brush Box";
                        globals.displayspecies.description =
                            "A fast-growing tree that can grow up to 25 metres tall. It is very hardy in dry conditions, a good bird attractor when flowering in spring, and also acts as a koala food tree.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Coastal_Banksia.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Coastal_Banksia.jpg";
                        globals.displayspecies.speicesname =
                            "Bankisa integrifolia";
                        globals.displayspecies.commoname = "Coastal Banksia";
                        globals.displayspecies.description =
                            "A versatile coastal tree up to 10 metres with golden, nectar-rich flower spikes. Flowers can be soaked in water to make a sweet drink.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Eprapah_Wattle.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Eprapah_Wattle.jpg";
                        globals.displayspecies.speicesname =
                            "Acacia fimbriata var. perangusta";
                        globals.displayspecies.commoname = "Eprapah Wattle";
                        globals.displayspecies.description =
                            "A hardy, fast growing tree with attractive weeping foliage and masses of yellow flowers in late winter. Can grow up to six metres.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Forest_She_oak.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Forest_She_oak.jpg";
                        globals.displayspecies.speicesname =
                            "Allocasuarina torulosa";
                        globals.displayspecies.commoname = "Forest She-oak";
                        globals.displayspecies.description =
                            "A hardy ornamental tree with fine weeping foliage. Female trees produce woody seed cones  which are important food for the rare Glossy Black Cockatoo.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Grey_Myrtle.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Grey_Myrtle.jpg";
                        globals.displayspecies.speicesname =
                            "Backhousia myrtifolia";
                        globals.displayspecies.commoname = "Grey Myrtle";
                        globals.displayspecies.description =
                            "A small ornamental tree, growing up to eight metres tall. Features showy, cream flowers and aromatic leaves when crushed. Hardy once established.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Macaranga.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Macaranga.jpg";
                        globals.displayspecies.speicesname =
                            "Macaranga tanarius";
                        globals.displayspecies.commoname = "Macaranga";
                        globals.displayspecies.description =
                            "Growing up to six metres tall, this is a fast growing tree, featuring huge, glossy leaves. A useful shade tree when creating a rainforest garden.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Native_Frangipani.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Native_Frangipani.jpg";
                        globals.displayspecies.speicesname =
                            "Hymenosporum flavum";
                        globals.displayspecies.commoname = "Native Frangipani";
                        globals.displayspecies.description =
                            "A fast growing tree, reaching to 10 metres tall. Features attractive foliage. Produces perfumed, yellow flowers.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage(
                              "assets/Native_Mulberry_Tree_1.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Native_Mulberry_Tree_1.jpg";
                        globals.displayspecies.speicesname =
                            "Pipturus argenteus";
                        globals.displayspecies.commoname = "Native Mulberry";
                        globals.displayspecies.description =
                            "A small, fast growing tree, occurring on rainforest edges. It can grow up to six metres tall and produces edible soft, fleshy fruits that are great for attracting birds.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Pink_Euodia.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Pink_Euodia.jpg";
                        globals.displayspecies.speicesname =
                            "Melicope elleryana";
                        globals.displayspecies.commoname = "Pink Euodia";
                        globals.displayspecies.description =
                            "A small, glossy-leaved tree, growing up to 10 metres tall. Features unusual clusters of pink flowers along the branches. Birds and butterflies love it.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage(
                              "assets/Pink_Tips_Bottlebrush.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Pink_Tips_Bottlebrush.jpg";
                        globals.displayspecies.speicesname =
                            "Melaleuca saligna";
                        globals.displayspecies.commoname =
                            "Pink Tips Bottlebrush";
                        globals.displayspecies.description =
                            "A small tree, growing up to five metres tall. Features papery bark, cream flowers and pink new growth. Hardy, but does best with some watering.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Plunkett_Mallee.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Plunkett_Mallee.jpg";
                        globals.displayspecies.speicesname =
                            "Eucalyptus curtisii";
                        globals.displayspecies.commoname = "Plunkett Mallee";
                        globals.displayspecies.description =
                            "A small, multi-stemmed gum tree that can grow up to six metres tall. Ideal for smaller yards. Hardy and bears masses of white flowers that attracts birds.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Scribbly_Gum.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Scribbly_Gum.jpg";
                        globals.displayspecies.speicesname =
                            "Eucalyptus racemosa";
                        globals.displayspecies.commoname = "Scribbly Gum";
                        globals.displayspecies.description =
                            "An imperative koala food tree, featuring a distinct silver-coloured trunk covered in scribble marks. Grows up to 30 metres tall and prefers sandy soil.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage(
                              "assets/Small_leafed_lilly_pilly.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Small_leafed_lilly_pilly.jpg";
                        globals.displayspecies.speicesname =
                            "Syzygium luehmannii";
                        globals.displayspecies.commoname =
                            "Small-leafed Lilly-pilly";
                        globals.displayspecies.description =
                            "Growing up to eight metres tall, this ornamental rainforest tree features dense, glossy foliage and edible red or pink fruits.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Tallowwood.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Tallowwood.jpg";
                        globals.displayspecies.speicesname =
                            "Eucalyptus microcorys";
                        globals.displayspecies.commoname = "Tallowwood";
                        globals.displayspecies.description =
                            "A fast growing tree with fibrous, brown-orange bark. A favourite of the local koalas and occurs naturally on sandy soil.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Water_Gum.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Water_Gum.jpg";
                        globals.displayspecies.speicesname =
                            "Tristaniopsis laurina";
                        globals.displayspecies.commoname = "Water Gum";
                        globals.displayspecies.description =
                            "An attractive and compact shade tree, reaching up to 15 metres tall. It produces clusters of small, yellow flowers that contrast against its glossy dark leaves.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                    new RaisedButton(
                      child: new Image(
                          image: new AssetImage("assets/Wheel_of_Fire.jpg"),
                          height: 200.0,
                          width: 500.0),
                      onPressed: () {
                        globals.displayspecies.mainImage =
                            "assets/Wheel_of_Fire.jpg";
                        globals.displayspecies.speicesname =
                            "Stenocarpus sinuatus";
                        globals.displayspecies.commoname = "Wheel of Fire";
                        globals.displayspecies.description =
                            "A rainforest tree with spectacular red flowers resembling a spiked wheel. Grows up to eight metres tall.";
                        globals.displayspecies.image1 =
                            "assets/placeholder.png";
                        globals.displayspecies.image2 =
                            "assets/placeholder.png";
                        globals.displayspecies.image3 =
                            "assets/placeholder.png";
                        Navigator.of(context).pushNamed("/speciesinfo");
                      },
                    ),
                  ],
                ));
              }),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new RaisedButton(
                  color: Colors.orange,
                  child: new Text("I don't know!"),
                  onPressed: (){
                    globals.item.species = "n/a";
                    Navigator.of(context).pushNamed("/Submission");
                  },
                ),
                
              ],
            ),
          ],
        ));
  }
}

class SpeciesextendPage extends StatefulWidget {
  @override
  SpeciesextendPageState createState() => new SpeciesextendPageState();
}

class SpeciesextendPageState extends State<SpeciesextendPage> {
  
    List<DropdownMenuItem<String>> listDrop = [];
    String select = null;

    void loadData() {
      List<String> genusList = [
        "I don't know",
        "Abrophyllum",
        "Acacia",
        "Acmena",
        "Acronychia",
        "Alectryon",
        "Allocasuarina",
        "Alphitonia",
        "Amorphospermum",
        "Angophora",
        "Aphananthe",
        "Araucaria",
        "Archontophoenix",
        "Arytera",
        "Astrotricha",
        "Auranticarpa",
        "Backhousia",
        "Baloghia",
        "Banksia",
        "Beilschmiedia",
        "Callitris",
        "Calophyllum",
        "Capparis",
        "Castanospermum",
        "Casuarina",
        "Celtis",
        "Claoxylon",
        "Codonocarpus",
        "Commersonia",
        "Corymbia",
        "Croton",
        "Cryptocarya",
        "Cupaniopsis",
        "Cyclophyllum",
        "Decaspermum",
        "Dendrocnide",
        "Denhamia",
        "Diospyros",
        "Diploglottis",
        "Drypetes",
        "Duboisia",
        "Dysoxylum",
        "Elaeocarpus",
        "Elattostachys",
        "Endiandra",
        "Eucalyptus",
        "Euroschinus",
        "Exocarpos",
        "Ficus",
        "Flindersia",
        "Geijera",
        "Glochidion",
        "Gmelina",
        "Gossia",
        "Grevillea",
        "Guoia",
        "Harpullia",
        "Heritiera",
        "Hibiscus",
        "Homolanthus",
        "Hymenosporum",
        "Jagera",
        "Litsea",
        "Livistona",
        "Lophostemon",
        "Macadamia",
        "Mallotus",
        "Maytenus",
        "Melaleuca",
        "Melicope",
        "Mischocarpus",
        "Myrsine",
        "Neolitsea",
        "Notelaea",
        "Olea",
        "Pandanus",
        "Pararchidendron",
        "Pentacera",
        "Petalostigma",
        "Pipturus",
        "Pittosporum",
        "Planchonella",
        "Pleogyne",
        "Podocarpus",
        "Polyalthia",
        "Polyscias",
        "Rhodamnia",
        "Rhodomyrtus",
        "Sarcomelicope",
        "Schizomeria",
        "Sloanea",
        "Stenocarpus",
        "Sterculia",
        "Streblus",
        "Syncarpia",
        "Synoum",
        "Syzygium",
        "Timonius",
        "Toechima",
        "Tristaniopsis",
        "Vitex",
        "Wilkiea",
      ];
      listDrop = [];
      for (int i = 0; i < genusList.length; i++) {
        listDrop.add(new DropdownMenuItem(
          child: new Text(genusList[i]),
          value: genusList[i],
        ));
      }
    }
    @override
  Widget build(BuildContext context) {

    loadData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Know the Species"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).pushNamed("/poprules");
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushNamed("/");
            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          /*Ancestor */
          new Container(
            /*contains input fields for names */
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextCard(
                    text: "Know the binomial name?",
                    size: 15.0,
                    box: Colors.grey[200]),
                //genus text input
                new TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Type Tree Genus...',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  onSubmitted: (String str) {
                    setState(() {
                      globals.item.species = str;
                    });
                  },
                ),
              ],
            ),
          ),

          new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextCard(
                    text: "Try to find the genus name?",
                    size: 15.0,
                    box: Colors.grey[200]),
              ]),

          //Dropdown genus selection
          new DropdownButton(
              value: select,
              items: listDrop,
              hint: new Text('Select a genus'),
              onChanged: (value) {
                select = value;
                setState(() {
                  globals.item.species = value;
                });
              }),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
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
                    child: Text('Back', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.brown,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 150.0,
                    height: 42.0,
                    onPressed: () {
                      
                      Navigator.of(context).pushNamed("/Submission");
                    },
                    color: Colors.green.shade600,
                    child:
                        Text('Submit', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
