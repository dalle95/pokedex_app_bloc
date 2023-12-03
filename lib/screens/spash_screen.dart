import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '/helpers/aggiornamento_app_helper.dart';

import '/ui/widgets/donwload_nuova_versione.dart';
import '/ui/widgets/loading_view.dart';
import '/ui/widgets/homepage_view.dart';

Logger logger = Logger();

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAggiornamentoApp = false;
  bool _splashScreen = true;
  double _percentuale = 0;

  @override
  void initState() {
    // Funzione che scatta dopo la prima build della homepage
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => AggiornamentoAppHelper.controlloAggiornamenti(
        context,
        _aggiornamentoApp,
        _aggiornaPercentuale,
      ),
    );

    super.initState();
  }

  // Funzione per aggiornare la percentuale dell'app
  void _aggiornaPercentuale(double percentuale) {
    setState(
      () {
        _percentuale = percentuale;
        if (percentuale == 1) {
          _isAggiornamentoApp = false;
        }
      },
    );
  }

  // Funzione per sapere se l'app è in aggiornamento
  void _aggiornamentoApp(bool inAggiornamento) {
    setState(
      () {
        _isAggiornamentoApp = inAggiornamento;
        _splashScreen = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _splashScreen
        ? const Scaffold(
            body: LoadingView(),
          )
        : _isAggiornamentoApp
            ? DownloadNuovaVersioneApp(
                percentuale: _percentuale,
              )
            : const HomepageView(
                categoria: 'pokemon',
                id: '',
              );
  }
}
