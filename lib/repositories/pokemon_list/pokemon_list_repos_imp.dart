import '/data/remote/api_base_service.dart';
import '/data/remote/api_endpoints.dart';
import '/data/remote/api_network_service.dart';
import '/repositories/pokemon_list/pokemon_list_repos.dart';

class PokemonListRepositoryImp extends PokemonListRepository {
  // Definizione servizio API
  final BaseApiService _apiService = NetworkApiService();

  // Funzione per estrarre i Pokemon
  @override
  Future<dynamic> getListPokemons(
    String categoria,
    String id,
  ) async {
    try {
      String endpoint = ApiEndPoints().parametroListaPokemon;

      if (categoria == 'tipo') {
        endpoint = ApiEndPoints().parametroTipo + id;
      }
      if (categoria == 'pokedex') {
        endpoint = ApiEndPoints().parametroPokedex + id;
      }
      if (categoria == 'generazione') {
        endpoint = ApiEndPoints().parametroGenerazioni + id;
      }
      if (categoria == 'pokemon') {
        endpoint = ApiEndPoints().parametroListaPokemon;
      }

      dynamic response = await _apiService.getListPokemons(
        endpoint,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
