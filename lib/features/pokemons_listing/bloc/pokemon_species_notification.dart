part of 'pokemon_species_bloc.dart';

@Freezed(equal: false)
class PokemonSpeciesListingNotification with _$PokemonSpeciesListingNotification {
  factory PokemonSpeciesListingNotification.notifySuccess({
    required String message,
  }) = _NotificationNotifySuccess;

  factory PokemonSpeciesListingNotification.notifyFailed({
    required String message,
  }) = _NotificationNotifyFailed;
}
