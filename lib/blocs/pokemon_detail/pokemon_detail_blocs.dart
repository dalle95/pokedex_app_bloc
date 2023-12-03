import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/pokemon_detail/pokemon_detail_events.dart';
import '/blocs/pokemon_detail/pokemon_detail_states.dart';
import '/repositories/pokemon_detail/pokemon_detail_repos_imp.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final _pokemonDetailRepos = PokemonDetailRepositoryImp();
  final String id;

  PokemonDetailBloc(this.id) : super(PokemonLoadingState()) {
    on<PokemonDetailEvent>(
      (event, emit) async {
        emit(
          PokemonLoadingState(),
        );
        try {
          final pokemon = await _pokemonDetailRepos.getDetailPokemon(id);

          emit(
            PokemonLoadedState(pokemon),
          );
        } catch (error) {
          emit(
            PokemonErrorState(
              error.toString(),
            ),
          );
        }
      },
    );
  }
}
