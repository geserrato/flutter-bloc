import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int pokemonId = 1;
  @override
  Widget build(BuildContext context) {
    final pokemonBloc = context.watch<PokemonBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('PokémonId: $pokemonId'),
      ),
      body: Center(
        child: FutureBuilder(
          future: pokemonBloc.fetchPokemonName(pokemonId),
          initialData: pokemonBloc.state.pokemons[pokemonId] ?? 'loading...',
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Text(snapshot.data);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-add',
            child: const Icon(Icons.plus_one),
            onPressed: () {
              pokemonId++;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: 'btn-minus',
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              if (pokemonId <= 1) return;
              pokemonId--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
