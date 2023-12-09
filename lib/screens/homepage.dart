import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '/data/models/pokemon_list_model.dart';

import '../ui/widgets/pokemon_list/homepage_view.dart';

Logger logger = Logger();

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categoria = 'pokemon';
  String id = '';

  List<PokemonListModel> pokemonMainList = [];

  List<PokemonListModel> pokemonList = [];

  @override
  void didChangeDependencies() {
    final parametro =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    if (parametro != null) {
      categoria = parametro['categoria']!;
      id = parametro['id']!;
      logger.d(parametro);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return HomepageView(
      categoria: categoria,
      id: id,
    );
  }
}
