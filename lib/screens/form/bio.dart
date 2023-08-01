import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/screens/home_screen.dart';

import '../../providers/form_data_provider.dart';

class BioForm extends ConsumerStatefulWidget {
  const BioForm({super.key});

  @override
  ConsumerState<BioForm> createState() => _BioFormState();
}

class _BioFormState extends ConsumerState<BioForm> {
  final _bioController = TextEditingController();

   
  

  Future<void> addCollection()async{
    final profile = ref.watch(profileD);  
   final jobpref = ref.watch(jobPrefeD);
    final highE = ref.watch(highED);

    final response = await FireStoreMethods().sendData(JobSeeker(
        myBio: _bioController.text,
        profile: profile,
        education: highE,
        jobPreference: jobpref));
    
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Bio')
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            TextField(
              controller: _bioController,
            ),
            ElevatedButton(onPressed: addCollection,child: const Text('Submit'),)
          ],
        )
      ),
    );
  }
}