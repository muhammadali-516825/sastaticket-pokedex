import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_client/src/models/models.dart';

part 'pokemon_species.freezed.dart';
part 'pokemon_species.g.dart';

/// Image dog data
@Freezed(fromJson: true)
class PokemonSpecies with _$PokemonSpecies {
  ///
  const factory PokemonSpecies({
    required String name,
    required String url,
    Pokemon? pokemon,

  }) = _PokemonSpecies;

  ///
  factory PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesFromJson(json);
}
