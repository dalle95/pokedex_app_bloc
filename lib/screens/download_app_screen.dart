import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sample_bloc_architecture/blocs/download_app/download_app_blocs.dart';
import 'package:sample_bloc_architecture/blocs/download_app/download_app_events.dart';
import 'package:sample_bloc_architecture/blocs/download_app/download_app_states.dart';
import 'package:sample_bloc_architecture/screens/homepage.dart';
import 'package:sample_bloc_architecture/ui/widgets/download_app/donwload_nuova_versione.dart';
import 'package:sample_bloc_architecture/ui/widgets/vario/loading_view.dart';

Logger logger = Logger();

class DownloadAppSCreen extends StatefulWidget {
  static const routeName = '/download-app';

  const DownloadAppSCreen({super.key});

  @override
  State<DownloadAppSCreen> createState() => _DownloadAppSCreenState();
}

class _DownloadAppSCreenState extends State<DownloadAppSCreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadBloc()..add(const StartDownloadEvent()),
      child: Builder(
        builder: (providerContext) {
          return BlocConsumer<DownloadBloc, DownloadState>(
            bloc: BlocProvider.of<DownloadBloc>(providerContext),
            listener: (BuildContext context, DownloadState state) async {
              // Download compleatato
              if (state is DownloadCompleteState) {
                // Definisco la directory per i download
                String directoryDownload =
                    (await getApplicationDocumentsDirectory()).path;
                // Definisco la directory per salvare il file
                File directoryFile = File('$directoryDownload/Pokedex.apk');

                // Apro il file per installarlo
                OpenFilex.open(directoryFile.path);
              }
            },
            builder: (context, state) {
              // Preparazione download
              if (state is DownloadInitState) {
                return const Scaffold(
                  body: LoadingView(),
                );
              }
              // Errore del download
              if (state is DownloadErrorState) {
                return Scaffold(
                  body: Center(
                    child: Text(state.error),
                  ),
                );
              }
              // Download in corso
              if (state is DownloadInProgressState) {
                return Scaffold(
                  body: DownloadNuovaVersioneApp(
                    percentuale: state.percentuale,
                  ),
                );
              }
              // Download compleatato
              if (state is DownloadCompleteState) {
                return Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  body: Center(
                    child: Container(
                      height: 200,
                      width: 350,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Torna in Homepage',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 18),
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    HomePage.routeName,
                                  );
                                },
                                child: const Text('Conferma'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              // Default
              return Scaffold(
                body: Center(
                  child: Text(
                    state.toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
