


import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';


class PrivacyPolicy extends StatelessWidget{
 @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Privacy Policy"), 
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.of(context).pushNamed("/");
                },
              ),
            ],
            backgroundColor: Colors.green,
            ),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               new Text("Insert Privacy policies here.. need to add it from google drive \n \n test", style: new TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
            ]
          )
        )
    );
  }

}

/*
Personal information we collect

We collect and hold personal information about the users of the application. 
The kind of personal information we collect may include your name, address, and other contact details, as well as information obtained during the usage of the mobile application such as location.

Manner and purpose of collection of personal information

The personal information is generally collected from registration by the way of forms which are submitted by you. 
We may contact you with the validity of information you have submitted. 
We only use the personal information only for the purpose of: reassurance of legitimate users, best possible service for the mobile application. 
If we are somehow unable to provide personal information relating to you or provided by you, it may limit you during your usage of the mobile application. 

Disclosure of your personal information

We may disclose personal information about you to following organisations: Mushroom Projects, Queensland University of technology, and Redbank city council. 

How we hold the personal information

The information is held electronically with the use of databases. We have taken precautions to protect the information from misuse, interference, and modification or disclosure. 

How to access your personal information

The information can be obtained by contacting us.

Accuracy and completeness of personal information

While the organisation endeavors to always have your information up to date, we will assume the information you have provided are free from errors. The information can be requested to be updated.

Making a complaint about breaching your privacy rights

If you can view that we have breached the Privacy Act, or any code in relation to your personal information, you may make a complaint by writing to us using the contact details below. We will endeavor to resolve the issues that you may possibly raise upon. 

Contact details

The Mushroom projects consists of 4 members:
Aarond Dino
Alice Mckellar
James Shafton
Raj Rosello

The Mushroom Projects consists of a bigger organisations such as: 

Queensland University of Technology
Redland City Council
*/