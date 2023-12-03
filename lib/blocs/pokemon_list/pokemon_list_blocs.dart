import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '/blocs/pokemon_list/pokemon_list_events.dart';
import '/blocs/pokemon_list/pokemon_list_states.dart';
import '/repositories/pokemon_list/pokemon_list_repos_imp.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final _pokemonListRepos = PokemonListRepositoryImp();

  Logger logger = Logger();

  PokemonListBloc() : super(PokemonLoadingState()) {
    // Evento iniziale per estrarre la lista tramite API
    on<PokemonInitEvent>(
      (event, emit) async {
        emit(
          PokemonLoadingState(),
        );
        try {
          final pokemons = await _pokemonListRepos.getListPokemons(
            event.categoria,
            event.id,
          );
          emit(
            PokemonLoadedState(pokemons),
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
    // Evento in update per filtrare la lista per nome
    on<PokemonUpdateEvent>(
      (event, emit) {
        final pokemons = event.pokemons
            .where(
              (element) => element.nome.toLowerCase().contains(
                    event.nome.toLowerCase(),
                  ),
            )
            .toList();
        logger.d(pokemons);

        emit(
          PokemonLoadedState(pokemons),
        );
      },
    );
  }
}
