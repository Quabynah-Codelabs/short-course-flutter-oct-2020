// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Restaurant extends DataClass implements Insertable<Restaurant> {
  final String name;
  final String status;
  final String placeId;
  final String vicinity;
  final double lat;
  final double lng;
  Restaurant(
      {@required this.name,
      this.status,
      this.placeId,
      this.vicinity,
      @required this.lat,
      @required this.lng});
  factory Restaurant.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Restaurant(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      placeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}place_id']),
      vicinity: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}vicinity']),
      lat: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      lng: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lng']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || placeId != null) {
      map['place_id'] = Variable<String>(placeId);
    }
    if (!nullToAbsent || vicinity != null) {
      map['vicinity'] = Variable<String>(vicinity);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    return map;
  }

  PopinaRestaurantCompanion toCompanion(bool nullToAbsent) {
    return PopinaRestaurantCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      placeId: placeId == null && nullToAbsent
          ? const Value.absent()
          : Value(placeId),
      vicinity: vicinity == null && nullToAbsent
          ? const Value.absent()
          : Value(vicinity),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
    );
  }

  factory Restaurant.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Restaurant(
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      placeId: serializer.fromJson<String>(json['placeId']),
      vicinity: serializer.fromJson<String>(json['vicinity']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'placeId': serializer.toJson<String>(placeId),
      'vicinity': serializer.toJson<String>(vicinity),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
    };
  }

  Restaurant copyWith(
          {String name,
          String status,
          String placeId,
          String vicinity,
          double lat,
          double lng}) =>
      Restaurant(
        name: name ?? this.name,
        status: status ?? this.status,
        placeId: placeId ?? this.placeId,
        vicinity: vicinity ?? this.vicinity,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );
  @override
  String toString() {
    return (StringBuffer('Restaurant(')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('placeId: $placeId, ')
          ..write('vicinity: $vicinity, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(
          status.hashCode,
          $mrjc(placeId.hashCode,
              $mrjc(vicinity.hashCode, $mrjc(lat.hashCode, lng.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Restaurant &&
          other.name == this.name &&
          other.status == this.status &&
          other.placeId == this.placeId &&
          other.vicinity == this.vicinity &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class PopinaRestaurantCompanion extends UpdateCompanion<Restaurant> {
  final Value<String> name;
  final Value<String> status;
  final Value<String> placeId;
  final Value<String> vicinity;
  final Value<double> lat;
  final Value<double> lng;
  const PopinaRestaurantCompanion({
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.placeId = const Value.absent(),
    this.vicinity = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
  });
  PopinaRestaurantCompanion.insert({
    @required String name,
    this.status = const Value.absent(),
    this.placeId = const Value.absent(),
    this.vicinity = const Value.absent(),
    @required double lat,
    @required double lng,
  })  : name = Value(name),
        lat = Value(lat),
        lng = Value(lng);
  static Insertable<Restaurant> custom({
    Expression<String> name,
    Expression<String> status,
    Expression<String> placeId,
    Expression<String> vicinity,
    Expression<double> lat,
    Expression<double> lng,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (placeId != null) 'place_id': placeId,
      if (vicinity != null) 'vicinity': vicinity,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
    });
  }

  PopinaRestaurantCompanion copyWith(
      {Value<String> name,
      Value<String> status,
      Value<String> placeId,
      Value<String> vicinity,
      Value<double> lat,
      Value<double> lng}) {
    return PopinaRestaurantCompanion(
      name: name ?? this.name,
      status: status ?? this.status,
      placeId: placeId ?? this.placeId,
      vicinity: vicinity ?? this.vicinity,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<String>(placeId.value);
    }
    if (vicinity.present) {
      map['vicinity'] = Variable<String>(vicinity.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PopinaRestaurantCompanion(')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('placeId: $placeId, ')
          ..write('vicinity: $vicinity, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }
}

class $PopinaRestaurantTable extends PopinaRestaurant
    with TableInfo<$PopinaRestaurantTable, Restaurant> {
  final GeneratedDatabase _db;
  final String _alias;
  $PopinaRestaurantTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _placeIdMeta = const VerificationMeta('placeId');
  GeneratedTextColumn _placeId;
  @override
  GeneratedTextColumn get placeId => _placeId ??= _constructPlaceId();
  GeneratedTextColumn _constructPlaceId() {
    return GeneratedTextColumn(
      'place_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _vicinityMeta = const VerificationMeta('vicinity');
  GeneratedTextColumn _vicinity;
  @override
  GeneratedTextColumn get vicinity => _vicinity ??= _constructVicinity();
  GeneratedTextColumn _constructVicinity() {
    return GeneratedTextColumn(
      'vicinity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedRealColumn _lat;
  @override
  GeneratedRealColumn get lat => _lat ??= _constructLat();
  GeneratedRealColumn _constructLat() {
    return GeneratedRealColumn(
      'lat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  GeneratedRealColumn _lng;
  @override
  GeneratedRealColumn get lng => _lng ??= _constructLng();
  GeneratedRealColumn _constructLng() {
    return GeneratedRealColumn(
      'lng',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [name, status, placeId, vicinity, lat, lng];
  @override
  $PopinaRestaurantTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'popina_restaurant';
  @override
  final String actualTableName = 'popina_restaurant';
  @override
  VerificationContext validateIntegrity(Insertable<Restaurant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('place_id')) {
      context.handle(_placeIdMeta,
          placeId.isAcceptableOrUnknown(data['place_id'], _placeIdMeta));
    }
    if (data.containsKey('vicinity')) {
      context.handle(_vicinityMeta,
          vicinity.isAcceptableOrUnknown(data['vicinity'], _vicinityMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat'], _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng'], _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Restaurant map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Restaurant.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PopinaRestaurantTable createAlias(String alias) {
    return $PopinaRestaurantTable(_db, alias);
  }
}

abstract class _$PopinaDatabase extends GeneratedDatabase {
  _$PopinaDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PopinaRestaurantTable _popinaRestaurant;
  $PopinaRestaurantTable get popinaRestaurant =>
      _popinaRestaurant ??= $PopinaRestaurantTable(this);
  RestaurantDao _restaurantDao;
  RestaurantDao get restaurantDao =>
      _restaurantDao ??= RestaurantDao(this as PopinaDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [popinaRestaurant];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$RestaurantDaoMixin on DatabaseAccessor<PopinaDatabase> {
  $PopinaRestaurantTable get popinaRestaurant =>
      attachedDatabase.popinaRestaurant;
}
