import 'package:mockito/mockito.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/repositories/restaurant.dart';

class MockRestaurantRepository extends Mock implements BaseRestaurantRepository {}

class MockRestaurant extends Mock implements BaseRestaurant {}