import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'repository/model/pokemon.dart';
import 'detail_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 237, 239),
      appBar: AppBar(
        actions: [
          Image.network(
              'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              scale: 22)
        ],
        shadowColor: Color.fromARGB(255, 3, 12, 192),
        centerTitle: false,
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: pegarPokemons(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    //Pokemon pokemon = Pokemon();
                    Pokemon pokemons = snapshot.data![index];

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/details');
                        
                        
                      },
                      child: Card(
                        child: ListTile(
                          leading:
                              Image.network(pokemons.thumbnailImage.toString()),
                          title: Text(pokemons.name!),
                          trailing: Text('#00${pokemons.id!.toString()}'),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  
}
