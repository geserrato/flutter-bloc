import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int pokemonid) _fetchPokemonName;

  PokemonBloc({
    required Future<String> Function(int pokemonid) fetchPokemon,
  })  : _fetchPokemonName = fetchPokemon,
        super(const PokemonState()) {
    on<PokemonAdded>((event, emit) {
      final newPokemons = Map<int, String>.from(state.pokemons);
      newPokemons[event.pokemonId] = event.pokemonName;
      emit(state.copyWith(pokemons: newPokemons));
    });
  }

  Future<String> fetchPokemonName(int pokemonId) async {
    if (state.pokemons.containsKey(pokemonId)) {
      return state.pokemons[pokemonId]!;
    }
    final pokemonName = await _fetchPokemonName(pokemonId);
    add(PokemonAdded(pokemonId, pokemonName));
    return pokemonName;
  }
}
