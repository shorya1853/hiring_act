import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/screens/home_screen.dart';




class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  static signupuser(String email, String password, String confirmP,
      BuildContext context) async {
    try {
      UserCredential cre = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Weak Password')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Already in use')));
      }
      else{
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static signinuser(String email, String password, BuildContext context) async {
    try {
      UserCredential cre = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } catch (e) {
      print(e.toString());
    }
  }
}