import 'package:sample_bloc_architecture/screens/download_app_screen.dart';

import '/screens/spash_screen.dart';
import '/screens/homepage.dart';
import '/screens/pokemon_detail.dart';
import '/screens/search_page.dart';

var routes = {
  SplashScreen.routeName: (ctx) => const SplashScreen(),
  HomePage.routeName: (ctx) => const HomePage(),
  PokemonDetail.routeName: (ctx) => const PokemonDetail(),
  SearchPage.routeName: (ctx) => const SearchPage(),
  DownloadAppSCreen.routeName: (ctx) => const DownloadAppSCreen(),
};
