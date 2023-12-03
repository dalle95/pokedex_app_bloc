import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/labels.dart';

import '/data/models/pokemon_detail_model.dart';
import '/ui/widgets/pokemon_type_sezione.dart';

class PokemonDetailSezioneDatiAnagrafici extends StatelessWidget {
  const PokemonDetailSezioneDatiAnagrafici({
    super.key,
    required this.pokemon,
  });

  final PokemonDetailModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 400,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              labels.pokemonDetailTipo,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: PokemoneTypesSezione(pokemon: pokemon),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              labels.pokemonDetailAltezza,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${pokemon!.height} Metri',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Gap(10),
          Align(
            alignment: Alignment.center,
            child: Text(
              labels.pokemonDetailPeso,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${pokemon!.weight} Kg',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Gap(10),
          Align(
            alignment: Alignment.center,
            child: Text(
              labels.pokemonDetailInfo,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              pokemon!.frase,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Gap(10),
          Align(
            alignment: Alignment.center,
            child: Text(
              labels.pokemonDetailAbilita,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              pokemon!.ability,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
