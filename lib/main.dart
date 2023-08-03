import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/app/my_app.dart';
import 'package:foodordering/app/my_app_controller.dart';
import 'package:foodordering/core/data/repositories/shared_prefreance_repository.dart';
import 'package:foodordering/core/services/cart_service.dart';
import 'package:foodordering/core/services/connectivity_service.dart';
import 'package:foodordering/core/services/location_service.dart';
import 'package:foodordering/firebase_options.dart';
import 'package:foodordering/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

  Get.put(SharedPrefranceRepository());
  Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print(e);
  }

  runApp(MyApp());
}
