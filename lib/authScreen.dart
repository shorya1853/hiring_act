import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _signInForm = GlobalKey<FormState>();

  Future<void> SignIN() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Weak Password')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Already in use')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _signInForm,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 19),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Email Id";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 19),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your password Id";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_signInForm.currentState!.validate()) {
                          SignIN();
                        }
                      },
                      child: const Text("SignIN"))
                ],
              ),
            ),
          ]),
    ));
  }
}
