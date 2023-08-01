import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hearing_act/models/employe_model.dart';

class FireStoreMethods{
  final  _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
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
