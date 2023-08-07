// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonSpecies _$$_PokemonSpeciesFromJson(Map<String, dynamic> json) =>
    _$_PokemonSpecies(
      name: json['name'] as String,
      url: json['url'] as String,
      pokemon: json['pokemon'] == null
          ? null
          : Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PokemonSpeciesToJson(_$_PokemonSpecies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'pokemon': instance.pokemon,
    };
