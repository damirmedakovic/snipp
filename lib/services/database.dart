import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';



class DatabaseService {


  final String uid;
  DatabaseService({this.uid});


  final CollectionReference talent = FirebaseFirestore.instance.collection("talent");
  final CollectionReference user = FirebaseFirestore.instance.collection("user");


  Future updateUserData(String name, String bio, int price) async {

    return await talent.doc(uid).set({
      "name": name,
      "bio": bio,
      "price": price
    });
  }

}