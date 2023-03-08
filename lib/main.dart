import 'package:flutter/material.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'pages/detail_pokemon.dart';
import 'pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PokemonRepository()),
        ChangeNotifierProvider(
          create: (_) => PokemonController(context.read())),
      ],
      child: MaterialApp(
        routes: {
          //'/': (context) => HomePage(),
          //'/details': (context) => DetailPokemon()
        },
        debugShowCheckedModeBanner: false,
        title: 'pokemon',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
