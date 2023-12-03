import 'package:flutter/material.dart';
import '/data/models/pokemon_detail_model.dart';

class PokemoneTypesSezione extends StatelessWidget {
  const PokemoneTypesSezione({
    super.key,
    required this.pokemon,
  });

  final PokemonDetailModel? pokemon;

  Color? typeColor(String type) {
    switch (type) {
      case 'normal':
        return Colors.grey[300];
      case 'fighting':
        return Colors.orange[400];
      case 'flying':
        return Colors.lightBlue[100];
      case 'poison':
        return Colors.deepPurple[300];
      case 'ground':
        return Colors.brown[400];
      case 'rock':
        return Colors.grey;
      case 'bug':
        return Colors.lightGreen[600];
      case 'ghost':
        return Colors.grey[600];
      case 'steel':
        return Colors.blueGrey;
      case 'water':
        return Colors.blue[300];
      case 'fire':
        return Colors.red[600];
      case 'grass':
        return Colors.green[400];
      case 'electric':
        return Colors.yellow;
      case 'psychic':
        return Colors.pink[300];
      case 'ice':
        return Colors.lightBlue[300];
      case 'dragon':
        return Colors.blue[800];
      case 'dark':
        return Colors.grey[800];
      case 'fairy':
        return Colors.pink[100];
      case 'unknown':
        return Colors.black;
      case 'shadow':
        return Colors.blueGrey[800];
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 5,
      spacing: 5,
      children: pokemon!.types
          .map(
            (type) => Container(
              height: 22,
              width: 160,
              decoration: BoxDecoration(
                color: typeColor(type),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Text(
                type,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
          .toList(),
    );
  }
}
