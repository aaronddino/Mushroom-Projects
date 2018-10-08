import 'package:flutter/material.dart';

//trial to simplify buttons with pictures
class PictureButton extends StatelessWidget{
  PictureButton({this.image, this.text, this.width, this.height, this.nextpage});
  final String text;
  final String image;
  final String nextpage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context){
    return new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Column(
                children: <Widget> [
                  new Image(image: new AssetImage(this.image), width: this.width, height: this.height),
                  new Text(this.text),
                  ],),
                onPressed: () {Navigator.of(context).pushNamed(this.nextpage);}
              );
  }
}

//trial to simplify buttons with pictures
class PictureButtonSideText extends StatelessWidget{
  PictureButtonSideText({this.image, this.text, this.width, this.height, this.nextpage});
  final String text;
  final String image;
  final String nextpage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context){
    return new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Row(
                children: <Widget> [
                  new Image(image: new AssetImage(this.image), width: this.width, height: this.height),
                  new Text(this.text),
                  ],),
                onPressed: () {Navigator.of(context).pushNamed(this.nextpage);}
              );
  }
}

//trial to simplify buttons with pictures
class PictureButtonNoText extends StatelessWidget{
  PictureButtonNoText({this.image,this.width, this.height, this.nextpage});
  final String image;
  final String nextpage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context){
    return new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Column(
                children: <Widget> [
                  new Image(image: new AssetImage(this.image), width: this.width, height: this.height),
                  ],),
                onPressed: () {Navigator.of(context).pushNamed(this.nextpage);}
              );
  }
}

class TextCard extends StatelessWidget{
  TextCard({this.text, this.size, this.box});
  final String text;
  final double size;
  final Color box;

  @override
  Widget build(BuildContext context){
    return new Container(
      //padding: new EdgeInsets.only(bottom: 10.0),
      child: new Card(
        color: this.box,
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
          children: <Widget>[
            new Text(this.text, 
              style: new TextStyle(fontSize: this.size, color: Colors.black)),
          ]
        )
      )
      )
    );
  } 
}

class TextButton extends StatelessWidget{
  TextButton({this.text, this.color, this.nextpage});
  final String text;
  final Color color;
  final String nextpage;
  @override
  Widget build(BuildContext context){
    return new RaisedButton(
                color: this.color,
                child: new Column(
                  children: <Widget>[
                    new Text(this.text),
                  ],
                ),
                onPressed: () {Navigator.of(context).pushNamed(this.nextpage);},
              );
  }
}