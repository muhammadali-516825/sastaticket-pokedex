import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

/// Image dog data
@Freezed(fromJson: true)
class Pokemon with _$Pokemon {
  ///
  const factory Pokemon({
    required String name,
    required int id,
  }) = _Pokemon;

  ///
  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
