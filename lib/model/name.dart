library name;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'name.g.dart';

abstract class Name implements Built<Name, NameBuilder> {						
  
  @nullable
  String get title;

  @nullable
  String get first;
  
  @nullable
  String get last;
  
  Name._();

  factory Name([updates(NameBuilder builder)]) = _$Name;

  static Serializer<Name> get serializer => _$nameSerializer;
}