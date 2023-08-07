// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokedex_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokedexData _$PokedexDataFromJson(Map<String, dynamic> json) {
  return _PokedexData.fromJson(json);
}

/// @nodoc
mixin _$PokedexData {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "pokemon_species")
  List<PokemonSpecies> get species => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokedexDataCopyWith<PokedexData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokedexDataCopyWith<$Res> {
  factory $PokedexDataCopyWith(
          PokedexData value, $Res Function(PokedexData) then) =
      _$PokedexDataCopyWithImpl<$Res, PokedexData>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: "pokemon_species") List<PokemonSpecies> species});
}

/// @nodoc
class _$PokedexDataCopyWithImpl<$Res, $Val extends PokedexData>
    implements $PokedexDataCopyWith<$Res> {
  _$PokedexDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? species = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as List<PokemonSpecies>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokedexDataCopyWith<$Res>
    implements $PokedexDataCopyWith<$Res> {
  factory _$$_PokedexDataCopyWith(
          _$_PokedexData value, $Res Function(_$_PokedexData) then) =
      __$$_PokedexDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: "pokemon_species") List<PokemonSpecies> species});
}

/// @nodoc
class __$$_PokedexDataCopyWithImpl<$Res>
    extends _$PokedexDataCopyWithImpl<$Res, _$_PokedexData>
    implements _$$_PokedexDataCopyWith<$Res> {
  __$$_PokedexDataCopyWithImpl(
      _$_PokedexData _value, $Res Function(_$_PokedexData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? species = null,
  }) {
    return _then(_$_PokedexData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value._species
          : species // ignore: cast_nullable_to_non_nullable
              as List<PokemonSpecies>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokedexData implements _PokedexData {
  const _$_PokedexData(
      {required this.name,
      @JsonKey(name: "pokemon_species")
      required final List<PokemonSpecies> species})
      : _species = species;

  factory _$_PokedexData.fromJson(Map<String, dynamic> json) =>
      _$$_PokedexDataFromJson(json);

  @override
  final String name;
  final List<PokemonSpecies> _species;
  @override
  @JsonKey(name: "pokemon_species")
  List<PokemonSpecies> get species {
    if (_species is EqualUnmodifiableListView) return _species;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_species);
  }

  @override
  String toString() {
    return 'PokedexData(name: $name, species: $species)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokedexData &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._species, _species));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_species));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokedexDataCopyWith<_$_PokedexData> get copyWith =>
      __$$_PokedexDataCopyWithImpl<_$_PokedexData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokedexDataToJson(
      this,
    );
  }
}

abstract class _PokedexData implements PokedexData {
  const factory _PokedexData(
      {required final String name,
      @JsonKey(name: "pokemon_species")
      required final List<PokemonSpecies> species}) = _$_PokedexData;

  factory _PokedexData.fromJson(Map<String, dynamic> json) =
      _$_PokedexData.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: "pokemon_species")
  List<PokemonSpecies> get species;
  @override
  @JsonKey(ignore: true)
  _$$_PokedexDataCopyWith<_$_PokedexData> get copyWith =>
      throw _privateConstructorUsedError;
}
