import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:pyco_test_tony/data/remote/user/user_api.dart';
import 'built_value_converter.dart';

class RestAPI {
  static const String PRO_URL = "";
  static const String DEV_URL = "";
  
  static String rootURL() {
    return isInDevMode ? DEV_URL : PRO_URL;
  }

  static Future<UserAPI> provideUserAPI() async {
    ChopperClient client = await _createClient(signedIn: false);
    return UserAPI.create(client);
  }

  static Future<ChopperClient> _createClient({bool signedIn = true}) async {
    final client = ChopperClient(
      baseUrl: isInDevMode ? DEV_URL : PRO_URL,
      services: [],
      converter: BuiltValueConverter(),
    );
    return client;
  }

  static bool get isInDevMode {
    bool inDevMode = false;
    assert(inDevMode = true);
    return inDevMode;
  }
}
