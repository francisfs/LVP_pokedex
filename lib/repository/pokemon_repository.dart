import 'dart:convert';

import 'model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {

  Future<List<Pokemon>> pegarPokemons() async {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=10&page=0');
    final response = await http.get(url);

    

    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body);
      return jsonResponse['data']
          .map<Pokemon>((json) => Pokemon.fromJson(json))
          .toList();
    } else {
      throw Exception("erro não foi possível carregar os Pokemons");
    }
  }
  
}