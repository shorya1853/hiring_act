import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hearing_act/methods/firestore_method.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  static signupuser(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      
      await FirebaseService.saveuser(email, name, credential.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration Successful')));    
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Weak Password')));
      }else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email Already in use')));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static signinuser(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      
      await FirebaseService.saveuser(email, name, credential.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration Successful')));    
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Weak Password')));
      }else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email Already in use')));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

