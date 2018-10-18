


import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';


class PrivacyPolicy extends StatelessWidget{

final String privacyPolicy1 = "\nPersonal information we collect\n\n";
final String privacyPolicy2 = "We collect and hold personal information about the users of the application."
+ "The kind of personal information we collect may include your name, address, and other contact details, as well as information obtained during the usage of the mobile application such as location.\n\n";
final String privacyPolicy3 = "Manner and purpose of collection of personal information\n\n";
final String privacyPolicy4 = "The personal information is generally collected from registration by the way of forms which are submitted by you. "
+"We may contact you with the validity of information you have submitted. "
+"We only use the personal information only for the purpose of: reassurance of legitimate users, best possible service for the mobile application. "
+"If we are somehow unable to provide personal information relating to you or provided by you, it may limit you during your usage of the mobile application.\n\n";
final String privacyPolicy5 = "Disclosure of your personal information\n\n";
final String privacyPolicy6 = "We may disclose personal information about you to following organisations: Mushroom Projects, Queensland University of technology, and Redbank city council. \n\n";
final String privacyPolicy7 = "How we hold the personal information\n\n";
final String privacyPolicy8 = "The information is held electronically with the use of databases. We have taken precautions to protect the information from misuse, interference, and modification or disclosure. \n\n";
final String privacyPolicy9 = "How to access your personal information\n\n";
final String privacyPolicy10 = "The information can be obtained by contacting us.\n\n";
final String privacyPolicy11 = "Accuracy and completeness of personal information\n\n";
final String privacyPolicy12 = "While the organisation endeavors to always have your information up to date, we will assume the information you have provided are free from errors. The information can be requested to be updated.\n\n";
final String privacyPolicy13 = "Making a complaint about breaching your privacy rights\n\n";
final String privacyPolicy14 = "If you can view that we have breached the Privacy Act, or any code in relation to your personal information, you may make a complaint by writing to us using the contact details below. "
+"We will endeavor to resolve the issues that you may possibly raise upon. \n\n";
final String privacyPolicy15 = "Contact details\n\n";
final String privacyPolicy16 = "The Mushroom projects consists of 4 members:\n"
+"Aarond Dino\n"
+"Alice Mckellar\n"
+"James Shafton\n"
+"Raj Rosello\n\n";
final String privacyPolicy17 = "The Mushroom Projects are collaborating with other organisations such as: \n\n";
final String privacyPolicy18 = "Queensland University of Technology\n"
+"Redland City Council\n\n";


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
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Expanded(flex: 1,
                child: new SingleChildScrollView(
                  child: new RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: privacyPolicy1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy2, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy3, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy4, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy5, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy6, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy7, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy8, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy9, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy10, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy11, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy12, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy13, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy14, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy15, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy16, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy17, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                          TextSpan(text: privacyPolicy18, style: TextStyle(fontSize: 13.0, color: Colors.black)),
                        ],
                      ),
                    )
                
                )
              )
            ]
          )
        )
    );
  }

}

/*




*/