class AppConfig {
  static String baseUrl = '';

  static const String defaultLocale = 'en';

  static void configDev() {
    baseUrl = 'https://pokeapi.co/api/v2';
  }

  static void configTest() {
    // TODO(Pokedex): flavoring
  }

  static void configProduction() {
    // TODO(Pokedex): flavoring
  }
}
