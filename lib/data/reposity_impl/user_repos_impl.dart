import 'package:pyco_test_tony/data/local/db_helper.dart';
import 'package:pyco_test_tony/data/remote/http_handler.dart';
import 'package:pyco_test_tony/data/remote/rest_api.dart';
import 'package:pyco_test_tony/data/remote/user/user_api.dart';
import 'package:pyco_test_tony/data/reposity/user_repos.dart';
import 'package:pyco_test_tony/model/user.dart';
import 'package:pyco_test_tony/model/user_data_res.dart';

class UserRepoImpl extends UserRepo with HttpHandler {

  UserAPI _userAPI;

  UserRepoImpl() {
    _create();
  }

  void _create() async {
    _userAPI = await RestAPI.provideUserAPI();
  }

  @override
  void dispose() {
  }

  @override
  Future<User> getUserInfo(bool haveInternet) async {
    if (haveInternet) {
      UserDataRes userDataRes = await call(_userAPI.getUserInfo());
      if (userDataRes?.results != null) {
        if (userDataRes.results.length > 0) {
          return userDataRes.results[0]?.user;
        }
      }
    }
    return null;
  }
  
}