import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rest_client/rest_client.dart';

void main() {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '',
    ),
  );

  final PokedexApiClient dogApiClient = PokedexApiClient(dio);

  test('test', () async {
    final dogImage = await dogApiClient.getPokemonsByShape();

    expect(dogImage.toString(), isNotEmpty);
  });
}
