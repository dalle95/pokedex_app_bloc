import 'package:flutter/material.dart';

import '/labels.dart';

import '/data/models/pokemon_detail_model.dart';

class PokemonDetailSezioneMosse extends StatelessWidget {
  const PokemonDetailSezioneMosse({
    super.key,
    required this.pokemon,
  });

  final PokemonDetailModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              labels.pokemonDetailMosse,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 300,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: pokemon!.moves.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      pokemon!.moves[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
