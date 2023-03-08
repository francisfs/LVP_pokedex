import 'package:flutter/material.dart';
import 'pages/detail_pokemon.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //'/': (context) => HomePage(),
        '/details': (context) => DetailPokemon()
      },
      debugShowCheckedModeBanner: false,
      title: 'pokemon',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
