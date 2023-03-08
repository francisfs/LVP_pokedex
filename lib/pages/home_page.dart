import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repository/model/pokemon.dart';
import '../repository/pokemon_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  bool carregando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 237, 239),
      appBar: AppBar(
        actions: [
          Image.network(
              'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              scale: 22)
        ],
        shadowColor: const Color.fromARGB(255, 3, 12, 192),
        centerTitle: false,
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: context.read<PokemonRepository>().pegarPokemons(),
          //contex read e o provider pedindo respository pokemon
          //conceito de injeção de dependencias
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
