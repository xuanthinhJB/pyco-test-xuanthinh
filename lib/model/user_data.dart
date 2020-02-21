library user_data;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pyco_test_tony/model/user.dart';

part 'user_data.g.dart';

abstract class UserData implements Built<UserData, UserDataBuilder> {						
  
  @nullable
  User get user;

  @nullable
  String get seed;

  @nullable
  String get version;
  
  UserData._();

  factory UserData([updates(UserDataBuilder builder)]) = _$UserData;

  static Serializer<UserData> get serializer => _$userDataSerializer;
}