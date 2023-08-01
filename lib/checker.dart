import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/screens/form/job_pref_form.dart';
import 'package:hearing_act/screens/home_screen.dart';

class Checker extends StatefulWidget {
  const Checker({super.key});

  @override
  State<Checker> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  Widget Content = const JobPreferenceForm(); 
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    collectionChecker();
  }
  
  void collectionChecker()async{
    final users = await FirebaseFirestore.instance.collection('JobSeeker').doc(_auth.currentUser!.uid).get();
    final data = JobSeeker.fromJson(users);
    print(data);
    if(users.exists){
      setState(() {
        Content = const HomeScreen();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Content;
  }
}