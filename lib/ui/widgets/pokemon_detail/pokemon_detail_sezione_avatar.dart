import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/data/models/pokemon_detail_model.dart';

class PokemonDetailSezioneAvatar extends StatelessWidget {
  const PokemonDetailSezioneAvatar({
    super.key,
    required this.pokemon,
  });

  final PokemonDetailModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 100,
            backgroundColor: pokemon!.mainTypeColor(),
            child: Image.network(
              pokemon!.avatar,
              fit: BoxFit.contain,
              width: 300,
              height: 300,
            ),
          ),
        ),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            pokemon!.nome,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
