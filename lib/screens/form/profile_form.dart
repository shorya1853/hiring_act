import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/providers/form_data_provider.dart';
import 'package:hearing_act/screens/form/eduction_form.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
import '../../models/employe_model.dart';
import '../../utils/image_pic.dart';

class ProfileForm extends ConsumerStatefulWidget {
  const ProfileForm({super.key});

  @override
  ConsumerState<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends ConsumerState<ProfileForm> {
  var pro_key = GlobalKey<FormState>();
  var email = FirebaseAuth.instance.currentUser!.email;
  var initgenderT = genders.male.name;
  var initiam = Iam.Freacher.name;
  var fullname = '';
  Uint8List? _image;
  DateTime _DateOB =  DateTime.now();

  void _datepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _DateOB = pickedDate!;
    });
  }

  void selectImage()async{
    Uint8List im = await pickedImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void sendProfile() {
    if (pro_key.currentState!.validate()) {
      pro_key.currentState!.save();
      ref.read(profileD.notifier).getPro(Profile(
          gender: initgenderT,
          iam: initiam,
          fullName: fullname,
          dob: _DateOB,
          email: email,
          image: _image));
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EducationForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){
            Navigator.of(context).pop();
          },),
        title: const Text('Your Profile')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [ _image != null
                ? CircleAvatar(
                  radius: 80,
                  backgroundImage: MemoryImage(_image!)
                )
                : const CircleAvatar(
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
                        onPressed: selectImage,
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
                        onChanged: (value) {
                          setState(() {
                            initgenderT = value!;
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        value: initiam,
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
                        onChanged: (value) {
                          setState(() {
                            initiam = value!;
                          });
                        }),
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
                      onSaved: (newvalue){
                        fullname = newvalue!;
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
                                : formatedDate.format(_DateOB),
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
                TextButton(child: const Text('skip'), onPressed: sendProfile,),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
