import 'package:local_database/local_database.dart';

abstract class DogImageLocalRepository {
  /// Local
  Future<void> insertDogImageDB(PokemonSpeciesEntity pokemonSpeciesEntity);

  Future<List<PokemonSpeciesEntity>> getDogImagesFromDB();

  Future<void> deleteDogImageDB(PokemonSpeciesEntity dogImageEntity);
}
