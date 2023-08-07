import 'package:floor/floor.dart';
import 'package:rest_client/rest_client.dart';

@entity
class PokemonSpeciesEntity {
  @primaryKey
  final String name;

  final String url;

  PokemonSpeciesEntity(this.name, this.url);
}
