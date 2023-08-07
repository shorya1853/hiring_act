import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/providers/switch_screen_provider.dart';
import 'package:hearing_act/screens/form/job_pref_form.dart';
import 'package:hearing_act/screens/home_screen.dart';

class Checker extends ConsumerStatefulWidget {
  const Checker({super.key});

  @override
  ConsumerState<Checker> createState() => _CheckerState();
}

class _CheckerState extends ConsumerState<Checker> {
  Widget Content = const JobPreferenceForm(); 
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    collectionChecker();
  }
  
  void collectionChecker()async{
    final users = await GetData().getdata();
    if(users != null){
      setState(() {
        Content =  HomeScreen();
      });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Content;
  }
}