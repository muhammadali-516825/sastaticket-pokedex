import 'package:sastaticket_pokedex/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:sastaticket_pokedex/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:sastaticket_pokedex/services/app_service/app_service.dart';
import 'package:sastaticket_pokedex/services/crashlytics_service/crashlytics_service.dart';
import 'package:sastaticket_pokedex/services/local_storage_service/local_storage_service.dart';
import 'package:sastaticket_pokedex/services/log_service/log_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DogImageRandomRepository,
  DogImageLocalRepository,
  LogService,
  AppService,
  LocalStorageService,
  CrashlyticsService,

  // TODO(boilerplate): add more dependencies
])
void main() {}
