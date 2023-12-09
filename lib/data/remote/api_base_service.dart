import '/data/models/pokemon_detail_model.dart';
import '/data/models/pokemon_list_model.dart';
import '/data/models/search_parameters.dart';

abstract class BaseApiService {
  final String baseUrl = "https://pokeapi.co";
  final String apiKey = "";

  // Funzione per estrarre i Pokemon
  Future<List<PokemonListModel>> getListPokemons(String url);

  // Funzione per estarre il dettaglio del Pokemon
  Future<PokemonDetailModel> getDetailPokemon(String url);

  // Funzione per estarre i parametri di ricerca
  Future<SearchParametersModel> getSearchParameters(
    String urlTipi,
    String urlPokedex,
    String urlGenerazione,
  );

  // Funzione per controllare se è presente una nuova versione dell'app
  Future<bool> checkNuovaVersione();

  // Funzione per scaricare la nuova versione dell'app
  Future<bool> scaricaNuovaVersione();
}
