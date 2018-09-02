/*
  -See A Tree Citizen Science Project App
  Auth: Raj Rosello
  */



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

//For Registering
enum FormType { 
  login,
  register
}

class _LoginPageState extends State<LoginPage> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;


  bool validateAndSave() {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      print('form is valid. email = $_email, password = $_password');
      return true;
    }else{
      print('form is invalid. email = $_email, password = $_password');
      return false;
    }
  }

  void validateAndSubmit() async{
    if (validateAndSave()){
      try{
        if(_formType == FormType.login){
          FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
          print('SIgned in: ${user.providerId}');
        }else{
          FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
          print('Registered User: ${user.providerId}');
        }
      } catch (e){
        print('Error: $e');
      }
    }
  }

  void moveToRegister(){
    formKey.currentState.reset(); // resets the form with an empty one when switching to register screen
    setState(() { // setting state calls the build method again. rebuilding the widget UI
      _formType = FormType.register;
    });
  }

  void moveToLogin(){
    formKey.currentState.reset(); // resets the form with an empty one when switching to login screen
    setState(() { // setting state calls the build method again. rebuilding the widget UI
      _formType = FormType.login;
    });
  } 

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('See a tree'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: new Form(
            key: formKey,
            child: new ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: buildInputs() + buildSubmitButtons(),
              ),
            )
          )  
       );
    }
    List<Widget> buildInputs(){
      return [
        new TextFormField(
                  decoration: new InputDecoration(labelText: 'Email'),
                  validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password'),
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                  obscureText: true,
                  onSaved: (value) => _password = value,
                ),
      ];
    }
    List<Widget> buildSubmitButtons(){
      if(_formType == FormType.login){
      return [
        new RaisedButton(
            child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
            onPressed: validateAndSubmit,
          ),
        new FlatButton(
            child: new Text('Create an Account', style: TextStyle(color: Colors.black45)),
            onPressed: moveToRegister,
         ),
        ];
      }else{
        return [
        new RaisedButton(
            child: new Text('Submit', style: new TextStyle(fontSize: 20.0)),
            onPressed: validateAndSubmit,
          ),
        new FlatButton(
            child: new Text('Already have an Account? Login.', style: TextStyle(color: Colors.black45)),
            onPressed: moveToLogin,
         ),
        ];
      }
    }
}

