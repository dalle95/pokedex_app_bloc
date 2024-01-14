import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:sample_bloc_architecture/screens/download_app_screen.dart';

import '/blocs/check_and_validate_download.dart/check_and_validate_download_bloc.dart';
import '/blocs/check_and_validate_download.dart/check_and_validate_download_events.dart';
import '/blocs/check_and_validate_download.dart/check_and_validate_download_states.dart';

import '/screens/homepage.dart';

import '/ui/widgets/pokemon_list/homepage_view.dart';
import '/ui/widgets/vario/loading_view.dart';

Logger logger = Logger();

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CheckAndValidateBloc()..add(const CheckForUpdateEvent()),
      child: Builder(
        builder: (providerContext) {
          return BlocConsumer<CheckAndValidateBloc, CheckAndValidateState>(
            bloc: BlocProvider.of<CheckAndValidateBloc>(providerContext),
            listener: (BuildContext context, CheckAndValidateState state) {
              // Se è stato concesso il permesso per il download
              if (state is ValidateDownloadState) {
                Navigator.of(context).pushReplacementNamed(
                  DownloadAppSCreen.routeName,
                );
              }
              // Se è stato concesso il permesso per il download
              if (state is RefuseDownloadState) {
                Navigator.of(context).pushReplacementNamed(
                  HomePage.routeName,
                );
              }
            },
            builder: (context, state) {
              // Controllo presenza nuova versione
              if (state is CheckDownloadState) {
                return const Scaffold(
                  body: LoadingView(),
                );
              }
              // Nessuna nuova versione da scaricare
              if (state is NoUpdateState) {
                return const HomepageView(
                  categoria: 'pokemon',
                  id: '',
                );
              }
              // Errore durante il controllo della nuova versione da scaricare
              if (state is ErrorCheckDownloadState) {
                return const HomepageView(
                  categoria: 'pokemon',
                  id: '',
                );
              }

              // Nuova versione da scaricare, attesa permesso per far partire il download della nuova versione
              if (state is CheckValidationDownloadState) {
                return Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  body: Center(
                    child: Container(
                      height: 300,
                      width: 350,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'È presente una nuova versione dell\'app.\nEseguire il download della nuova versione?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 20),
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
                                  context
                                      .read<CheckAndValidateBloc>()
                                      .add(const ValidateDownloadEvent());
                                },
                                child: const Text('Conferma'),
                              ),
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
                                  context
                                      .read<CheckAndValidateBloc>()
                                      .add(const RefuseDownloadEvent());
                                },
                                child: const Text('Salta'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              // Permesso Download concesso
              if (state is ValidateDownloadState) {
                return const Scaffold(
                  body: Center(
                    child: Text('Permesso download convalidato'),
                  ),
                );
              }
              // Permesso Download Non concesso
              if (state is RefuseDownloadState) {
                return const Scaffold(
                  body: Center(
                    child: Text('Permesso download non convalidato'),
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
