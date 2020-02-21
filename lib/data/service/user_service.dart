import 'package:pyco_test_tony/data/local/db_helper.dart';
import 'package:pyco_test_tony/data/reposity/user_repos.dart';
import 'package:pyco_test_tony/data/reposity_impl/user_repos_impl.dart';
import 'package:pyco_test_tony/model/user.dart';

class UserService {
  UserRepo _userRepo;

  UserService() {
    _userRepo = UserRepoImpl();
  }

  Future<User> getUserInfo(bool haveInternet) => _userRepo.getUserInfo(haveInternet);

  Future<List<User>> localUsers() async {
    List<User> users = await DbHelper().getUsers();
    return users;
  }

  Future<int> addUserToDB(User user) {
    return DbHelper().insertUser(user);
  }

  void dispose() {
    _userRepo.dispose();
  }
}
