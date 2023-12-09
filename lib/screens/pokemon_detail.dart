import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_architecture/ui/widgets/vario/error_view.dart';
import '../ui/widgets/vario/loading_view.dart';
import '../ui/widgets/pokemon_detail/pokemon_detail_view.dart';
import '/data/models/pokemon_detail_model.dart';
import '/blocs/pokemon_detail/pokemon_detail_blocs.dart';
import '/blocs/pokemon_detail/pokemon_detail_events.dart';
import '/blocs/pokemon_detail/pokemon_detail_states.dart';

class PokemonDetail extends StatelessWidget {
  static const routeName = 'pokemon-detail';
  const PokemonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String?;

    return BlocProvider(
      create: (context) => PokemonDetailBloc(id!)..add(PokemonEvent()),
      child: Scaffold(
        body: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
          builder: (context, state) {
            if (state is PokemonLoadingState) {
              return const Center(
                child: LoadingView(),
              );
            }

            if (state is PokemonLoadedState) {
              PokemonDetailModel pokemon = state.pokemon;
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<PokemonDetailBloc>(context)
                      .add(PokemonEvent());
                },
                child: PokemonDetailView(
                  pokemon: pokemon,
                ),
              );
            }

            if (state is PokemonErrorState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<PokemonDetailBloc>(context)
                      .add(PokemonEvent());
                },
                child: const SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ErrorViev(),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
