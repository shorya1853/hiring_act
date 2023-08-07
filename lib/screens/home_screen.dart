import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/providers/switch_screen_provider.dart';


class HomeScreen extends ConsumerWidget {
 HomeScreen({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(finalData);
    print(data);
    return Scaffold(
      body: Center(
        child: Text('Hello')
      ),
    );
  }
}