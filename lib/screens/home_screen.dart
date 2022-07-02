import 'package:flutter/material.dart';
import 'package:hackathon_3scjo/screens/movies_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, MoviesScreen.id);
          },
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.lightBlue,
            ),
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Abrir lista de filmes',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
