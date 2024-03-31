import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/auth_method.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';
import 'package:hearing_act/providers/switch_screen_provider.dart';
import 'package:hearing_act/screens/search_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentIndex = 0;
  void _selectPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobSeeker = ref.watch(finalData);
    Widget body = jobSeeker == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Center(
                child: Text(jobSeeker.education.duration),
              ),
              ElevatedButton(
                  onPressed: () {
                    Auth.signOut();
                  },
                  child: Text("SignOut"))
            ],
          );
    if (currentIndex == 1) {
      body = SearchScreen();
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.man), label: "profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Search Screen",
          ),
        ],
      ),
    );
  }
}
