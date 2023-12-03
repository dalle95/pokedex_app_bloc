import 'package:flutter/material.dart';
import '../../ui/widgets/pokemon_list_item.dart';
import '../../data/models/pokemon_list_model.dart';

class PolemonListView extends StatelessWidget {
  const PolemonListView({
    super.key,
    required this.pokemonList,
  });

  final List<PokemonListModel> pokemonList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (_, index) {
          return PokemonListItem(
            pokemonList: pokemonList,
            index: index,
          );
        },
      ),
    );
  }
}
