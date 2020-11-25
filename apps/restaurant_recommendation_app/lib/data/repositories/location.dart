import 'package:geolocator/geolocator.dart';
import 'package:restaurant_recommendation_app/data/models/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/repositories/location.dart';

class LocationRepository implements BaseLocationRepository {
  @override
  Future<BasePosition> getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Lat => ${position.latitude} & Lng => ${position.longitude}");
    return PositionImpl(lat: position.latitude, lng: position.longitude);
  }

  @override
  Stream<BasePosition> observeUserLocation() async* {
    Stream<Position> positionStream =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high);

    positionStream.map((position) async* {
      print("Lat => ${position.latitude} & Lng => ${position.longitude}");
      yield PositionImpl(lat: position.latitude, lng: position.longitude);
    });
  }
}
