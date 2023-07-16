import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/screens/profile_form.dart';
import 'package:hearing_act/widgets/widgetText_field.dart';
import 'package:hearing_act/methods/auth_method.dart';

final switchScreen = StateProvider((ref) => false);

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});
  final TextEditingController _confirmPController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _signform = GlobalKey<FormState>();
  final _loginform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, _) {
              final signin = ref.watch(switchScreen);
              if (signin) {
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  const Text('SignIn'),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _signform,
                    child: Column(children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter your Email Id';
                          }else{
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: 'password',
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter password';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ],),),
                  
                  ElevatedButton(
                      onPressed: () {
                         if(_signform.currentState!.validate()){
                            Auth.signinuser(
                            _emailController.text,
                            _passwordController.text,
                            context);
                         }
                        
                      },
                      child: const Text('SignIn')),
                  TextButton(
                    child: const Text('Create new account'),
                    onPressed: () {
                      ref.read(switchScreen.notifier).state = false;
                    },
                  )
                ]);
              }
              return Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('Login'),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: _loginform,
                    child: Column(children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter your Email Id';
                          }else{
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: 'password',
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter password';
                          }else{
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: _confirmPController,
                        decoration: const InputDecoration(
                          hintText: 'confirm password',
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Retype your password';
                          }else if(value != _passwordController.text){
                            return 'Enter password is not same';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                    ],),),
                
                ElevatedButton(
                    onPressed: () {
                      if(_loginform.currentState!.validate()){
                         Auth.signupuser(
                          _emailController.text,
                          _passwordController.text, 
                          _confirmPController.text,
                          context);
                      }
                    },
                    child: const Text('Login')),
                TextButton(
                  child: const Text('Sorry! I have one'),
                  onPressed: () {
                    ref.read(switchScreen.notifier).state = true;
                  },
                )
              ]);
            },
          )),
    );
  }
}
