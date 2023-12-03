import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_architecture/ui/widgets/error_view.dart';

import '/data/models/search_parameters.dart';

import '/blocs/pokemon_search_parameters/pokemon_search_parameters_blocs.dart';
import '/blocs/pokemon_search_parameters/pokemon_search_parameters_events.dart';
import '/blocs/pokemon_search_parameters/pokemon_search_parameters_states.dart';

import '/ui/widgets/loading_view.dart';
import '/ui/widgets/search_page_view.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search-page';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    //TextEditingController nomePokemon = TextEditingController(text: '');
    return BlocProvider(
      create: (context) => SearchParametersBloc()..add(SpEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<SearchParametersBloc, SearchParametersState>(
          builder: (context, state) {
            // Caso: Pokemon in caricamento
            if (state is SPLoadingState) {
              return const Center(
                child: LoadingView(),
              );
            }

            // Caso: Pokemon caricati
            if (state is SPLoadedState) {
              SearchParametersModel parameters = state.parameters;
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<SearchParametersBloc>(context).add(SpEvent());
                },
                child: SearchPageView(
                  tipi: parameters.tipi,
                  pokedex: parameters.pokedex,
                  generazioni: parameters.generazioni,
                ),
              );
            }

            // Caso: Errore caricamento Pokemon
            if (state is SPErrorState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<SearchParametersBloc>(context).add(SpEvent());
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
      ),
    );
  }
}
