import 'package:seeatree_4_aed/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Item {
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
  String species;
  String date;
  String image1;
  String image2;
  String longitude;
  String latitude;
  



  Item(
      this.health,
      this.landmark,
      this.height,
      this.girth,
      this.canopy,
      this.botanical,
      this.historical,
      this.shape,
      this.habitat,
      this.image1,
      this.image2,
      this.date,
      this.species,
      this.latitude,
      this.longitude);

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
        image2 = snapshot.value["image2"],
        date = snapshot.value["date"],
        latitude = snapshot.value["latitude"],
        longitude = snapshot.value["longitude"],
        species = snapshot.value["species"];

  toJson() {
    return {
      "Height": height,
      "Health": health,
      "Landmark": landmark,
      "Girth": girth,
      "Canopy": canopy,
      "Botanical": botanical,
      "Historical": historical,
      "Shape": shape,
      "Habitat": habitat,
      "Image 1": image1,
      "Image 2": image2,
      "Date": date,
      "Species": species,
      "Longitude": longitude,
      "Latitude": latitude,
    };
  }

  Item.fromJson(this.key, Map data) {
    height = data["Height"];
    if (height == null) {
      height = '';
    }
    health = data["Health"];
    if (health == null) {
      health = '';
    }
    landmark = data["Landmark"];
    if (landmark == null) {
      landmark = '';
    }
    girth = data["Girth"];
    if (girth == null) {
      girth = '';
    }
    canopy = data["Canopy"];
    if (canopy == null) {
      canopy = '';
    }
    botanical = data["Botanical"];
    if (botanical == null) {
      botanical = '';
    }
    historical = data["Historical"];
    if (historical == null) {
      historical = '';
    }
    shape = data["Shape"];
    if (shape == null) {
      shape = '';
    }
    habitat = data["Habitat"];
    if (habitat == null) {
      habitat = '';
    }
    image1 = data["Image 1"];
    if (image1 == null) {
      image1 = '';
    }
    image2 = data["Image 2"];
    if (image2 == null) {
      image2 = '';
    }
    species = data["Species"];
    if (species == null) {
      species = '';
    }
    date = data["Date"];
    if (date == null) {
      date = '';
    }
  }
}
