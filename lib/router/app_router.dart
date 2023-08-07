import 'package:sastaticket_pokedex/features/app/view/app_director.dart';
import 'package:sastaticket_pokedex/features/demo/view/assets_page.dart';
import 'package:sastaticket_pokedex/features/demo/view/images_from_db_page.dart';
import 'package:sastaticket_pokedex/features/home/home_page.dart';
import 'package:sastaticket_pokedex/features/pokemons_listing/view/pokemon_species_listing_page.dart';
import 'package:sastaticket_pokedex/features/setting/setting_page.dart';
import 'package:sastaticket_pokedex/generated/l10n.dart';
import 'package:sastaticket_pokedex/widgets/error_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String homeNamed = 'home';
  static const String homePath = '/';

  static const String settingNamed = 'setting';
  static const String settingPath = '/setting';

  static const String signInNamed = 'signIn';
  static const String signInPath = '/signIn';

  static const String signUpNamed = 'signUp';
  static const String signUpPath = '/signUp';

  static const String assetsNamed = 'assets';
  static const String assetsPath = '/assets';

  static const String pokemonListingNamed = 'dogImageRandom';
  static const String pokemonListingPath = '/dogImageRandom';

  static const String imagesFromDbNamed = 'imagesFromDb';
  static const String imagesFromDbPath = '/imagesFromDb';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: appDirector,
        path: appDirectorPath,
        builder: (context, state) {
          return const AppDirector();
        },
      ),
      GoRoute(
        name: homeNamed,
        path: homePath,
        builder: (context, state) => const PokemonListingPage(),
      ),
      GoRoute(
        name: settingNamed,
        path: settingPath,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        name: assetsNamed,
        path: assetsPath,
        builder: (context, state) => const AssetsPage(),
      ),
      GoRoute(
        name: pokemonListingNamed,
        path: pokemonListingPath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: imagesFromDbNamed,
        path: imagesFromDbPath,
        builder: (context, state) {
          if (!kIsWeb) {
            return const ImagesFromDbPage();
          }

          return ErrorPage(
            content: S.current.didnt_supported,
          );
        },
      ),
    ],
  );
}
