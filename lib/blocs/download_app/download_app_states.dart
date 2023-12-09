import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DownloadAppState extends Equatable {}

// Stato dati in caricamento
class DownloadAppLoadingState extends DownloadAppState {
  @override
  List<Object?> get props => [];
}

// Stato: dati caricati
class DownloadAppLoadedState extends DownloadAppState {
  DownloadAppLoadedState(this.nuovaVersione);
  final bool nuovaVersione;

  @override
  List<Object?> get props => [nuovaVersione];
}

// Stato: errore caricamento dati
class DownloadAppErrorState extends DownloadAppState {
  DownloadAppErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
