import 'package:flutter/material.dart';
import 'package:hearing_act/screens/home_screen.dart';

class EducationForm extends StatelessWidget {
   EducationForm({super.key});

  @override
  var edu_key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                ),
                  ],)
                ),
                const SizedBox(height: 15),
                ElevatedButton(child: const Text('Done'), onPressed: (){
                  if(edu_key.currentState!.validate()){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }
                },)
              ],
            ),
          ),
        ));
  }
}
