import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyco_test_tony/model/user.dart';
import 'package:pyco_test_tony/notifier/user_notifier.dart';
import 'package:pyco_test_tony/view/user_card_view.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  StreamSubscription internetListenSub;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    var dxValue = - MediaQuery.of(context).size.width / 2; 
    return Scaffold(
      key: _scaffoldKey,
      body: Consumer<UserNotifier>(
        builder: (_, notifier, __) {
          if (notifier.status == DataStatus.LOADING || notifier.users.length < 3) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (notifier.users.length == 0) {
              return Container(
                child: Text('No data'),
              );
            }
            _addUser(notifier.users);
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: IgnorePointer(
                    child: SizedBox.fromSize(
                      size: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: userCards[2],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: IgnorePointer(
                    child: SizedBox.fromSize(
                      size: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: userCards[1],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Draggable(
                    onDragEnd: (details) {
                    onDragUser(details, dxValue, notifier);
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
                ),
              ],
            );
          }
        }
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

      if(_userIndexMoved == 0) {
        _keyUserCard1.currentState.setUser(notifier.users[3]);
      }
      if(_userIndexMoved == 1) {
        _keyUserCard2.currentState.setUser(notifier.users[3]);
      }
      if(_userIndexMoved == 2) {
        _keyUserCard3.currentState.setUser(notifier.users[3]);
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

  void _addUser(List<User> users) {
    userCards.add(UserCardView(user: users[0], key: _keyUserCard1,));
    userCards.add(UserCardView(user: users[1], key: _keyUserCard2,));
    userCards.add(UserCardView(user: users[2], key: _keyUserCard3,));
  }

  void _checkInternetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showInSnackBar('No Internet connection');
      Provider.of<UserNotifier>(context).setInternetStatus(false);
    }
    internetListenSub = Connectivity().onConnectivityChanged.listen((data) {
      if (data == ConnectivityResult.none) {
        showInSnackBar('No Internet connection');
        Provider.of<UserNotifier>(context).setInternetStatus(false);
      } else {
        hideSnackBar();
        Provider.of<UserNotifier>(context).setInternetStatus(true);
      }
    });
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  void hideSnackBar() {
    _scaffoldKey.currentState.hideCurrentSnackBar();
  }
}