import 'dart:async';
import 'package:sastaticket_pokedex/core/bloc_core/ui_status.dart';
import 'package:sastaticket_pokedex/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:sastaticket_pokedex/generated/l10n.dart';
import 'package:sastaticket_pokedex/services/log_service/log_service.dart';
import 'package:sastaticket_pokedex/utils/mapper_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

part 'demo_event.dart';
part 'demo_state.dart';
part 'demo_bloc.freezed.dart';
part 'demo_notification.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc({
    required LogService logService,
    required DogImageLocalRepository dogImageRandomRepository,
  }) : super(const DemoState()) {
    _repository = dogImageRandomRepository;
    _logService = logService;
    on<_LoadImageFromDB>(_onImagesLoadFromDB);
    on<_DeleteImageFromDB>(_onDeleteImageFromDB);
  }

  late final DogImageLocalRepository _repository;
  late final LogService _logService;

  FutureOr<void> _onImagesLoadFromDB(
    _LoadImageFromDB event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: const UILoading(),
        ),
      );

      final List<PokemonSpeciesEntity> imageEntities =
          await _repository.getDogImagesFromDB();

      final List<PokemonSpecies> pokemonList =
          imageEntities.map(MapperUtils.mapDogImageEntity).toList();

      emit(
        state.copyWith(
          status: const UILoadSuccess(),
          pokemonList: pokemonList,
        ),
      );
    } catch (e, s) {
      _logService.e('DemoLoadImageFromDB failed', e, s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }

  FutureOr<void> _onDeleteImageFromDB(
    _DeleteImageFromDB event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isBusy: true,
        ),
      );

      await _repository
          .deleteDogImageDB(MapperUtils.mapDogImage(PokemonSpecies(name: 'name', url: 'url')));

      final List<PokemonSpecies> pokemonList = List.from(state.pokemonList)
        ..removeWhere((element) => element.name == event.pokemonSpecies.name);

      emit(
        state.copyWith(
          notification:
              _NotificationInsertSuccess(message: S.current.delete_success),
          pokemonList: pokemonList,
          isBusy: false,
        ),
      );
    } catch (e, s) {
      _logService.e('DemoLoadImageFromDB failed', e, s);
      emit(
        state.copyWith(
          notification: _NotificationInsertFailed(message: e.toString()),
          isBusy: false,
        ),
      );
    }
  }
}
