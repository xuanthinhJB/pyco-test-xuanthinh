import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyco_test_tony/model/user.dart';
import 'package:pyco_test_tony/notifier/user_notifier.dart';
import 'package:pyco_test_tony/view/user_card_view.dart';

import '../notifier/user_notifier.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  StreamSubscription internetListenSub;

  List<UserCardView> userCards = List();

  int _userIndexMoved = -1;

  final _keyUserCard1 = GlobalKey<UserCardViewState>(debugLabel: 'user 1');

  final _keyUserCard2 = GlobalKey<UserCardViewState>(debugLabel: 'user 2');

  final _keyUserCard3 = GlobalKey<UserCardViewState>(debugLabel: 'user 3');

  @override
  void initState() {
    _checkInternetConnect();
    super.initState();
  }

  @override
  void dispose() {
    internetListenSub.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PYCO'),
      ),
      body: Consumer<UserNotifier>(
        builder: (_, notifier, __) {
          if (notifier.haveInternet) {
            if (notifier.status == DataStatus.LOADING ||
              notifier.users.length < 3) {
              return Center(child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ));
            } else if (notifier.status == DataStatus.NORMAL &&
              notifier.users.length < 3) {
              return Center(child: Text('No data'),);
            }
            else {
              return _buildCardUsersViews(notifier.users, !notifier.haveInternet, notifier);
            }
          } else {
            if (notifier.status == DataStatus.LOADING) {
              return Center(child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ));
            } else if (notifier.status == DataStatus.NORMAL &&
              notifier.users.length == 0) {
              return Center(child: Text('No data'),);
            } else {
              return _buildCardUsersViews(notifier.users, !notifier.haveInternet, notifier);
            }
          }
        }
      ),
      bottomNavigationBar: Consumer<UserNotifier>(
        builder: (_,userNotifier,__) {
          if (userNotifier.haveInternet) {
            return Container(height: 50,);
          } else {
            return Container(
              height: 50,
              padding: EdgeInsets.all(16),
              color: Colors.black,
              child: Text(
                'No Internet connection',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCardUsersViews(List<User> users, bool isOffline, UserNotifier notifier) {
    double halfScreenWidth = MediaQuery.of(context).size.width / 2;
    if (users.length == 1) {
      _addUser(users, isOffline);
      return Stack(
      children: <Widget>[
          _buidlCardItem(1),
          Align(
            alignment: Alignment(0.0, 0.0),
            child: Draggable(
              onDragEnd: (details) {
              onDragUser(details, -halfScreenWidth, notifier);
              },
              feedback: SizedBox.fromSize(
                size: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.5,
                ),
                child: userCards[0],
              ),
              child: SizedBox.fromSize(
                size: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.5,
                ),
                child: userCards[0],
              ),
              childWhenDragging: Container(),
            ),
          )
        ]
      );
    } else {
      _addUser(notifier.users, notifier.haveInternet);
      return Stack(
        children: <Widget>[
          _buidlCardItem(2),
          _buidlCardItem(1),
          Align(
            alignment: Alignment(0.0, 0.0),
            child: Draggable(
              onDragEnd: (details) {
              onDragUser(details, -halfScreenWidth, notifier);
              },
              feedback: SizedBox.fromSize(
                size: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.5,
                ),
                child: userCards[0],
              ),
              child: SizedBox.fromSize(
                size: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.5,
                ),
                child: userCards[0],
              ),
              childWhenDragging: Container(),
            ),
          )
        ],
      );
    }
  }

  Widget _buidlCardItem(int index) {
    return Align(
      alignment: Alignment(0.0, 0.0),
      child: IgnorePointer(
        child: SizedBox.fromSize(
          size: Size(
            MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height * 0.5,
          ),
          child: userCards[index],
        ),
      ),
    );
  }

  void _onMoveUser(UserNotifier notifier) {
    setState(() {
      if (_userIndexMoved + 1 < 3) {
        _userIndexMoved++;
      } else {
        _userIndexMoved = 0;
      }

      var temp = userCards[0];
      userCards[0] = userCards[1];
      userCards[1] = userCards[2];
      userCards[2] = temp;

      User extraUser;

      try {
        extraUser = notifier.users[3];
      } catch (error) {
        print(error.toString());
      }

      if(_userIndexMoved == 0) {
        _keyUserCard1.currentState.setUser(extraUser);
      }
      if(_userIndexMoved == 1) {
        _keyUserCard2.currentState.setUser(extraUser);
      }
      if(_userIndexMoved == 2) {
        _keyUserCard3.currentState.setUser(extraUser);
      }

      notifier.removeFirstItem();
    });
  }

  void onDragUser(DraggableDetails details, double dxValue, UserNotifier notifier) {
    if(details.offset.dx < dxValue) {
      _onMoveUser(notifier);
    }
    if(details.offset.dx > (-dxValue)) {
      _onMoveUser(notifier);
      notifier.addToDB();
    }
  }

  void _addUser(List<User> users, bool isNoInternet) {
    User user0;
    User user1;
    User user2;
    try {
      user0 = users[0];
      user1 = users[1];
      user2 = users[2];
    } catch (error) {
      print(error.toString());
    }
    if (userCards == null || userCards.length < 3) {
      userCards = [];
      userCards.add(UserCardView(user: user0, key: _keyUserCard1, isLocal: !isNoInternet));
      userCards.add(UserCardView(user: user1, key: _keyUserCard2, isLocal: !isNoInternet));
      userCards.add(UserCardView(user: user2, key: _keyUserCard3, isLocal: !isNoInternet));
    }
  }

  void _checkInternetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Provider.of<UserNotifier>(context).setInternetStatus(false);
    } else {
      Provider.of<UserNotifier>(context).setInternetStatus(true);
    }
    internetListenSub = Connectivity().onConnectivityChanged.listen((data) {
      if (data == ConnectivityResult.none) {
        Provider.of<UserNotifier>(context).setInternetStatus(false);
      } else {
        print('Internet come back!');
        Provider.of<UserNotifier>(context).setInternetStatus(true);
      }
    });
  }
}