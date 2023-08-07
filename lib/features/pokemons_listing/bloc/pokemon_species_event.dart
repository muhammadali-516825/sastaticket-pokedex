part of 'pokemon_species_bloc.dart';

@Freezed()
class PokemonSpeciesEvent with _$PokemonSpeciesEvent {
  const factory PokemonSpeciesEvent.loaded() = _Loaded;

  const factory PokemonSpeciesEvent.randomRequested({
    @Default(false) bool insertDb,
  }) = _RandomRequested;

  const factory PokemonSpeciesEvent.favouriteMarked({
    @Default(PokemonSpecies(name: 'name', url: 'url')) PokemonSpecies pokemonSpecies,
  }) = _FavouriteMarked;

  const factory PokemonSpeciesEvent.pokemonSelected({
    @Default(PokemonSpecies(name: 'name', url: 'url')) PokemonSpecies pokemonSpecies,
  }) = _PokemonSelected;
}

