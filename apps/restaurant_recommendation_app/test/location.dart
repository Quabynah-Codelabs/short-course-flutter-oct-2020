import 'package:mockito/mockito.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/repositories/location.dart';

/// creates a fake implementation of the [BaseLocationRepository]
class MockLocationRepository extends Mock implements BaseLocationRepository {}

class MockPosition extends Mock implements BasePosition {}