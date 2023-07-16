import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/screens/home_screen.dart';
import 'package:hearing_act/screens/authentication_screen.dart';
import 'package:hearing_act/screens/profile_form.dart';

final kcolorSchema =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 240, 255, 248));

final kdarkcolorSchema = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 1, 33, 17),
    brightness: Brightness.dark);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
    
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData().copyWith(
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
    home: const ProviderScope(child: Myapp()),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return const Center(child: Text('Something went worng'),);
        }else if(snapshot.hasData){
          return ProfileForm();
        }
        else{
          return AuthenticationScreen();
        }
      },));
  }
}
