import 'package:flutter/material.dart';
import 'package:hearing_act/main.dart';
import 'package:hearing_act/models/employe_model.dart';

class JobPreference extends StatefulWidget {
  const JobPreference({super.key});

  @override
  State<JobPreference> createState() => _JobPreferenceState();
}

class _JobPreferenceState extends State<JobPreference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Preference'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Enter your Prefered Job Decription'),
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      fillColor: Theme.of(context).colorScheme.secondary,
                      label: const Text("Job Type", style: TextStyle(fontSize:  20))
                    ),
                    items: [
                    for (final item in jobType.entries)
                      DropdownMenuItem(
                        value: item.value,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Column(
                            children: [
                              Text(item.value, style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),)
                            ],
                          ),
                        ),
                      )

                  ], onChanged: (value) {}),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration:  const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Function Area',style: TextStyle(fontSize: 20)),
                    ),
                    style: TextStyle(
                      color: kdarkcolorSchema.primary,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration:  const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Prefered City',style: TextStyle(fontSize: 20)),
                    ),
                    style: TextStyle(
                      color: kdarkcolorSchema.primary,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration:  const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Expected Salary',style: TextStyle(fontSize: 20)),
                    ),
                    style: TextStyle(
                      color: kdarkcolorSchema.primary,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
