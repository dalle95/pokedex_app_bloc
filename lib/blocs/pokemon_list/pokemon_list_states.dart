import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/data/models/pokemon_list_model.dart';

@immutable
abstract class PokemonListState extends Equatable {}

// Stato dati in caricamento
class PokemonLoadingState extends PokemonListState {
  @override
  List<Object?> get props => [];
}

// Stato: dati caricati
class PokemonLoadedState extends PokemonListState {
  PokemonLoadedState(this.pokemons);
  final List<PokemonListModel> pokemons;

  @override
  List<Object?> get props => [pokemons];
}

// Stato: errore caricamento dati
class PokemonErrorState extends PokemonListState {
  PokemonErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
