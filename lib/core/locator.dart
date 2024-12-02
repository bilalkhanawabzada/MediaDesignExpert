import 'package:get_it/get_it.dart';

import 'package:jaat_app/core/services/auth_services.dart';
import 'package:jaat_app/core/services/chat_servives.dart';
import 'package:jaat_app/core/services/connection_service.dart';
import 'package:jaat_app/core/services/connectivity_services.dart';
import 'package:jaat_app/core/services/create_matrimonial_profile_service.dart';
import 'package:jaat_app/core/services/create_user_profile_service.dart';
import 'package:jaat_app/core/services/get_all_profiles_service.dart';
import 'package:jaat_app/core/services/home_services.dart';
import 'package:jaat_app/core/services/product_service.dart';
import 'package:jaat_app/core/services/requests_service.dart';
import 'package:jaat_app/core/services/update_matrimonial_profile_service.dart';
import 'package:jaat_app/core/services/verify_username_service.dart';
// import 'package:stacked/stacked.dart';

import 'navigator_service.dart';
import 'network_api_service.dart';
// import 'services/check_username_service.dart';

final GetIt locator = GetIt.instance;

/// Contains all the singleton services, [setUpLocator] is called in the main method.
class LocatorInjector {
  static Future<void> setUpLocator() async {
    // locator.registerLazySingleton(() => NavigatorService());
    // locator.registerLazySingleton(() => NetworkApiService());
    // locator.registerLazySingleton(() => AuthServices());
    // locator.registerLazySingleton(() => ConnectivityServices());
    // locator.registerLazySingleton(() => UserProfileService());
    // locator.registerLazySingleton(() => GetAllProfilesService());
    // locator.registerLazySingleton(() => MatrimonialProfileService());
    // locator.registerLazySingleton(() => HomeServices());
    // locator.registerLazySingleton(() => ChatService());
    // locator.registerLazySingleton(() => RequestsService());
    // locator.registerLazySingleton(() => VerifyUserName());
    // locator.registerLazySingleton(() => ConnectionService());
    // locator.registerLazySingleton(() => UpdateMatrimonialProfileService());
    locator.registerLazySingleton(() => ProductService());


  }
}

enum BottomSheetType {
  floating,
  // You can add more types here if needed, such as:
  // basic,
  // confirmation,
}

enum DialogType {
  fullscreen,
  locationInfo,
  basicInfo,
  educatioCareerInfo,
  religiousInfo,
  hobbiesDialog,
  familyInfoDialog,
  galleryImages,
  deleteProfile,
}

