import '/data/remote/api_base_service.dart';
import '/data/remote/api_endpoints.dart';
import '/data/remote/api_network_service.dart';
import '/repositories/search_parameters/search_parameters_repos.dart';

class SearchParametersRepositoryImp extends SearchParametersRepository {
  // Definizione servizio API
  final BaseApiService _apiService = NetworkApiService();

  // Funzione per estrarre i parametri di ricerca
  @override
  Future<dynamic> getSearchParameters() async {
    try {
      dynamic response = await _apiService.getSearchParameters(
        ApiEndPoints().parametroTipo,
        ApiEndPoints().parametroPokedex,
        ApiEndPoints().parametroGenerazioni,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
