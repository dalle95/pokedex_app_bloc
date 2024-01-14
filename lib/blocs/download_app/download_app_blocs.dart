import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '/blocs/download_app/download_app_events.dart';
import '/blocs/download_app/download_app_states.dart';

import '/repositories/download_app/download_app_repos_imp.dart';

// BLoC per gestire il download
class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  // Gestione dei log
  var logger = Logger();

  final _downloadAppRepos = DownloadAppRepositoryImp();

  DownloadBloc() : super(const DownloadInitState());

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    yield* event.when(
      startDownload: () async* {
        try {
          // Estrazione grandezza file di download
          var downloadSize = await _downloadAppRepos.getFileSize();

          // Controllo la percentuale di download della nuova versione
          var stream = await _downloadAppRepos.scaricaNuovaVersione();

          // Variabili per gestire l'avanzamento del download
          int downloaded = 0;
          int downloadPercentuale = 0;

          // Avanzamento del download
          await for (var data in stream!) {
            downloadPercentuale = (downloaded / downloadSize * 100).toInt();

            // Ascolta lo stream dell'avanzamento download
            yield DownloadInProgressState(downloadPercentuale);

            downloaded += data.length;
          }

          logger.d('Download Completato');

          // Ascolta lo stream dell'avanzamento download
          yield const DownloadCompleteState();

          // // Definisco la directory per i download
          // String directoryDownload =
          //     (await getApplicationDocumentsDirectory()).path;
          // // Definisco la directory per salvare il file
          // File directoryFile = File('$directoryDownload/Pokedex.apk');

          // // Apro il file per installarlo
          // OpenFilex.open(directoryFile.path);
          // Al termine del download, restituisco lo stato di completamento con il file
          //yield const DownloadCompleteState();
        } catch (e) {
          logger.d(e);
          yield DownloadErrorState('Errore durante il download: $e');
        }
      },
    );
  }
}
