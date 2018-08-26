import 'package:seeatree_4_aed/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Item{
  String key;
  String health;
  String landmark;
  String height;
  String girth;
  String canopy;
  String botanical;
  String historical;
  String shape;
  String habitat;
  String image1;
  String image2;

  Item(this.health, this.landmark, this.height,this.girth, this.canopy, this.botanical, this.historical, this.shape,this.habitat, this.image1,this.image2);

  Item.fromSnapshot(DataSnapshot snapshot)
    : key = snapshot.key,
      height = snapshot.value["height"],
      health = snapshot.value["health"],
      landmark = snapshot.value["landmark"],
      girth = snapshot.value["girth"],
      canopy = snapshot.value["canopy"],
      botanical = snapshot.value["botanical"],
      historical = snapshot.value["historical"],
      shape = snapshot.value["shape"],
      habitat = snapshot.value["habitat"],
      image1 = snapshot.value["image1"],
      image2 = snapshot.value["image2"];

  toJson(){
    return{
      "Height" : height,
      "Health" : health,
      "Landmark" : landmark,
      "Girth" : girth,
      "Canopy" : canopy,
      "Botanical" : botanical,
      "Historical" : historical,
      "Shape" : shape,
      "Habitat" : habitat,
      "Image 1": image1,
      "Image 2": image2,
    };
  }

  
}