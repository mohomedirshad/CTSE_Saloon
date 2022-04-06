

import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Database {
  FirebaseFirestore? fireStore;
  initialise(){
    fireStore = FirebaseFirestore.instance;
  }

  //-- view all 
  // ignore: missing_return
  Future<List> read() async {
    QuerySnapshot querySnapshot;

    List docs = [];
    try {
      querySnapshot = await fireStore!.collection("haircutstyles").get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "name": doc["name"], "price": doc["price"], "description": doc["description"]};
          print(a);
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  //-- create 
  Future<void> create(String name, String price, String description, File? _image) async {
    try {
      await fireStore!.collection("haircutstyles").add({
        'name' : name,
        'price' : price,
        'description' : description,
        'timestamp' : FieldValue.serverTimestamp()
      });

      //image upload
      await upload(_image);
      
    } catch (e) {
      print(e);
    }
  }

  //-- update 
  Future<void> update(String id, String name, String price, String description) async{
    try {
      await fireStore!.collection("haircutstyles").doc(id).update({'name': name, 'price': price, 'description': description, 'timestamp': FieldValue.serverTimestamp()});
    } catch (e)
    {
      print(e);
    }
  }

  //Delete
  Future<void> delete(String id) async {
    try {
      await fireStore!.collection("haircutstyles").doc(id).delete();      
    } catch (e) {
      print(e);
    }
  }

  // image upload
  Future upload(File? _image) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child("hairstyles");
      await ref.putFile(_image!);      
    } catch (e) {
      print(e);
    }
  }
}