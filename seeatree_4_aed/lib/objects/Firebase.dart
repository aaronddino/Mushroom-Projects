import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:seeatree_4_aed/objects/itemconstructor.dart'; 

class FirebaseTodos {
  /// FirebaseTodos.getTodoStream("-KriJ8Sg4lWIoNswKWc4", _updateTodo)
  /// .then((StreamSubscription s) => _subscriptionTodo = s);
  static Future<StreamSubscription<Event>> getTodoStream(String todoKey,
      void onData(Item todo)) async {
    //String accountKey = await Preferences.getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("items")
        .child(todoKey)
        .onValue
        .listen((Event event) {
      var todo = new Item.fromJson(event.snapshot.key, event.snapshot.value);
      onData(todo);
    });

    return subscription;
  }

  /// FirebaseTodos.getTodo("-KriJ8Sg4lWIoNswKWc4").then(_updateTodo);
  static Future<Item> getTodo(String todoKey) async {
    Completer<Item> completer = new Completer<Item>();

    //String accountKey = await Preferences.getAccountKey();

    FirebaseDatabase.instance
        .reference()
        .child("items")
        .child(todoKey)
        .once()
        .then((DataSnapshot snapshot) {
      var todo = new Item.fromJson(snapshot.key, snapshot.value);
      completer.complete(todo);
    });

    return completer.future;
  }
}





/*

class Preferences {
  static const String ACCOUNT_KEY = "accountKey";

  static Future<bool> setAccountKey(String accountKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCOUNT_KEY, accountKey);
    return prefs.commit();
  }

  static Future<String> getAccountKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accountKey = prefs.getString(ACCOUNT_KEY);

    // workaround - simulate a login setting this
    if (accountKey == null) {
      accountKey = "-KriFiUADpl-X07hnBC-";
    }

    return accountKey;
  }
}
*/