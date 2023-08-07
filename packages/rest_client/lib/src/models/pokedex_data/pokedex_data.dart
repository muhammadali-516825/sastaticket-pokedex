import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_client/src/models/pokemon_species/pokemon_species.dart';

part 'pokedex_data.freezed.dart';
part 'pokedex_data.g.dart';

/// Image dog data
@Freezed(fromJson: true)
class PokedexData with _$PokedexData {
  ///
  const factory PokedexData({
    required String name,
    @JsonKey(name: "pokemon_species")
    required List<PokemonSpecies> species,
  }) = _PokedexData;

  ///
  factory PokedexData.fromJson(Map<String, dynamic> json) =>
      _$PokedexDataFromJson(json);
}
