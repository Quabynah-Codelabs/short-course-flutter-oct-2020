import 'package:geolocator/geolocator.dart';
import 'package:restaurant_recommendation_app/data/models/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/services/location.dart';

/// Implementation of [BaseLocationService]
class LocationService implements BaseLocationService {
  @override
  Future<BasePosition> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return PositionImpl(lat: position.latitude, lng: position.longitude);
  }

  @override
  Stream<BasePosition> observeCurrentLocation() async* {
    var stream =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high);
    final position = stream.map(
        (event) => PositionImpl(lat: event.latitude, lng: event.longitude));
    yield* position;
  }
}
