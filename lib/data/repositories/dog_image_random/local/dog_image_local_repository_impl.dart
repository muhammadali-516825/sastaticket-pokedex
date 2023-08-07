import 'package:sastaticket_pokedex/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:local_database/local_database.dart';

class DogImageLocalRepositoryImpl implements DogImageLocalRepository {
  DogImageLocalRepositoryImpl({
    required AppDatabaseManager appDatabaseManager,
  }) : _appDatabaseManager = appDatabaseManager;

  late final AppDatabaseManager _appDatabaseManager;

  /// Local
  @override
  Future<void> insertDogImageDB(PokemonSpeciesEntity pokemonSpeciesEntity) async {
    final DogImageDao dao = await _appDatabaseManager.dogImageDao;
    await dao.insertPokemonSpecies(pokemonSpeciesEntity);
  }

  @override
  Future<List<PokemonSpeciesEntity>> getDogImagesFromDB() async {
    final DogImageDao dao = await _appDatabaseManager.dogImageDao;
    return dao.findAllDogImages();
  }

  @override
  Future<void> deleteDogImageDB(PokemonSpeciesEntity dogImageEntity) async {
    final DogImageDao dao = await _appDatabaseManager.dogImageDao;
    return dao.deleteDogImage(dogImageEntity);
  }
}
