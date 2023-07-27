import 'package:flutter/material.dart';
import 'package:hearing_act/screens/form/eduction_form.dart';

import '../../main.dart';
import '../../models/employe_model.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  var pro_key = GlobalKey<FormState>();
  var initgenderT = gendertype[genders.male];
  var initJobT = Iamtype[Iam.Expriences];
  DateTime? _DateOB;

  void _datepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _DateOB = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Profile')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 90,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: () {},
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: pro_key,
                child: Column(
                  children: [
                    DropdownButtonFormField(
                        value: initgenderT,
                        items: [
                          for (final item in gendertype.entries)
                            DropdownMenuItem(
                              value: item.value,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Column(
                                  children: [
                                    Text(
                                      item.value,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    )
                                  ],
                                ),
                              ),
                            )
                        ],
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            label: const Text("Gender",
                                style: TextStyle(fontSize: 20))),
                        onChanged: (value) {}),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        value: initJobT,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            label: const Text("JobType",
                                style: TextStyle(fontSize: 20))),
                        items: [
                          for (final item in Iamtype.entries)
                            DropdownMenuItem(
                              value: item.value,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Column(
                                  children: [
                                    Text(
                                      item.value,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    )
                                  ],
                                ),
                              ),
                            )
                        ],
                        onChanged: (value) {}),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label:
                            Text('Full Name', style: TextStyle(fontSize: 20)),
                      ),
                      validator: (value) {
                        //Enter  value to be integer
                        if (value == null || value.isEmpty) {
                          return 'Enter Your Name';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: kdarkcolorSchema.primary, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: ListTile(
                          title: Text(
                            "Date Of Birth",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            _DateOB == null
                                ? 'Select Date'
                                : formatedDate.format(_DateOB!),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16),
                          ),
                          trailing: IconButton(
                            hoverColor: Theme.of(context).colorScheme.onPrimaryContainer,
                            icon: Icon(Icons.calendar_month,
                                color: Theme.of(context).colorScheme.primary),
                            onPressed: _datepicker,
                          ),
                        )),
                        
                  ],
                ),
              ),
              SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                ElevatedButton(child: const Text('Submit'), onPressed: (){},),
                const SizedBox(width: 12,),
                TextButton(child: const Text('skip'), onPressed: (){
                  if(pro_key.currentState!.validate()){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EducationForm()));
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
