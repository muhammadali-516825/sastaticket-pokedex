import 'package:sastaticket_pokedex/injector/injector.dart';
import 'package:sastaticket_pokedex/injector/modules/dio_module.dart';
import 'package:rest_client/rest_client.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<PokedexApiClient>(
      () => PokedexApiClient(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
  }
}
