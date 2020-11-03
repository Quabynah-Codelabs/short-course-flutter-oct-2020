import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Service locator instance
GetIt sl = GetIt.instance;

Future<void> registerServiceLocator() async {
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
}
