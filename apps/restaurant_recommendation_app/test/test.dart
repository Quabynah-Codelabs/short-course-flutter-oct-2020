import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/repositories/auth.dart';
import 'package:restaurant_recommendation_app/domain/repositories/location.dart';
import 'package:restaurant_recommendation_app/domain/repositories/prefs.dart';
import 'package:restaurant_recommendation_app/domain/repositories/restaurant.dart';
import 'package:uuid/uuid.dart';

import 'auth.dart';
import 'location.dart';
import 'prefs.dart';
import 'restaurant.dart';

// entry point of our tests
void main() {
  // ensures that flutter is running on the target device
  TestWidgetsFlutterBinding.ensureInitialized();
  BasePreferenceRepository _prefsRepo;
  BaseAuthRepository _authRepo;
  BaseLocationRepository _locationRepo;
  BaseRestaurantRepository _restaurantRepo;

  /// used to setup variables to be accessed inside our tests
  setUpAll(() {
    /// preferences
    _prefsRepo = PreferenceRepositoryImpl();
    _prefsRepo.dispose();

    /// auth
    _authRepo = MockAuthRepository();

    /// location
    _locationRepo = MockLocationRepository();

    /// restaurant
    _restaurantRepo = MockRestaurantRepository();
  });

  /// tests for preferences
  group("testing preferences repository", () {
    test("save & retrieve user id", () async {
      /// arrange
      // user id to be saved
      final userId = Uuid().v4();
      print("User ID to be saved => $userId");

      /// act
      _prefsRepo.saveUserId(userId: userId);

      /// assert
      final savedId = await _prefsRepo.onUserIdChange();
      print("Saved id => $savedId");
      expect(userId, savedId);
    });

    test("clears user id", () async {
      /// act
      _prefsRepo.dispose();

      /// assert
      expect(false, _prefsRepo.isLoggedIn);
    });
  });

  /// tests for authentication
  group("testing authentication repository", () {
    test("google sign in", () async {
      /// arrange
      when(_authRepo.googleSignIn()).thenAnswer((_) => Future.value(true));

      /// act
      final response = await _authRepo.googleSignIn();

      /// assert
      expect(true, response);
    });
  });

  /// test location
  group("testing location repository", () {
    test("get user location stream", () {
      /// arrange
      final userLocation = MockPosition()
        ..lat = 12.5567
        ..lng = 0.12345;
      when(_locationRepo.observeUserLocation())
          .thenAnswer((_) => Stream.value(userLocation));

      /// act
      _locationRepo.observeUserLocation().listen((locEvents) async {
        print("Location from stream => ${locEvents?.lat}");

        /// assert
        expect(userLocation, locEvents);

        /// arrange
        when(_locationRepo.observeUserLocation())
            .thenAnswer((_) => Stream.empty());

        /// act
        await Future.delayed(Duration(seconds: 2));

        /// assert
        expect(null, locEvents);
      });
    });

    test("get user location once", () async {
      /// arrange
      final userLocation = MockPosition()
        ..lat = 12.5567
        ..lng = 0.12345;
      when(_locationRepo.getUserLocation())
          .thenAnswer((_) => Future.value(userLocation));

      /// act
      final foundLocation = await _locationRepo.getUserLocation();

      /// assert
      expect(userLocation, foundLocation);
    });
  });

  /// test restaurants
  group("testing restaurant repository", () {
    test("get all restaurants for a given location", () async {
      /// arrange
      final userLocation = MockPosition()
        ..lat = 12.5567
        ..lng = 0.12345;
      List<BaseRestaurant> restaurants = [
        MockRestaurant(),
        MockRestaurant(),
        MockRestaurant(),
        MockRestaurant(),
      ];
      when(_restaurantRepo.getRestaurants(position: userLocation))
          .thenAnswer((realInvocation) => Future.value(restaurants));

      /// act
      var restaurantsNearBy =
          await _restaurantRepo.getRestaurants(position: userLocation);

      /// assert
      // verify(restaurantsNearBy.length)
      //     .called(greaterThanOrEqualTo(restaurants.length));
      expect(restaurantsNearBy, restaurants);
    });

    test("get a restaurant for a given id", () async {
      /// given = arrange
      final restaurantId = Uuid().v4();
      final restaurant = MockRestaurant()..placeId = restaurantId;
      when(_restaurantRepo.getRestaurantById(id: restaurantId))
          .thenAnswer((_) => Future.value(restaurant));

      /// when = act
      var baseRestaurant =
          await _restaurantRepo.getRestaurantById(id: restaurantId);

      /// then = assert
      expect(baseRestaurant.placeId, restaurant.placeId);
    });
  });
}
