import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:store/data/repositories/authentication/authentication_repository.dart';
import 'package:store/features/card/controllers/card_controller.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/shop/controllers/category_controller.dart';
import 'package:store/firebase_options.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // GetX Local storage
  await GetStorage.init();

  // Await native splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Todo: Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //Todo: Initialize Authentication
  //Todo: Initialize Notification

  //initialize user controller
  // Register UserController

  Get.put(UserController());
  // Register CategoryController
  Get.put(CategoryController());
  Get.put(CardController());

  runApp(const App());
}
