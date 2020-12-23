import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class UserDatabaseService {


  final String uid;
  UserDatabaseService({this.uid});


  final CollectionReference user = FirebaseFirestore.instance.collection("user");


  checkTalentVipCode(int vipCode) {
    return FirebaseFirestore.instance.collection("talent").where("vipCode", isEqualTo: vipCode).get();

  }


  Future updateUserData(String name, String bio, int price, int rating) async {

    return await user.doc(uid).set({
      "name": name,
      "bio": bio,
      "price": price,
      "rating": rating,
      "role": "user"
    });
  }




}

class TalentDatabaseService {

  final String uid;
  TalentDatabaseService({this.uid});

  final CollectionReference talent = FirebaseFirestore.instance.collection("talent");



  Future updateTalentData(String name, String bio, int price, int rating) async {

    return await talent.doc(uid).set({
      "name": name,
      "bio": bio,
      "price": price,
      "rating": rating,
      "role": "talent" ,
    });
  }
}

class VipCodeDatabaseService {


  VipCodeDatabaseService();

  final CollectionReference vipCodeCollection = FirebaseFirestore.instance.collection("vip_codes");


  Future vipUserExists(vipCode) async {


    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('vip_codes').where("code", isEqualTo: vipCode).get();


    if(snapshot.docs.length > 1 || snapshot.docs.isEmpty) {

      print("Did not find any docs");
      return null;
    }

    return snapshot.docs.single;
    //snapshot.docs.forEach((element) {
    //  print(element.data());
    //});

    return true;



  }



}