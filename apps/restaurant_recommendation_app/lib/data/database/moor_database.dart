import 'package:moor_flutter/moor_flutter.dart';
import 'package:restaurant_recommendation_app/data/models/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';

part "moor_database.g.dart";

/// Class needs:
/// 1. tables
/// 2. data access objects
/// 3. database

@UseMoor(
  tables: [PopinaRestaurant],
  daos: [RestaurantDao],
)
class PopinaDatabase extends _$PopinaDatabase {
  PopinaDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 3;
}

@UseDao(tables: [PopinaRestaurant])
class RestaurantDao extends DatabaseAccessor<PopinaDatabase>
    with _$RestaurantDaoMixin {
  RestaurantDao(PopinaDatabase db) : super(db);

  void addRestaurants(List<Restaurant> restaurants) {
    // for loop
    // for (int index = 0; index < restaurants.length; index++) {
    //   final item = restaurants[index];
    //   // this adds an item to the database table
    //    into(popinaRestaurant).insert(item);
    // }

    restaurants.forEach((item) async {
      // this adds an item to the database table
      await into(popinaRestaurant)
          .insert(item, mode: InsertMode.insertOrReplace);
    });
  }

  void addRestaurant(Restaurant restaurant) => into(popinaRestaurant)
      .insert(restaurant, mode: InsertMode.insertOrReplace);

  Stream<List<Restaurant>> getAllRestaurants({BasePosition position}) =>
      (select(popinaRestaurant)
          // ..where(
          // (restaurant) => restaurant.lat.isSmallerThanValue(position.lat))
          // ..where((restaurant) =>
          // restaurant.lng.isSmallerThanValue(position.lng))
          )
          .watch();
}
