import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:pyco_test_tony/data/service/user_service.dart';
import 'package:pyco_test_tony/mixin/permissions.dart';
import 'package:pyco_test_tony/model/user.dart';

class UserNotifier extends ChangeNotifier with CheckPermission {

  UserService _userService;

  DataStatus status = DataStatus.NORMAL;

  List<User> _favoriteItems = [];

  List<User> _users = [];

  bool _haveInternet = true;

  UserNotifier(UserService userService) {
    _userService = userService;
  }

  bool get haveInternet => _haveInternet;

  List<User> get favoriteItem => _favoriteItems;

  List<User> get users => _users;

  void setInternetStatus(bool haveInternet) {
    _haveInternet = haveInternet;
    _getUser();
  }

  void getUser() {
    _getUser();
  }

  void setUser(User user) {
    if (user != null) {
      _users.add(user);
    }

    if (_users.length < 10) {
      _getUser();
    }
    print('Number of users: ${users.length}');
    if (_users.length > 0) {
      status = DataStatus.NORMAL;
    } else {
      status = DataStatus.LOADING;
    }
    notifyListeners();
  }

  void setUsers(List<User> users) {
    _users.addAll(users ?? []);
    status = DataStatus.NORMAL;
    notifyListeners();
  }

  void removeFirstItem() {
    try {
      _users.removeAt(0);
      if (_haveInternet)
        _getUser();
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  void addToDB() async {
    if (_haveInternet) {
      try {
        User user = _users[0];
        await checkStoragePermission();
        print(user.picture);
        var downloadedId = await ImageDownloader.downloadImage(user.picture.replaceAll('http://', 'https://'));
        print(downloadedId);
        var filePath = await ImageDownloader.findPath(downloadedId);
        print(filePath);
        user = user.rebuild((b) => b
          ..localImage = filePath);
        _userService.addUserToDB(user);
      } on PlatformException catch (error) {
        print(error);
      }
    }
  }

  void clearUsersInDB() {

  }

  Future<User> _getUser() async {
    print('get');
    if (_haveInternet) {
      User user = await _userService.getUserInfo(_haveInternet)
      .catchError((error) {
        print(error);
        setUser(null);
        return null;
      })
      .timeout(Duration(seconds: 20), onTimeout: () {
        setUser(null);
        return null;
      });
      print(user.toString());
      setUser(user);
      return user;
    } else {
      _getUserFromDB();
      return null;
    }
  }

  Future<List<User>> _getUserFromDB() async {
    List<User> users = await _userService.localUsers();
    setUsers(users);
    return users;
  }
}

enum DataStatus {
  LOADING,
  NORMAL
}