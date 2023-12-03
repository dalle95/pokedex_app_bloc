import 'package:equatable/equatable.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();
}

class PokemonEvent extends PokemonDetailEvent {
  @override
  List<Object> get props => [];
}
