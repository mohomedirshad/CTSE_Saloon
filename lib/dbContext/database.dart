import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
  Future<void> create(String name, String price, String description, String image) async {
    try {
      await fireStore!.collection("haircutstyles").add({
        'name' : name,
        'price' : price,
        'description' : description,
        'image':  image,
        'timestamp' : FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  //-- update 
  Future<void> update(String id, String name, String price, String description, String imageName) async{
    try {
      await fireStore!.collection("haircutstyles").doc(id).update({'name': name, 'price': price, 'description': description, 'image': imageName, 'timestamp': FieldValue.serverTimestamp()});
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

  //delete image from firebase storage
  Future deleteImage(File? _image, String fileName) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child("hairstyles").child(fileName);
      await ref.delete();      
    } catch (e) {
      print(e);
    }
  }

  // image upload
  Future upload(File? _image, String fileName) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child("hairstyles").child(fileName);
      await ref.putFile(_image!);      
    } catch (e) {
      print(e);
    }
  }

  // get image url to view image
  Future<String> downloadImageUrl(String fileName) async {
    String downloadUrl = await FirebaseStorage.instance.ref('hairstyles/$fileName').getDownloadURL();
    return downloadUrl;
  }
}