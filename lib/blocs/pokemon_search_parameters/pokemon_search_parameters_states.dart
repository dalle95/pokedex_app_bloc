import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/data/models/search_parameters.dart';

@immutable
abstract class SearchParametersState extends Equatable {}

// Stato dati in caricamento
class SPLoadingState extends SearchParametersState {
  @override
  List<Object?> get props => [];
}

// Stato: dati caricati
class SPLoadedState extends SearchParametersState {
  SPLoadedState(this.parameters);
  final SearchParametersModel parameters;

  @override
  List<Object?> get props => [parameters];
}

// Stato: errore caricamento dati
class SPErrorState extends SearchParametersState {
  SPErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
