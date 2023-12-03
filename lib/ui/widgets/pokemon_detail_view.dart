import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/data/models/pokemon_detail_model.dart';

import '/ui/widgets/pokemon_detail_sezione_mosse.dart';
import '/ui/widgets/pokemon_detail_sezione_statistiche.dart';
import '/ui/widgets/pokemon_detail_sezione_avatar.dart';
import '/ui/widgets/pokemon_detail_sezione_datianagrafici.dart';

class PokemonDetailView extends StatelessWidget {
  final PokemonDetailModel? pokemon;

  const PokemonDetailView({this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    PokemonDetailSezioneAvatar(pokemon: pokemon),
                    const Gap(20),
                    PokemonDetailSezioneDatiAnagrafici(pokemon: pokemon),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: ListView(
              children: [
                PokemonDetailSezioneStatistiche(pokemon: pokemon),
                const Gap(20),
                PokemonDetailSezioneMosse(pokemon: pokemon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
