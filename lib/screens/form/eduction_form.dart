import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/providers/form_data_provider.dart';
import 'package:hearing_act/screens/form/bio.dart';

class EducationForm extends ConsumerStatefulWidget {
   EducationForm({super.key});

  @override
  ConsumerState<EducationForm> createState() => _EducationFormState();
}

class _EducationFormState extends ConsumerState<EducationForm> {
  @override
  var edu_key = GlobalKey<FormState>();
  var _instituteName = '';
  var _edLevel = '';
  var _duration = '2000';
  
  void sendEd() {
    if (edu_key.currentState!.validate()) {
      edu_key.currentState!.save();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BioForm()));
      ref.read(highED.notifier).getHigh(HigestEducation(
          instituteName: _instituteName,
          edLevel: _edLevel,
          duration: _duration));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){
            Navigator.of(context).pop();
          },),
          title: const Text('Higest Education'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your Highest Education",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                Form(
                  key: edu_key,
                  child: Column(children: [
                    const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label:
                        Text('Institute Name', style: TextStyle(fontSize: 20)),
                  ),
                  onSaved: ((newValue) {
                    setState(() {
                      _instituteName = newValue!;
                    });
                  }),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label:
                        Text('Education level', style: TextStyle(fontSize: 20)),
                  ),
                  validator: (value) {
                        //Enter  value to be integer
                          if(value == null || value.isEmpty ){
                            return 'Please enter Education';
                          }
                          return null;
                        },
                   onSaved: (newValue){
                    setState(() {
                      _edLevel = newValue!;
                    });
                  },
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label:
                        Text('Start-End', style: TextStyle(fontSize: 20)),
                  ),
                  validator: (value) {
                        //Enter  value to be integer
                          if(value == null || value.isEmpty ){
                            return 'Please enter Duration';
                          }
                          return null;
                        },
                  onSaved: (newValue){
                    setState(() {
                      _duration = newValue!;
                    });
                  },
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                ),
                  ],)
                ),
                const SizedBox(height: 15),
                ElevatedButton(child: const Text('Done'), onPressed: sendEd,)
              ],
            ),
          ),
        ));
  }
}
