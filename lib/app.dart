import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/repositories/pokemon_list/pokemon_list_repos.dart';
import '/routes/routes.dart';
import '/screens/spash_screen.dart';

// Toggle this for testing Crashlytics in your app locally.
const _kTestingCrashlytics = true;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define an async function to initialize FlutterFire
  Future<void> _initializeFlutterFire() async {
    if (_kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      // You could additionally extend this to allow users to opt-in.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeFlutterFire();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pokemon Main Solid',
            color: Color.fromRGBO(254, 202, 27, 1),
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Pokemon GB',
          ),
          bodyLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pokemon GB',
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(139, 0, 0, 1),
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Pokemon GB',
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            fontFamily: 'Pokemon GB',
          ),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromRGBO(139, 0, 0, 1)),
        useMaterial3: true,
      ),
      routes: routes,
      home: RepositoryProvider(
        create: (context) => PokemonListRepository(),
        child: const SplashScreen(),
      ),
    );
  }
}
