import 'package:dio/dio.dart';
import 'package:rest_client/rest_client.dart';
import 'package:rest_client/src/models/pokedex_data/pokedex_data.dart';
import 'package:retrofit/retrofit.dart';

part 'pokedex_api.g.dart';

///
@RestApi()
abstract class PokedexApiClient {
  /// Constructor
  factory PokedexApiClient(Dio dio, {String baseUrl}) = _PokedexApiClient;

  /// Get Pokemon list by shape that has tentacles
  @GET('/pokemon-shape/tentacles')
  Future<PokedexData> getPokemonsByShape();

  /// Get Pokemon details by id
  @GET('/pokemon-species/{id}')
  Future<Pokemon> getPokemonDetails(
      @Path() String id,
      );
}
