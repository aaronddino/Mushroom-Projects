import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

class PictureButton2 extends StatelessWidget {
  final String nextpage;
  final String image;
  final String height;

  PictureButton2(this.image, this.nextpage, this.height);
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      color: Colors.white,
      onPressed: () {
        globals.item.height = height;
      },
      child: Column(
        children: <Widget>[
          PictureButtonNoText(
            image: image,
            width: 128.0,
            height: 150.0,
            nextpage: nextpage,
          ),
        ],
      ),
    );
  }
}
