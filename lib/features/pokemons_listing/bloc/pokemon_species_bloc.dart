import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:sastaticket_pokedex/core/bloc_core/ui_status.dart';
import 'package:sastaticket_pokedex/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:sastaticket_pokedex/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:sastaticket_pokedex/services/log_service/log_service.dart';
import 'package:sastaticket_pokedex/utils/mapper_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

part 'pokemon_species_event.dart';
part 'pokemon_species_state.dart';
part 'pokemon_species_notification.dart';
part 'pokemon_species_bloc.freezed.dart';

class PokemonSpeciesBloc
    extends Bloc<PokemonSpeciesEvent, PokemonSpeciesState> {
  PokemonSpeciesBloc({
    required DogImageRandomRepository dogImageRandomRepository,
    required LogService logService,
    DogImageLocalRepository? dogImageLocalRepository,
  }) : super(
          const PokemonSpeciesState(),
        ) {
    _repository = dogImageRandomRepository;
    _localRepository = dogImageLocalRepository;
    _log = logService;
    on<_Loaded>(_onLoaded);
    on<_RandomRequested>(_onRandom, transformer: droppable());
    on<_FavouriteMarked>(_onFavouriteMarked, transformer: droppable());
    on<_PokemonSelected>(_onPokemonSelected, transformer: droppable());
  }

  late final DogImageRandomRepository _repository;
  late final DogImageLocalRepository? _localRepository;
  late final LogService _log;

  FutureOr<void> _onLoaded(
    _Loaded event,
    Emitter<PokemonSpeciesState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          status: const UILoading(),
        ),
      );

      emit(
        state.copyWith(
          status: const UILoadSuccess(),
        ),
      );
    } catch (e, s) {
      _log.e('PokemonListingLoaded failed', e, s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }

  FutureOr<void> _onRandom(
    _RandomRequested event,
    Emitter<PokemonSpeciesState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isBusy: true,
        ),
      );

     PokedexData pokedexData = await _repository.getDogImageRandom();

     List<Pokemon> pokemonList = [];
     /*List<PokemonSpecies> pokemonSpeciesList = [];
      for (var speciesElement in pokedexData.species) {
        final urlSplits = speciesElement.url.split('/');
        final Pokemon pokemon = await _repository.getPokemonDetails(urlSplits[urlSplits.length-2]);
        pokemonList.add(pokemon);
      }*/

      emit(
        state.copyWith(
          isBusy: false,
          status: const UILoadSuccess(),
          pokedexData: pokedexData,
         // pokemonList: pokemonList
        ),
      );
    } catch (e, s) {
      _log.e('PokedexData loading failed', e, s);
      emit(
        state.copyWith(
          isBusy: false,
          notification: _NotificationNotifyFailed(
            message: e.toString(),
          ),
        ),
      );
    }
  }

  FutureOr<void> _onFavouriteMarked(
      _FavouriteMarked event,
      Emitter<PokemonSpeciesState> emit,
      ) async {
    try {
      emit(
        state.copyWith(
          isBusy: true,
        ),
      );

      if (!kIsWeb && _localRepository != null) {
        final PokemonSpeciesEntity entity =
        MapperUtils.mapDogImage(event.pokemonSpecies);
        await _localRepository!.insertDogImageDB(entity);
      }

      emit(
        state.copyWith(
          isBusy: false,
          status: const UILoadSuccess(),
          notification: _NotificationNotifySuccess(message: "${event.pokemonSpecies.name} added to favourites")
        ),
      );
    } catch (e, s) {
      _log.e('DogImageRandomLoaded failed', e, s);
      emit(
        state.copyWith(
          isBusy: false,
          notification: _NotificationNotifyFailed(
            message: e.toString(),
          ),
        ),
      );
    }
  }

  FutureOr<void> _onPokemonSelected(
      _PokemonSelected event,
      Emitter<PokemonSpeciesState> emit,
      ) async {
    try {
      emit(
        state.copyWith(
          isBusy: true,
        ),
      );

      final urlSplits = event.pokemonSpecies.url.split('/');
      final Pokemon pokemon = await _repository.getPokemonDetails(urlSplits[urlSplits.length-2]);

      emit(
        state.copyWith(
            isBusy: false,
            statusPokemonSelected: const UILoadSuccess(),
          pokemonSelected: pokemon,
          notification: _NotificationNotifySuccess(message: 'pokemon details loaded'),
        ),
      );
    } catch (e, s) {
      _log.e('', e, s);
      emit(
        state.copyWith(
          isBusy: false,
          notification: _NotificationNotifyFailed(
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
