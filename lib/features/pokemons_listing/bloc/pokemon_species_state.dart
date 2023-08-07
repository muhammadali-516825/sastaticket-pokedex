part of 'pokemon_species_bloc.dart';

@Freezed()
class PokemonSpeciesState with _$PokemonSpeciesState {
  const factory PokemonSpeciesState({
    @Default(UIInitial()) UIStatus status,
    PokemonSpeciesListingNotification? notification,
    @Default(PokedexData(name: '', species: [])) PokedexData pokedexData,
    @Default([]) List<Pokemon> pokemonList,
    @Default(Pokemon(name: 'name', id: 0)) Pokemon pokemonSelected,
    @Default(false) bool isBusy,
    @Default(UIInitial()) UIStatus statusPokemonSelected,
  }) =  _PokemonSpeciesState;
}
