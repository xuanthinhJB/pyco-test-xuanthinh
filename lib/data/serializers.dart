library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:pyco_test_tony/model/location.dart';
import 'package:pyco_test_tony/model/name.dart';
import 'package:pyco_test_tony/model/user.dart';
import 'package:pyco_test_tony/model/user_data.dart';
import 'package:pyco_test_tony/model/user_data_res.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Name,
  Location,
  User,
  UserData,
  UserDataRes,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
