import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

class MapperUtils {
  MapperUtils._();

  static PokemonSpeciesEntity mapDogImage(PokemonSpecies pokemonSpecies) {
    return PokemonSpeciesEntity(
      pokemonSpecies.name,
      pokemonSpecies.url,
    );
  }

  static PokemonSpecies mapDogImageEntity(PokemonSpeciesEntity pokemonSpeciesEntity) {
    return PokemonSpecies(
      name: pokemonSpeciesEntity.name,
      url: pokemonSpeciesEntity.url,
    );
  }
}
