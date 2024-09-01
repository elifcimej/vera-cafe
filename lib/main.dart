import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vera_cafe/main_page.dart';

//CollectionReference users = FirebaseFirestore.instance.collection('users');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCkYHKxj-EtyoahYbuhF61hxIy_mcM7OUo",
        appId: "1:188512746347:android:ff6e5d4d0d085f1c346a2e",
        messagingSenderId: "188512746347",
        projectId: "vera-cafe"),
  );
  runApp(const MyApp());
}

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCkYHKxj-EtyoahYbuhF61hxIy_mcM7OUo",
          appId: "1:188512746347:android:ff6e5d4d0d085f1c346a2e",
          messagingSenderId: "188512746347",
          projectId: "vera-cafe"),
    );
  } else {
    await Firebase.initializeApp();
  } // TODO Implement this library.
}
*/
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
