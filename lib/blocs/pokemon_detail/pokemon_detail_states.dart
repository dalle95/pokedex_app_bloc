import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_architecture/data/models/pokemon_detail_model.dart';

@immutable
abstract class PokemonDetailState extends Equatable {}

// Stato dati in caricamento
class PokemonLoadingState extends PokemonDetailState {
  @override
  List<Object?> get props => [];
}

// Stato: dati caricati
class PokemonLoadedState extends PokemonDetailState {
  PokemonLoadedState(this.pokemon);
  final PokemonDetailModel pokemon;

  @override
  List<Object?> get props => [pokemon];
}

// Stato: errore caricamento dati
class PokemonErrorState extends PokemonDetailState {
  PokemonErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
