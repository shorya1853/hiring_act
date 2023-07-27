import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  Text('SignIn', style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 19
                          ),),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _signform,
                    child: Column(children: [
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 19
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter your Email Id';
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 12,),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,fontSize: 20
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'password',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 19
                          ),
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
                  const SizedBox(height: 12,),
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
                Text('Login',
                style:TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 19
                          ),),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: _loginform,
                    child: Column(children: [
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 19
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter your Email Id';
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 12,),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'password',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 19
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter password';
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 12,),
                      TextFormField(
                        controller: _confirmPController,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20
                        ),
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'confirm password',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 19
                          ),
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
                const SizedBox(height: 12,),
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
