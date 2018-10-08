import 'package:seeatree_4_aed/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Species {
  String mainImage;
  String image1;
  String image2;
  String image3;
  String speicesname;
  String commoname;
  String description;

  Species(this.mainImage,this.image1,this.image2,this.image3,this.commoname,this.description,this.speicesname);
  
}