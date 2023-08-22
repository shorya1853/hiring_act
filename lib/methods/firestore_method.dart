import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hearing_act/models/employe_model.dart';

final _auth = FirebaseAuth.instance;
final  _firestore = FirebaseFirestore.instance;
class FireStoreMethods{
  
  
  Future<String?> sendData (JobSeeker jobSeeker)async{
    final data = JobSeeker(
        myBio: jobSeeker.myBio,
        profile: jobSeeker.profile,
        education: jobSeeker.education,
        jobPreference: jobSeeker.jobPreference);
    try{
      await _firestore.collection('JobSeeker').doc(_auth.currentUser!.uid).set(
        data.toJson()
      );
    }
    catch(e){
      print(e.toString());
      return e.toString();
    }
  }
}

class GetData {
  Future<JobSeeker?> getdata() async {
      var users = await _firestore.collection('JobSeeker')
        .doc(_auth.currentUser!.uid)
        .get();
      print(users.data());
      if(users.exists){
        print('users exist');
        var data = JobSeeker.fromJson(users);
        return data;
      }
      else{
        print('no users exits');
        return null;
      }                                                                                                 
  }
}
