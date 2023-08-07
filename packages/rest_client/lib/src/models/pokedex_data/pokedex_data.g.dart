// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokedexData _$$_PokedexDataFromJson(Map<String, dynamic> json) =>
    _$_PokedexData(
      name: json['name'] as String,
      species: (json['pokemon_species'] as List<dynamic>)
          .map((e) => PokemonSpecies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokedexDataToJson(_$_PokedexData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pokemon_species': instance.species,
    };
