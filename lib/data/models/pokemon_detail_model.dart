import 'package:flutter/material.dart';

class PokemonDetailModel {
  final String id;
  final String nome;
  final String ability;
  final String height;
  final String weight;
  final List<dynamic> types;
  final List<dynamic> moves;
  final String avatar;
  final String hp;
  final String attack;
  final String defense;
  final String specialAttack;
  final String specialDefense;
  final String speed;
  final String frase;

  PokemonDetailModel({
    required this.id,
    required this.nome,
    required this.ability,
    required this.height,
    required this.weight,
    required this.types,
    required this.moves,
    required this.avatar,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.frase,
  });

  @override
  String toString() => 'ID: $id | Nome: $nome ';

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      id: json['id'].toString(),
      nome: json['name'],
      ability:
          json['abilities'].map((mappa) => mappa['ability']['name']).join(', '),
      height: (json['height'] / 10).toStringAsFixed(2),
      weight: (json['weight'] / 10).toStringAsFixed(2),
      types: json['types'].map((mappa) => mappa['type']['name']).toList(),
      moves: json['moves'].map((mappa) => mappa['move']['name']).toList(),
      avatar: json['sprites']['front_default'],
      hp: json['stats']!
          .firstWhere(
            (mappa) => (mappa['stat'] as Map)['name'] == 'hp',
            orElse: () => {'base_stat': 0},
          )['base_stat']
          .toString(),
      attack: json['stats']!
          .firstWhere(
            (mappa) => (mappa['stat'] as Map)['name'] == 'attack',
            orElse: () => {'base_stat': 0},
          )['base_stat']
          .toString(),
      defense: json['stats']!
          .firstWhere(
            (mappa) => (mappa['stat'] as Map)['name'] == 'defense',
            orElse: () => {'base_stat': 0},
          )['base_stat']
          .toString(),
      specialAttack: json['stats']!
          .firstWhere(
            (mappa) => (mappa['stat'] as Map)['name'] == 'special-attack',
            orElse: () => {'base_stat': 0},
          )['base_stat']
          .toString(),
      specialDefense: json['stats']!
          .firstWhere(
            (mappa) => (mappa['stat'] as Map)['name'] == 'special-defense',
            orElse: () => {'base_stat': 0},
          )['base_stat']
          .toString(),
      speed: json['stats']!
          .firstWhere(
            (mappa) => (mappa['stat'] as Map)['name'] == 'speed',
            orElse: () => {'base_stat': 0},
          )['base_stat']
          .toString(),
      frase: 'Nessuna',
    );
  }

  Color? mainTypeColor() {
    String mainType = types[0];

    switch (mainType) {
      case 'normal':
        return Colors.grey[200];
      case 'fighting':
        return Colors.orange[300];
      case 'flying':
        return Colors.lightBlue[100];
      case 'poison':
        return Colors.deepPurple[200];
      case 'ground':
        return Colors.brown[300];
      case 'rock':
        return Colors.grey[400];
      case 'bug':
        return Colors.lightGreen[100];
      case 'ghost':
        return Colors.grey[600];
      case 'steel':
        return Colors.blueGrey[300];
      case 'water':
        return Colors.blue[200];
      case 'fire':
        return Colors.red[400];
      case 'grass':
        return Colors.green[200];
      case 'electric':
        return Colors.yellow[400];
      case 'psychic':
        return Colors.pink[200];
      case 'ice':
        return Colors.lightBlue[300];
      case 'dragon':
        return Colors.blue[800];
      case 'dark':
        return Colors.grey[800];
      case 'fairy':
        return Colors.pink[50];
      case 'unknown':
        return Colors.black;
      case 'shadow':
        return Colors.blueGrey[800];
      default:
        return Colors.black87;
    }
  }
}
