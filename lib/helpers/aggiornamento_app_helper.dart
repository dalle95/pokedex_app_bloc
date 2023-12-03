import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:logger/logger.dart';
import 'package:open_filex/open_filex.dart';

import '/labels.dart';

class AggiornamentoAppHelper {
  // Funzione per estrarre le informazioni app
  static Future<void> controlloAggiornamenti(
    BuildContext context,
    Function aggiornamentoApp,
    Function aggiornaPercentuale,
  ) async {
    // Per gestire i log
    var logger = Logger();

    // Nel caso in cui la chiamata per il download della nuova versione non va a buon fine avverto l'utente
    Future<void> messaggioErrore(
      BuildContext context,
      Function aggiornamentoApp,
    ) async {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            labels.erroreTitolo,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: Text(
            labels.messaggioAggiornamentoErrore,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                // Setto l'applicazione in aggiornamento
                aggiornamentoApp(false);
                // Chiudo il dialogo
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                labels.conferma,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      );
    }

    // Nel caso le versioni sono diverse mostro il messaggio di aggiornamento app
    Future<bool> messaggioAggiornamento(
      BuildContext context,
      Function aggiornamentoApp,
    ) async {
      bool permessoDiAggiornare = false;
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            labels.aggiornamentoApp,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: Text(
            labels.messaggioAggiornamento,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                // Setto l'applicazione in aggiornamento
                aggiornamentoApp(true);
                permessoDiAggiornare = true;
                // Chiudo il dialogo
                Navigator.of(context).pop(true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                labels.scarica,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      );

      return permessoDiAggiornare;
    }

    // Recupero la versione dell'applicazione
    final infoApp = await PackageInfo.fromPlatform();
    final infoVersioneApp = '${infoApp.version}+${infoApp.buildNumber}';

    // Recupero le remote config di Firebase
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );

    await remoteConfig.fetchAndActivate();

    // Recupero l'ultima versione dell'app settata su Firebase
    final infoVersioneFirebase = remoteConfig.getString('lastAppVersion');

    logger.d(
      'Versione App: $infoVersioneApp\n Versione Firebase: $infoVersioneFirebase',
    );

    // Confronto Versioni in formato stringa
    if (infoVersioneFirebase == infoVersioneApp) {
      aggiornamentoApp(false);
      return;
    }

    bool permessoDiAggiornare = false;

    // Nel caso le versioni sono diverse mostro il messaggio di aggiornamento app
    // ignore: use_build_context_synchronously
    permessoDiAggiornare = await messaggioAggiornamento(
      context,
      aggiornamentoApp,
    );

    // Per continuare controllo se è stato dato il permesso per scaricare la nuova versione
    if (permessoDiAggiornare == false) {
      // Aggiorno la percentuale nella homepage
      aggiornamentoApp(false);
      return;
    }

    // Recupero la radice dell'URL per download nuova versione app
    final downloadUrlRadice = remoteConfig.getString('downloadUrl');

    final downloadUrl =
        '$downloadUrlRadice/${(infoVersioneFirebase).replaceAll('+', '/')}/app-release.apk';

    logger.d(downloadUrl);

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
    var response = httpClient.send(request);

    // Definisco la directory per i download
    String directoryDownload = (await getApplicationDocumentsDirectory()).path;
    // Definisco la directory per salvare il file
    File directoryFile = File('$directoryDownload/Pokedex.apk');

    // Definisco le variabili per controllare il download
    List<List<int>> chunks = [];
    int downloaded = 0;
    double downloadPercentuale = 0;

    // Inizio la stream per controllare il progresso
    response.asStream().listen(
      (http.StreamedResponse r) {
        // Se la chiamata per il download non va buon fine
        if (r.statusCode != 200) {
          messaggioErrore(context, aggiornamentoApp);
        }
        r.stream.listen(
          (List<int> chunk) {
            // Calcolo la percentuale di download
            downloadPercentuale =
                num.parse((r.contentLength ?? 0).toString()) == 0
                    ? 0
                    : downloaded / num.parse((r.contentLength ?? 0).toString());

            // Aggiorno la percentuale nella homepage
            aggiornaPercentuale(downloadPercentuale);

            chunks.add(chunk);
            downloaded += chunk.length;
          },
          onDone: () async {
            // Calcolo la percentuale di download
            downloadPercentuale =
                num.parse((r.contentLength ?? 0).toString()) == 0
                    ? 0
                    : downloaded / num.parse((r.contentLength ?? 0).toString());

            // Aggiorno la percentuale nella homepage
            aggiornaPercentuale(downloadPercentuale);

            // Salvataggio del file
            final Uint8List bytes = Uint8List(r.contentLength ?? 0);
            int offset = 0;
            for (List<int> chunk in chunks) {
              bytes.setRange(offset, offset + chunk.length, chunk);
              offset += chunk.length;
            }
            await directoryFile.writeAsBytes(bytes);

            logger.d(directoryFile.path);
            // Apro il file per installarlo
            OpenFilex.open(directoryFile.path);
          },
        );
      },
    );
  }
}
