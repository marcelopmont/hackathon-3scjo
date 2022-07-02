import 'package:flutter/material.dart';
import 'package:hackathon_3scjo/screens/home_screen.dart';
import 'package:hackathon_3scjo/screens/movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        MoviesScreen.id: (context) => MoviesScreen(),
      },
    );
  }
}
