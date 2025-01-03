import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vera_cafe/main_page.dart';

//CollectionReference users = FirebaseFirestore.instance.collection('users');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'vera-cafe',
      options: const FirebaseOptions(
          apiKey: "AIzaSyAyzHSCUrA0n0UgD0Noq4fCQfF2EzHHCs8",
          authDomain: "vera-cafe.firebaseapp.com",
          projectId: "vera-cafe",
          storageBucket: "vera-cafe.appspot.com",
          messagingSenderId: "188512746347",
          appId: "1:188512746347:web:bdafb861e589ef12346a2e"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vera Cafe',
      theme: ThemeData(
        fontFamily: 'Radio Canada Big',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineMedium: const TextStyle(
              fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.black),
          headlineSmall: const TextStyle(
              fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.brown),
          titleLarge: const TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.brown),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.amber[50]),
          bodyMedium: const TextStyle(fontSize: 14.0, color: Colors.brown),
          bodySmall: const TextStyle(fontSize: 12.0, color: Colors.brown),
        ),
      ),
      home: const MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}
