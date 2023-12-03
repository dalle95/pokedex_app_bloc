import 'package:equatable/equatable.dart';
import '/data/models/pokemon_list_model.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();
}

class PokemonInitEvent extends PokemonListEvent {
  final String categoria;
  final String id;
  const PokemonInitEvent(
    this.categoria,
    this.id,
  );
  @override
  List<Object> get props => [];
}

class PokemonUpdateEvent extends PokemonListEvent {
  final String nome;
  final List<PokemonListModel> pokemons;
  const PokemonUpdateEvent(
    this.nome,
    this.pokemons,
  );
  @override
  List<Object> get props => [];
}
