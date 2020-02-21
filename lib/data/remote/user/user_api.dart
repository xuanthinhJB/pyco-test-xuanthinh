library user_api;

import 'package:chopper/chopper.dart';
import 'package:pyco_test_tony/model/user_data_res.dart';

part 'user_api.chopper.dart';

@ChopperApi(baseUrl: 'https://randomuser.me/api/0.4/?randomapi')
abstract class UserAPI extends ChopperService {

  static UserAPI create(ChopperClient client) {
    return _$UserAPI(client);
  }

  @Get(path: '/')
  Future<Response<UserDataRes>> getUserInfo();
}