import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static saveuser(String email, String name, uid) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});
  }
}
