<div align="center">
<a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"/></a>

</div>


## Features

* State management and examples
* Api integration and examples
* Local database and examples
* Code generation
* Local storage
* Logging
* Routing
* Dependency Injection
* Crashlytics template
* DarkTheme
* Multi languages
* Unit tests
* Integration test
* Clean architecture
* Flutter CI

Some packages: 
  - [Freezed](https://pub.dev/packages/freezed)
  - [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
  - [Flutter gen](https://pub.dev/packages/flutter_gen)
  - [Retrofit](https://pub.dev/packages/retrofit)
  - [Dio](https://pub.dev/packages/retrofit)
  - [Bloc test](https://pub.dev/packages/bloc_test) 
  - [Mockito](https://pub.dev/packages/mockito)
  - [Go router](https://pub.dev/packages/go_router)
  - [Dependency Injection](https://github.com/fluttercommunity/get_it)
  - [Logger](https://pub.dev/packages/logger)
  - [Floor](https://pub.dev/packages/floor)
  - [SharedPreferences](https://pub.dev/packages/shared_preferences)



## Folder structure
```
flutter_boilerplate/
|- assets/                    (assets)
|- lib/
  |- configs/                 (flavor config)
  |- core/                    (bloc observer, theme,...)
  |- data/                    (repository)
  |- features/                (features page)
  |- generated/               (code generation includes localization and assets generation)
  |- injector/                (dependencies injector)
  |- l10n/                    (localization resources
  |- router/                  (routing)
  |- services/                (app services)
  |- utils/                   (app utils)
|- packages/
  |- rest_client/             (api client)
  |- local_database/          (local database)
|- integration_test
|- test/
  |- dependencies/                (mock dependencies)
  |- features/                (bloc test features)

```

## [Freezed](https://pub.dev/packages/freezed): 
### Create a immutable Model with any features available
- Define a `constructor` + the `properties`
- Override `toString`, operator `==`, hashCode
- Implement a `copyWith` method to clone the object
- Handling `de/serialization`


## [Retrofit]((https://pub.dev/packages/retrofit)):
### Create a api client by code generation, you do not need to implement each request manually


## Mockito and Bloc tests:
If a bloc that you want to test have a required dependencies, you must add it into annotations `@GenerateMocks` in `/test/app_test/app_test.dart`:

Run the following command to generate a mock dependency
```cmd
flutter pub run build_runner build --delete-conflicting-outputs
```

## If you want to understand architecture or any packages used in this project, you can create a discussion on github repo.
## And feel free to create a pull request !





