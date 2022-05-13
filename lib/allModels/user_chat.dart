import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/allConstants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChat {
  String id;
  String photoUrl;
  String name;
  String aboutMe;
  String phoneNumber;

  UserChat({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.aboutMe,
    required this.phoneNumber,
});
  Map<String, String> toJson(){
    return {
      FirestoreConstants.nickname: name,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
      FirestoreConstants.phoneNumber: phoneNumber,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc){
    String photoUrl = "";
    String nickName = "";
    String aboutMe = "";
    String phoneNumber = "";
    try{
      nickName = doc.get(FirestoreConstants.nickname);
    }catch(e){}
    try{
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    }catch(e){}
    try{
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    }catch(e){}
    try{
      phoneNumber = doc.get(FirestoreConstants.phoneNumber);
    }catch(e){}
    return UserChat(
        id: doc.id,
        photoUrl: photoUrl,
        name: nickName,
        aboutMe: aboutMe,
        phoneNumber: phoneNumber);
  }
}