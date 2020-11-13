import 'package:get_it/get_it.dart';
import 'package:restaurant_recommendation_app/data/repositories/restaurant.dart';
import 'package:restaurant_recommendation_app/data/services/location.dart';
import 'package:restaurant_recommendation_app/domain/repositories/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/services/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Service locator instance
GetIt sl = GetIt.instance;

Future<void> registerServiceLocator() async {
  // Register [SharedPreferences]
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  // Register [LocationService]
  sl.registerLazySingleton<BaseLocationService>(() => LocationService());

  // Register [RestaurantRepository]
  sl.registerLazySingleton<BaseRestaurantRepository>(
      () => RestaurantRepository());
}
