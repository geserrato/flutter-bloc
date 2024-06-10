part of 'pokemon_bloc.dart';

class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonAdded extends PokemonEvent {
  final int pokemonId;
  final String pokemonName;

  const PokemonAdded(this.pokemonId, this.pokemonName);
}
