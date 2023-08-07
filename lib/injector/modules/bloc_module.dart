import 'package:sastaticket_pokedex/features/app/bloc/app_bloc.dart';
import 'package:sastaticket_pokedex/features/demo/bloc/demo_bloc.dart';
import 'package:sastaticket_pokedex/features/pokemons_listing/bloc/pokemon_species_bloc.dart';
import 'package:sastaticket_pokedex/injector/injector.dart';
import 'package:flutter/foundation.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector
      ..registerLazySingleton<AppBloc>(
        () => AppBloc(
          appService: injector(),
          logService: injector(),
        ),
      )
      ..registerFactory<PokemonSpeciesBloc>(
        () => PokemonSpeciesBloc(
          dogImageRandomRepository: injector(),
          dogImageLocalRepository: kIsWeb ? null : injector(),
          logService: injector(),
        ),
      )
      ..registerFactory<DemoBloc>(
        () => DemoBloc(
          dogImageRandomRepository: injector(),
          logService: injector(),
        ),
      );
  }
}
