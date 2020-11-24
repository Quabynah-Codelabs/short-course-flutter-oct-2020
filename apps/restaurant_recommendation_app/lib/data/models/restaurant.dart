import 'package:moor/moor.dart';

@DataClassName("Restaurant")
class PopinaRestaurant extends Table {
  TextColumn get name => text()();
  TextColumn get status => text().nullable()();
  TextColumn get placeId => text().nullable().named("place_id")();
  TextColumn get vicinity => text().nullable()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();

  @override
  Set<Column> get primaryKey => {name};
}
