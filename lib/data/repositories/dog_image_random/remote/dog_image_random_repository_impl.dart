import 'package:sastaticket_pokedex/core/exceptions/api_exception.dart';
import 'package:sastaticket_pokedex/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:rest_client/rest_client.dart';

class DogImageRandomRepositoryImpl implements DogImageRandomRepository {
  DogImageRandomRepositoryImpl({
    required PokedexApiClient dogApiClient,
  }) : _dogApiClient = dogApiClient;

  late final PokedexApiClient _dogApiClient;

  /// Remote
  @override
  Future<PokedexData> getDogImageRandom() async {
    return _dogApiClient.getPokemonsByShape().onApiError;
  }

  @override
  Future<Pokemon> getPokemonDetails(String id) {
    return _dogApiClient.getPokemonDetails(id).onApiError;
  }
}
