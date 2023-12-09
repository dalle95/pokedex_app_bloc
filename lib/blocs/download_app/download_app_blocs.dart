import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/download_app/download_app_events.dart';
import '/blocs/download_app/download_app_states.dart';
import '/repositories/pokemon_detail/pokemon_detail_repos_imp.dart';

class DownloadAppBloc extends Bloc<DownloadAppEventBloc, DownloadAppState> {
  final _pokemonDetailRepos = PokemonDetailRepositoryImp();
  final String id;

  DownloadAppBloc(this.id) : super(DownloadAppLoadingState()) {
    on<DownloadAppEvent>(
      (event, emit) async {
        emit(
          DownloadAppLoadingState(),
        );
        try {
          final pokemon = await _pokemonDetailRepos.getDetailPokemon(id);

          emit(
            DownloadAppLoadedState(pokemon),
          );
        } catch (error) {
          emit(
            DownloadAppErrorState(
              error.toString(),
            ),
          );
        }
      },
    );
  }
}
