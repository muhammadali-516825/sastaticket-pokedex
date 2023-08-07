import 'package:sastaticket_pokedex/bootstrap.dart';
import 'package:sastaticket_pokedex/configs/app_config.dart';
import 'package:sastaticket_pokedex/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await bootstrap(
    firebaseInitialization: () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    },
    flavorConfiguration: () async {
      AppConfig.configDev();
    },
  );
}
