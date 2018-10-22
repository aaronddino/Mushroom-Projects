import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    globals.useremail = email;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    globals.useremail = email;
    return user.uid;
  }

  Future<String> currentUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    globals.useremail = user.email;
    return user.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}

