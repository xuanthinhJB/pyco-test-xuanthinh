import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pyco_test_tony/data/service/user_service.dart';
import 'package:pyco_test_tony/model/user.dart';

class UserNotifier extends ChangeNotifier {

  UserService _userService;

  DataStatus status = DataStatus.NORMAL;

  List<User> _favoriteItems = [];

  List<User> _users = [];

  bool _haveInternet = true;

  UserNotifier(UserService userService) {
    _userService = userService;
    _getUser();
  }

  List<User> get favoriteItem => _favoriteItems;

  List<User> get users => _users;

  void setInternetStatus(bool haveInternet) {
    _haveInternet = haveInternet;
    _getUser();
  }

  void setUser(User user) {
    if (user != null)
      _users.add(user);
    if (_users.length < 10) {
      _getUser();
    }
    if (_users.length > 1) {
      status = DataStatus.NORMAL;
    } else if (_users.length == 1){
      status = DataStatus.LOADING;
    } else {
      status = DataStatus.NODATA;
    }
    notifyListeners();
  }

  void setUsers(List<User> users) {
    _users = users ?? [];
    notifyListeners();
  }

  void removeFirstItem() {
    try {
      _users.removeAt(0);
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
        var downloadedId = await ImageDownloader.downloadImage(user.picture);
        print(downloadedId);
        var filePath = await ImageDownloader.findPath(downloadedId);
        user = user.rebuild((b) => b
          ..localImage = filePath);
        _userService.addUserToDB(_users[0]);
      } catch (error) {
        print(error.toString());
      }
    }
  }

  Future<bool> checkStoragePermission() async {
    var grand = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    if (grand != PermissionStatus.granted){
      var result = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      print('permission storage: $result');
      if (result[PermissionGroup.contacts] == PermissionStatus.granted) {
        return true;
      }else{
        return false;
      }
    } else return true;
  }

  Future<User> _getUser() async {
    if (_haveInternet) {
      User user = await _userService.getUserInfo(_haveInternet)
      .catchError((error) {
        print(error);
      })
      .timeout(Duration(seconds: 20), onTimeout: () {
        return null;
      });
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
  NORMAL,
  NODATA
}