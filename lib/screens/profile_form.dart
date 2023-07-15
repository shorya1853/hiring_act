import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileForm extends StatelessWidget {
  ProfileForm({super.key});

  final _fromkey = GlobalKey<FormState>();
  final TextEditingController _formcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _formcontroller, 
            validator:(value) {
              if(value == null || value.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill this part')));
              }
          }
          ),
        ),
        const SizedBox(height: 30,),
        ElevatedButton(onPressed: (){
          if(_fromkey.currentState!.validate()){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('good ')));
          }
        }, child: const Text('submit'))
      ],
    ));
  }
}
