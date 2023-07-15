import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/widgets/widgetText_field.dart';
import 'package:hearing_act/methods/auth_method.dart';

final switchScreen = StateProvider((ref) => false);

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  WidgetTextField('Email',
                      textController: _emailController, lable: 'Email Id'),
                  WidgetTextField('Password',
                      textController: _passwordController, lable: 'password'),
                  ElevatedButton(
                      onPressed: () async {
                        final response = await Auth.signupuser(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                            context);
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
                WidgetTextField('Name',
                    textController: _nameController, lable: 'Name'),
                WidgetTextField('Email',
                    textController: _emailController, lable: 'Email Id'),
                WidgetTextField('Password',
                    textController: _passwordController, lable: 'password'),
                ElevatedButton(
                    onPressed: () {
                      Auth.signupuser(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                          context);
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
