import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/pokemon_search_parameters/pokemon_search_parameters_events.dart';
import '/blocs/pokemon_search_parameters/pokemon_search_parameters_states.dart';
import '/repositories/search_parameters/search_parameters_repos_imp.dart';

class SearchParametersBloc
    extends Bloc<SearchParametersEvent, SearchParametersState> {
  final _searchParametersRepos = SearchParametersRepositoryImp();

  SearchParametersBloc() : super(SPLoadingState()) {
    on<SpEvent>(
      (event, emit) async {
        emit(
          SPLoadingState(),
        );
        try {
          final parameters = await _searchParametersRepos.getSearchParameters();
          emit(
            SPLoadedState(parameters),
          );
        } catch (error) {
          emit(
            SPErrorState(
              error.toString(),
            ),
          );
        }
      },
    );
  }
}
