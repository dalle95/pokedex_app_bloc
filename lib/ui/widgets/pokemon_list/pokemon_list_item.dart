import 'package:flutter/material.dart';
import '/data/models/pokemon_list_model.dart';
import '/screens/pokemon_detail.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    super.key,
    required this.pokemonList,
    required this.index,
  });

  final List<PokemonListModel> pokemonList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: const Color.fromRGBO(
        147,
        147,
        147,
        0.3,
      ),
      elevation: 1,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: Container(
        height: 100,
        alignment: Alignment.center,
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(
              PokemonDetail.routeName,
              arguments: pokemonList[index].id,
            );
          },
          title: Text(
            pokemonList[index].nome,
            style: Theme.of(context).textTheme.displayMedium,
            // const TextStyle(
            //   color: Colors.black,
            //   fontSize: 18,
            //   fontWeight: FontWeight.w500,
            // ),
          ),
          // subtitle: Text(
          //   pokemonList[index].lastName,
          //   style: const TextStyle(color: Colors.white),
          // ),
          trailing: CircleAvatar(
            radius: 50,
            child: Text(pokemonList[index].id),

            //backgroundImage: NetworkImage(pokemonList[index].avatar),
          ),
        ),
      ),
    );
  }
}
