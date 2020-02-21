library location;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {						
  
  @nullable
  String get street;

  @nullable
  String get city;
  
  @nullable
  String get state;
  
  @nullable
  String get zip;
  
  Location._();

  factory Location([updates(LocationBuilder builder)]) = _$Location;

  static Serializer<Location> get serializer => _$locationSerializer;
}