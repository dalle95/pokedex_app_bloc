import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '/blocs/pokemon_list/pokemon_list_blocs.dart';
import '/blocs/pokemon_list/pokemon_list_events.dart';
import '/blocs/pokemon_list/pokemon_list_states.dart';

import '/data/models/pokemon_list_model.dart';

import '/screens/homepage.dart';
import '/screens/search_page.dart';

import '../vario/error_view.dart';
import 'homepage_appbar_title.dart';
import '../vario/loading_view.dart';
import 'pokemon_list_view.dart';

class HomepageView extends StatefulWidget {
  final String categoria;
  final String id;

  const HomepageView({
    required this.categoria,
    required this.id,
    super.key,
  });

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  List<PokemonListModel> pokemonMainList = [];

  List<PokemonListModel> pokemonList = [];

  String? nome;

  Future<void> mostraModal(BuildContext blocContext) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Wrap(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Nome',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 15),
                onChanged: (stringa) {
                  BlocProvider.of<PokemonListBloc>(blocContext).add(
                    PokemonUpdateEvent(
                      stringa,
                      pokemonMainList,
                    ),
                  );
                },
                onFieldSubmitted: (stringa) {
                  setState(() {
                    nome = stringa;
                  });

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => PokemonListBloc()
        ..add(PokemonInitEvent(
          widget.categoria,
          widget.id,
        )),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const AppBarTitle(),
            actions: [
              widget.categoria != 'pokemon' && widget.id != ''
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      },
                      icon: const Icon(
                        Icons.filter_alt_off_outlined,
                      ),
                    )
                  : const SizedBox(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SearchPage.routeName);
                },
                icon: const Icon(
                  Icons.filter_list,
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              nome != null
                  ? FloatingActionButton(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        setState(() {
                          nome = null;
                        });
                        BlocProvider.of<PokemonListBloc>(context).add(
                          PokemonInitEvent(
                            widget.categoria,
                            widget.id,
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.search_off,
                      ),
                    )
                  : const SizedBox(),
              const Gap(10),
              FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  await mostraModal(context);
                },
                child: const Icon(
                  Icons.search_rounded,
                ),
              ),
            ],
          ),
          body: BlocBuilder<PokemonListBloc, PokemonListState>(
            builder: (context, state) {
              // Caso: Pokemon in caricamento
              if (state is PokemonLoadingState) {
                return const LoadingView();
              }

              // Caso: Pokemon caricati
              if (state is PokemonLoadedState) {
                pokemonList = state.pokemons;
                if (pokemonMainList.isEmpty) {
                  pokemonMainList = state.pokemons;
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<PokemonListBloc>(context).add(
                      PokemonInitEvent(
                        widget.categoria,
                        widget.id,
                      ),
                    );
                  },
                  child: PolemonListView(pokemonList: pokemonList),
                );
              }

              // Caso: Errore caricamento Pokemon
              if (state is PokemonErrorState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<PokemonListBloc>(context).add(
                      PokemonInitEvent(
                        widget.categoria,
                        widget.id,
                      ),
                    );
                  },
                  child: const SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: ErrorViev(),
                  ),
                );
              }

              // Caso: default
              return Container();
            },
          ),
        );
      }),
    );
  }
}
