import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import '/data/remote/api_endpoints.dart';

import '/data/models/search_parameters.dart';
import '/data/models/pokemon_detail_model.dart';
import '/data/models/pokemon_list_model.dart';
import '/data/remote/api_base_service.dart';

class NetworkApiService extends BaseApiService {
  // Gestione dei log
  var logger = Logger();

  @override
  // Funzione per estrarre i Pokemon
  Future<List<PokemonListModel>> getListPokemons(String url) async {
    logger.d('NetworkApiService: getListPokemons');

    // Definisco l'url da interrogare
    var uri = Uri.parse(baseUrl + url);

    try {
      // Chiamata per estrarre la lista dei Pokemon
      http.Response response = await http.get(uri);

      // Controllo dello stato della risposta
      if (response.statusCode == 200) {
        var extractedData = json.decode(response.body) as Map<String, dynamic>;
        List<PokemonListModel> pokemonList = [];

        // logger.d('Estrazione risultati json:');
        // logger.d(extractedData);

        // Caso 1: senza filtro
        if (extractedData.containsKey('results')) {
          for (var element in extractedData['results'] as List) {
            // Definisco il pokemon
            PokemonListModel pokemon = PokemonListModel.fromJson(element);

            pokemonList.add(pokemon);
          }
        }

        // Caso 2: con filtro per pokedex
        if (extractedData.containsKey('pokemon_entries')) {
          for (var element in extractedData['pokemon_entries'] as List) {
            // Definisco il pokemon
            PokemonListModel pokemon = PokemonListModel.fromJson(element);

            pokemonList.add(pokemon);
          }
          // Ordino la lista
          pokemonList
              .sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
        }

        // Caso 3: con filtro per generazione
        if (extractedData.containsKey('pokemon_species')) {
          for (var element in extractedData['pokemon_species'] as List) {
            // Definisco il pokemon
            PokemonListModel pokemon = PokemonListModel.fromJson(element);

            pokemonList.add(pokemon);
          }
          // Ordino la lista
          pokemonList
              .sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
        }

        // Caso 4: con filtro per tipo
        if (extractedData.containsKey('pokemon')) {
          for (var element in extractedData['pokemon'] as List) {
            // Definisco il pokemon
            PokemonListModel pokemon = PokemonListModel.fromJson(element);

            pokemonList.add(pokemon);
          }
          // Ordino la lista
          pokemonList
              .sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
        }

        return pokemonList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      logger.d(error);
      throw Exception(error.toString());
    }
  }

  @override
  // Funzione per estrarre il dettaglio del Pokemon
  Future<PokemonDetailModel> getDetailPokemon(String url) async {
    logger.d('NetworkApiService: getDetailPokemon');

    PokemonDetailModel pokemon;

    // Chiamata Pokemon classica
    try {
      // Definisco l'url da interrogare
      var uri = Uri.parse(baseUrl + url);
      // Chiamata per estrarre il dettaglio del Pokemon
      http.Response response = await http.get(uri);

      // Controllo dello stato della risposta
      if (response.statusCode == 200) {
        var extractedData = json.decode(response.body) as Map<String, dynamic>;

        pokemon = PokemonDetailModel.fromJson(extractedData);

        // logger.d('Estrazione risultati json:');
        // logger.d(extractedData);
      } else {
        throw Exception(
            'Errore sulla chiamata pokemon: ${response.reasonPhrase}');
      }
    } catch (error) {
      logger.d(error);
      throw Exception('Errore sulla chiamata pokemon: ${error.toString()}');
    }

    // Chiamata pokemon con altre info
    try {
      // Definisco l'url da interrogare
      var uri = Uri.parse(
        baseUrl +
            ApiEndPoints().parametroSingoloPokemonAltreInfo +
            pokemon.nome,
      );
      // Chiamata per estrarre il dettaglio del Pokemon
      http.Response response = await http.get(uri);

      // Controllo dello stato della risposta
      if (response.statusCode == 200) {
        var extractedData = json.decode(response.body) as Map<String, dynamic>;

        pokemon = PokemonDetailModel(
          id: pokemon.id,
          nome: pokemon.nome,
          ability: pokemon.ability,
          height: pokemon.height,
          weight: pokemon.weight,
          types: pokemon.types,
          moves: pokemon.moves,
          avatar: pokemon.avatar,
          hp: pokemon.hp,
          attack: pokemon.attack,
          defense: pokemon.defense,
          specialAttack: pokemon.specialAttack,
          specialDefense: pokemon.specialDefense,
          speed: pokemon.speed,
          frase: extractedData['flavor_text_entries']!.firstWhere(
            (mappa) => (mappa['language'] as Map)['name'] == 'it',
            orElse: () => {'flavor_text': 'Nessuna'},
          )['flavor_text'],
        );

        // logger.d('Estrazione risultati json:');
        // logger.d(extractedData);
      } else {
        if (response.reasonPhrase != "Not Found") {
          throw Exception(
              'Errore sulla chiamata pokemon altre info: ${response.reasonPhrase}');
        }
      }
    } catch (error) {
      logger.d(error);
      throw Exception(
          'Errore sulla chiamata pokemon altre info: ${error.toString()}');
    }
    return pokemon;
  }

  @override
  // Funzione per estrarre il dettaglio del Pokemon
  Future<SearchParametersModel> getSearchParameters(
    String urlTipi,
    String urlPokedex,
    String urlGenerazione,
  ) async {
    logger.d('NetworkApiService: getSearchParameters');

    // Definisco l'url da interrogare per i tipi
    var uriTipi = Uri.parse(baseUrl + urlTipi);
    // Definisco l'url da interrogare per i pokedex
    var uriPokedex = Uri.parse(baseUrl + urlPokedex);
    // Definisco l'url da interrogare per le generazioni
    var uriGenerazioni = Uri.parse(baseUrl + urlGenerazione);

    List<String> tipi = [''];
    List<String> pokedex = [''];
    List<String> generazioni = [''];

    try {
      // Chiamata per estrarre l'elenco tipi
      http.Response response = await http.get(uriTipi);

      // Controllo dello stato della risposta
      if (response.statusCode == 200) {
        // Estraggo il body della risposta dove è presente il json
        var extractedData = json.decode(response.body) as Map<String, dynamic>;

        // logger.d('Estrazione risultati json:');
        // logger.d(extractedData['results']);

        // Decodifico i risultati in una lista di mappe
        List<Map<String, dynamic>> listaDiMappe =
            List<Map<String, dynamic>>.from(extractedData['results']);
        // Associo alla lista solo i valori facente riferimento al nome
        tipi = listaDiMappe.map((mappa) => mappa['name'].toString()).toList();
        // Aggiungo una stringa vuota all'inizio della lista per gestire la lista nei pulsanti
        tipi.insert(0, '');
      } else {
        throw Exception('Errore Tipi: ${response.reasonPhrase}');
      }

      // Chiamata per estrarre l'elenco dei pokedex
      response = await http.get(uriPokedex);

      // Controllo dello stato della risposta
      if (response.statusCode == 200) {
        // Estraggo il body della risposta dove è presente il json
        var extractedData = json.decode(response.body) as Map<String, dynamic>;

        // Decodifico i risultati in una lista di mappe
        List<Map<String, dynamic>> listaDiMappe =
            List<Map<String, dynamic>>.from(extractedData['results']);
        // Associo alla lista solo i valori facente riferimento al nome
        pokedex =
            listaDiMappe.map((mappa) => mappa['name'].toString()).toList();
        // Aggiungo una stringa vuota all'inizio della lista per gestire la lista nei pulsanti
        pokedex.insert(0, '');
      } else {
        throw Exception('Errore pokedex: ${response.reasonPhrase}');
      }

      // Chiamata per estrarre l'elenco delle generazioni
      response = await http.get(uriGenerazioni);

      // Controllo dello stato della risposta
      if (response.statusCode == 200) {
        // Estraggo il body della risposta dove è presente il json
        var extractedData = json.decode(response.body) as Map<String, dynamic>;

        // Decodifico i risultati in una lista di mappe
        List<Map<String, dynamic>> listaDiMappe =
            List<Map<String, dynamic>>.from(extractedData['results']);
        // Associo alla lista solo i valori facente riferimento al nome
        generazioni =
            listaDiMappe.map((mappa) => mappa['name'].toString()).toList();
        // Aggiungo una stringa vuota all'inizio della lista per gestire la lista nei pulsanti
        generazioni.insert(0, '');
      } else {
        throw Exception('Errore generazioni: ${response.reasonPhrase}');
      }

      return SearchParametersModel(
        tipi: tipi,
        pokedex: pokedex,
        generazioni: generazioni,
      );
    } catch (error) {
      logger.d(error);
      throw Exception(error.toString());
    }
  }

  // Funzione per estrarre la Versione dell'app in Firebase
  Future<String> getVersioneAppFirebase() async {
    String infoVersioneFirebase = '';

    // Recupero le remote config di Firebase
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );

      await remoteConfig.fetchAndActivate();

      // Recupero l'ultima versione dell'app settata su Firebase
      infoVersioneFirebase = remoteConfig.getString('lastAppVersion');
    } on FirebaseException catch (exception) {
      // Fetch throttled.
      logger.d(exception);
      rethrow;
    } catch (error) {
      rethrow;
    }

    return infoVersioneFirebase;
  }

  // Funzione per estrarre la Versione dell'app in Firebase
  Future<String> getDownloadUrlFirebase() async {
    String downloadUrl = '';

    // Recupero le remote config di Firebase
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );

      await remoteConfig.fetchAndActivate();

      // Recupero l'ultima versione dell'app settata su Firebase
      downloadUrl = remoteConfig.getString('downloadUrl');
    } on FirebaseException catch (exception) {
      // Fetch throttled.
      logger.d(exception);
      rethrow;
    } catch (error) {
      rethrow;
    }

    return downloadUrl;
  }

  @override
  // Funzione per controllare se è presente una nuova versione dell'app
  Future<bool> checkNuovaVersione() async {
    logger.d('Funzione: checkNuovaVersione');

    // Recupero la versione dell'applicazione
    final infoApp = await PackageInfo.fromPlatform();
    final infoVersioneApp = '${infoApp.version}+${infoApp.buildNumber}';

    // Recupero l'ultima versione dell'app settata su Firebase
    final infoVersioneFirebase = await getVersioneAppFirebase();

    logger.d(
      'Versione App: $infoVersioneApp\n Versione Firebase: $infoVersioneFirebase',
    );

    // Confronto Versioni in formato stringa
    if (infoVersioneFirebase == infoVersioneApp) {
      return false;
    }
    return true;
  }

  @override
  // Funzione per estrarre la grandezza del file
  Future<int> getFileSize() async {
    // Estraggo la versione presente su Firebase
    final infoVersioneFirebase = await getVersioneAppFirebase();

    // Recupero la radice dell'URL per download nuova versione app
    final downloadUrlRadice = await getDownloadUrlFirebase();

    // Compongo l'URL da cui scaricare la nuova versione dell'app
    final downloadUrl =
        '$downloadUrlRadice/${(infoVersioneFirebase).replaceAll('+', '/')}/app-release.apk';

    try {
      final response = await http.head(Uri.parse(downloadUrl));
      if (response.statusCode == HttpStatus.ok) {
        final contentLength = response.headers['content-length'];
        if (contentLength != null) {
          return int.parse(contentLength);
        }
      }
    } catch (error) {
      rethrow;
    }

    return -1; // Ritorno un valore sentinella in caso di errore o mancanza di informazioni
  }

  @override
  // Funzione per scaricare la nuova versione dell'app
  Future<http.ByteStream> scaricaNuovaVersione() async {
    // Estraggo la versione presente su Firebase
    final infoVersioneFirebase = await getVersioneAppFirebase();

    // Recupero la radice dell'URL per download nuova versione app
    final downloadUrlRadice = await getDownloadUrlFirebase();

    // Compongo l'URL da cui scaricare la nuova versione dell'app
    final downloadUrl =
        '$downloadUrlRadice/${(infoVersioneFirebase).replaceAll('+', '/')}/app-release.apk';

    // Definisco la directory per i download
    String directoryDownload = (await getApplicationDocumentsDirectory()).path;
    // Definisco la directory per salvare il file
    File directoryFile = File('$directoryDownload/Pokedex.apk');

    // Definizione URL per richiesta get
    final url = Uri.parse(downloadUrl);

    // Chiamata get per download apk
    final request = http.Request(
      'GET',
      url,
    );

    // Definifione Client
    var httpClient = http.Client();

    // Recupero la risposta alla chiamata
    var response = await httpClient.send(request);

    final stream = response.stream;

    return stream;

    // // Definisco le variabili per controllare il download
    // List<List<int>> chunks = [];
    // int downloaded = 0;
    // int downloadPercentuale = 0;

    // // Dichiaro lo streamcontroller per gestire il download
    // final StreamController<int> _progressController = StreamController<int>();

    // // Inizio la stream per controllare il progresso
    // response.asStream().listen(
    //   (http.StreamedResponse r) {
    //     // Se la chiamata per il download non va buon fine
    //     if (r.statusCode != 200) {
    //       //messaggioErrore(context, aggiornamentoApp);
    //     }
    //     r.stream.listen(
    //       (List<int> chunk) {
    //         // Calcolo la percentuale di download
    //         downloadPercentuale = (downloaded / r.contentLength! * 100).toInt();

    //         // Aggiorno la percentuale
    //         _progressController.add(downloadPercentuale);

    //         chunks.add(chunk);
    //         downloaded += chunk.length;
    //       },
    //       onDone: () async {
    //         // Calcolo la percentuale di download
    //         downloadPercentuale = (downloaded / r.contentLength! * 100).toInt();

    //         // Aggiorno la percentuale
    //         _progressController.add(downloadPercentuale);

    //         // Salvataggio del file
    //         final Uint8List bytes = Uint8List(r.contentLength ?? 0);
    //         int offset = 0;
    //         for (List<int> chunk in chunks) {
    //           bytes.setRange(offset, offset + chunk.length, chunk);
    //           offset += chunk.length;
    //         }
    //         await directoryFile.writeAsBytes(bytes);

    //         _progressController.close();
    //       },
    //     );
    //   },
    // );

    // return _progressController;
  }
}
