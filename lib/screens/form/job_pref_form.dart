import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/main.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/providers/form_data_provider.dart';
import 'package:hearing_act/screens/form/profile_form.dart';
import 'package:hearing_act/screens/home_screen.dart';

class JobPreferenceForm extends ConsumerStatefulWidget {
  const JobPreferenceForm({super.key});

  @override
  ConsumerState<JobPreferenceForm> createState() => _JobPreferenceState();
}

class _JobPreferenceState extends ConsumerState<JobPreferenceForm> {
  final job_pref_form = GlobalKey<FormState>();
  var jobtype = '';
  var funcA = '';
  var preferC = '';
  var expectS = '';

  void sendData() {
    if (job_pref_form.currentState!.validate()) {
      job_pref_form.currentState!.save();
      ref.read(jobPrefeD.notifier).getJobPref(JobPreference(
          jobType: jobtype,
          functionArea: funcA,
          preferedCity: preferC,
          expectedSalary: expectS));

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ProfileForm()));
    }
  }


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
                    TextFormField(                     decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Job Type', style: TextStyle(fontSize: 20)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Job Type';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        jobtype = newValue!;
                      },
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(                     decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Function Area',
                            style: TextStyle(fontSize: 20)),
                      ),
                      onSaved: (newValue) {
                        funcA = newValue!;
                      },
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Prefered City',
                            style: TextStyle(fontSize: 20)),
                      ),
                      onSaved: (newValue) {
                        preferC = newValue!;
                      },
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(                     keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Expected Salary',
                            style: TextStyle(fontSize: 20)),
                      ),
                      onSaved: (newValue) {
                        expectS = newValue!;
                      },
                      validator: (value) {
                        //Enter  value to be integer
                        if (value == null || value.isEmpty) {
                          return 'Please enter Expected salary';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(
                    onPressed: sendData,
                    child: const Text('skip'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
