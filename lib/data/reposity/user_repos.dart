import 'package:pyco_test_tony/model/user.dart';

abstract class UserRepo {

  Future<User> getUserInfo(bool haveInternet);

  void dispose();
}