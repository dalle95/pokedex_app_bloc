import 'dart:async';

import 'package:http/http.dart';

import '/data/remote/api_base_service.dart';
import '/data/remote/api_network_service.dart';
import '/repositories/download_app/download_app_repos.dart';

class DownloadAppRepositoryImp extends DownloadAppRepository {
  // Definizione servizio API
  final BaseApiService _apiService = NetworkApiService();

  // Funzione per controllare la nuova versione
  @override
  Future<bool> checkNuovaVersione() async {
    try {
      dynamic response = await _apiService.checkNuovaVersione();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Funzione per estrarre la grandezza della nuova versione
  @override
  Future<int> getFileSize() async {
    try {
      dynamic response = await _apiService.getFileSize();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Funzione per scaricare la nuova versione
  @override
  Future<ByteStream?> scaricaNuovaVersione() async {
    try {
      ByteStream stream = await _apiService.scaricaNuovaVersione();

      return stream;
    } catch (e) {
      rethrow;
    }
  }
}
