library user_data_res;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';


import 'package:pyco_test_tony/model/user_data.dart';part 'user_data_res.g.dart';

abstract class UserDataRes implements Built<UserDataRes, UserDataResBuilder> {						
  
  @nullable
  BuiltList<UserData> get results;
  
  UserDataRes._();

  factory UserDataRes([updates(UserDataResBuilder builder)]) = _$UserDataRes;

  static Serializer<UserDataRes> get serializer => _$userDataResSerializer;
}