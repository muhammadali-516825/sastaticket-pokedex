import 'package:rest_client/rest_client.dart';

abstract class DogImageRandomRepository {
  /// Remote
  Future<PokedexData> getDogImageRandom();
  Future<Pokemon> getPokemonDetails(String id);
}
