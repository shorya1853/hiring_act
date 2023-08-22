import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/providers/switch_screen_provider.dart';


class HomeScreen extends StatefulWidget {
 HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  JobSeeker? data;

  void getData ()async{
    var jobkeeper = await GetData().getdata();
    setState(() {
      data = jobkeeper!;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Text(data!.education.instituteName!)
      ),
    );
  }
}