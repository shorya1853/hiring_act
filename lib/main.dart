import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/checker.dart';
import 'package:hearing_act/methods/auth_method.dart';
import 'package:hearing_act/providers/form_data_provider.dart';
import 'package:hearing_act/screens/form/job_pref_form.dart';
import 'package:hearing_act/screens/home_screen.dart';
import 'package:hearing_act/screens/authentication_screen.dart';
import 'package:image_picker/image_picker.dart';

final kcolorSchema =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 240, 255, 248));

final kdarkcolorSchema = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 255, 51),
    brightness: Brightness.dark);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBmqPP8WzPM7Nr7zmQhxgrEFnVI7coRapM",
      appId: "1:697118422970:android:ceabdabdff4e9e5f79cf83",
      messagingSenderId: "697118422970",
      projectId: "hirect-app-13237",
    ),
  );
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData().copyWith(
        scaffoldBackgroundColor: kdarkcolorSchema.background,
        colorScheme: kdarkcolorSchema,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkcolorSchema.primaryContainer,
            foregroundColor: kdarkcolorSchema.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kcolorSchema,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorSchema.onPrimaryContainer,
          foregroundColor: kcolorSchema.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorSchema.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: kcolorSchema.onSecondaryContainer,
              ),
            ),
      ),
      home: const Myapp(),
    ),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went worng'),
          );
        } else if (snapshot.hasData) {
          User? user = snapshot.data;
            DateTime? creationTime = user!.metadata.creationTime;
            DateTime? lastSignInTime = user.metadata.lastSignInTime;

            // Check if the user is new or returning
            bool isNewUser = creationTime == lastSignInTime;

            if (isNewUser) {
              return const JobPreferenceForm();
            } else {
              return HomeScreen();
            }
        } else {
          return AuthenticationScreen();
        }
      },
    ));
  }
}
