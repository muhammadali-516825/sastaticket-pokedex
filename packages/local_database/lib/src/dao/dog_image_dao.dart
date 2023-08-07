import 'package:floor/floor.dart';
import 'package:local_database/src/entities/dog_image_entity.dart';

@dao
abstract class DogImageDao {
  @Query('SELECT * FROM PokemonSpeciesEntity')
  Future<List<PokemonSpeciesEntity>> findAllDogImages();

  @insert
  Future<void> insertPokemonSpecies(PokemonSpeciesEntity dogImageEntity);

  @delete
  Future<void> deleteDogImage(PokemonSpeciesEntity dogImageEntity);
}
