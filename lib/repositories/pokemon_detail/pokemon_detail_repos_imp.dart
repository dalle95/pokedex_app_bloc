import '/data/remote/api_endpoints.dart';
import '/data/remote/api_base_service.dart';
import '/data/remote/api_network_service.dart';
import '/repositories/pokemon_detail/pokemon_detail_repos.dart';

class PokemonDetailRepositoryImp extends PokemonDetailRepository {
  // Definizione servizio API
  final BaseApiService _apiService = NetworkApiService();

  // Funzione per estrarre il dettaglio Pokemon
  @override
  Future<dynamic> getDetailPokemon(String id) async {
    try {
      dynamic response = await _apiService.getDetailPokemon(
        ApiEndPoints().parametroSingoloPokemon + id,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
