import 'package:flutter/material.dart';

import 'package:pokedex/repository/model/pokemon.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

class PokemonController extends ChangeNotifier {
  List<Pokemon> pokemonList = [];
  final PokemonRepository _repository;

  PokemonController(this._repository);

  void loadPokemon() async {
    List<Pokemon> list = await _repository.pegarPokemons();
    pokemonList = list;
    notifyListeners();
  }
}
