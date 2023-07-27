import 'package:flutter/material.dart';
import 'package:hearing_act/main.dart';
import 'package:hearing_act/models/employe_model.dart';

import '../profile_form.dart';

class JobPreference extends StatefulWidget {
  const JobPreference({super.key});

  @override
  State<JobPreference> createState() => _JobPreferenceState();
}

class _JobPreferenceState extends State<JobPreference> {
  final job_pref_form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Preference'),
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
                    'Enter your Prefered Job Decription',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary),
                  )),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: job_pref_form,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label:
                            Text('Job Type', style: TextStyle(fontSize: 20)),
                      ),
                      validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please enter Job Type';
                          }
                          return null;
                        },
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label:
                            Text('Function Area', style: TextStyle(fontSize: 20)),
                      ),
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label:
                            Text('Prefered City', style: TextStyle(fontSize: 20)),
                      ),
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Expected Salary',
                            style: TextStyle(fontSize: 20)),
                      ),
                      validator: (value) {
                        //Enter  value to be integer
                          if(value == null || value.isEmpty ){
                            return 'Please enter Job Type';
                          }
                          return null;
                        },
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                  ],
                ),
              ),
             SizedBox(height: MediaQuery.of(context).size.height/3.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                ElevatedButton(child: const Text('Submit'), onPressed: (){},),
                const SizedBox(width: 12,),
                TextButton(child: const Text('skip'), onPressed: (){
                  if(job_pref_form.currentState!.validate()){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileForm()));
                  }
                },),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
