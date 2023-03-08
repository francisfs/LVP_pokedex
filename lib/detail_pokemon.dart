import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class DetailPokemon extends StatelessWidget {
  DetailPokemon({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
