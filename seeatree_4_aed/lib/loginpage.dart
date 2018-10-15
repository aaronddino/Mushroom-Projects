/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Login
Purpose: 
- First Page directed by app launch
- Contains forms to allow input of user's login and password.
- Links to register and forgotten passwords.
*/

import 'package:flutter/material.dart';

import 'package:seeatree_4_aed/objects/item.dart' as globals;
import 'auth.dart';

enum FormType{
  login,
  register
}

class LoginPage extends StatefulWidget {

  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
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
    if(validateAndSave()){
      try{
        if(_formType == FormType.login){
          String userId = await widget.auth.signInWithEmailAndPassword(_email,_password);
        print('SIgned in: $userId');
        //inserthere
        globals.useremail = _email;
        
        }else{
          String userId = await widget.auth.createUserWithEmailAndPassword(_email,_password);
          print('Registered USER: $userId');
         
        }
        widget.onSignedIn(); // ensure rootpage can receive a message from login page
      }catch(e){
        print('Error: $e');
      }
    }
  }

  void moveToRegistrationPage(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;    
    });
  }

  void moveToLoginPage(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }
  String buttonSort(){
    String submitButton = 'Register';
    String loginButton = 'Login';

    if(_formType == FormType.login){
      return loginButton;
    } else{
      return submitButton;
    }
  }
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/tree1.png'),
      ),
    );

    final submitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.brown,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
           validateAndSubmit();
          },
          color: Colors.green.shade600,
          child: 
       
          Text(buttonSort(), style: TextStyle(color: Colors.white)),

        ),
      ),
    );



    List<Widget> buildInputs(){
      return [
        logo,
        SizedBox(height: 48.0,),
        new TextFormField(
		  keyboardType: TextInputType.emailAddress,
		  autofocus: false,
		  decoration: new InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
		  validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
		  onSaved: (value) => _email = value,
		),
    SizedBox(height: 8.0,),
		new TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: new InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
		  validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
		  onSaved: (value) => _password = value,
		),
      ];
    }
    List<Widget> buildSubmitButtons(){
      if(_formType == FormType.login){
      return [
        SizedBox(height: 24.0,),
        submitButton,
        SizedBox(height: 8.0,),  
        new FlatButton(  // REGISTER __________
            child: new Text('Create an Account', style: TextStyle(color: Colors.black45)),
            onPressed: moveToRegistrationPage,
         ),
        ];
      }else{
        return [
        SizedBox(height: 24.0,),
        submitButton,
        SizedBox(height: 8.0,),
        new FlatButton( 
            child: new Text('Already have an Account? Login.', style: TextStyle(color: Colors.black45)),
            onPressed: moveToLoginPage,
         ),
        ];
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(title: new Text('See a Tree'),),
      body: Center(
        child: new Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: buildInputs() + buildSubmitButtons(),
            
          ),
        ),
      ),
    );
  }
}
