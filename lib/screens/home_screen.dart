import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/providers/form_data_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(jobPrefeD);
    final proitems = ref.watch(profileD);
    return Scaffold(
      // body: Center(child: Column
      // (
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //   Text(items.expectedSalary, 
      // style: TextStyle(
      //   color: Theme.of(context).colorScheme.primary
      // )),Text(items.jobType, 
      // style: TextStyle(
      //   color: Theme.of(context).colorScheme.primary
      // )),Text(items.functionArea!, 
      // style: TextStyle(
      //   color: Theme.of(context).colorScheme.primary
      // )),Text(items.preferedCity!, 
      // style: TextStyle(
      //   color: Theme.of(context).colorScheme.primary
      // )),
      // proitems.image != null ? 
      // CircleAvatar(
      //   backgroundImage: MemoryImage(proitems.image!),
      // )
      // : const CircleAvatar(
      //   backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
      // )
      // ],))
    );
  }
}