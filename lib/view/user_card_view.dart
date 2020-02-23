import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pyco_test_tony/model/user.dart';

class UserCardView extends StatefulWidget {

  final User user;

  final bool isLocal;

  const UserCardView({Key key, this.user, this.isLocal = false}) : super(key: key);

  @override
  UserCardViewState createState() => UserCardViewState();
}

class UserCardViewState extends State<UserCardView> {

  int _selectedIndex = 0;

  User _user;

  DateTime _dateTime;

  final mainStyle = TextStyle(
      fontSize: 20, 
      color: Colors.black, 
      fontWeight: FontWeight.w500,
    );

  final subStyle = TextStyle(fontSize: 16, color: Colors.grey,);
  
  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:_buildBody(_user),
    );
  }

  Widget _buildBody(User user) {
    if (user != null) {
      return Card(
        elevation: 5,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.grey[200],
                  ),
                ),
                Divider(height: 1, color: Colors.grey),
                Flexible(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: _viewInfo(_selectedIndex, user),
                      ),
                      SizedBox(height: 16),
                      _buildBottomIcon(),
                      SizedBox(height: 16)
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Center(
                child: _avatar(
                  widget.isLocal ? (user.localImage ?? '') : (user.picture ?? ''), 
                  size: 120,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return DefaultTextStyle(
        style: TextStyle(
          color: Colors.black
        ),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Out of Users'),
                FlatButton(
                  child: Text('Reload'),
                  onPressed: () {
                    
                  },
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _avatar(String imageUrl,{double size}) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: widget.isLocal ? Image.file(File(imageUrl)) :
        Image.network(imageUrl ?? '', fit: BoxFit.cover),
      )
    );
  }

   
  Widget _userInfo(User user){
    return Column(
      children: <Widget>[
        Text(
          '${user.name.title ?? ''}',
          style: mainStyle,),
        SizedBox(height: 4),
        Text(
          '${user.name.first} ${user.name.last}', 
          textAlign: TextAlign.center,
          style: mainStyle,
        ),
        SizedBox(height: 8),
        Text('Gender: ${user.gender}',style: subStyle,),
      ],
    );
  }
  
  Widget _userRes(User user){
    _dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(user.registered));
    return Column(
      children: <Widget>[
        Text(
          'Registered',
          style: subStyle,),
        SizedBox(height: 4),
        Text(
          '${_dateTime.day ?? '01'}/${_dateTime.month ?? '01'}/${_dateTime.year ?? 1990}', 
          textAlign: TextAlign.center,
          style: mainStyle,
        ),
      ],
    );
  }
  
  Widget _userAddress(User user){
    return Column(
      children: <Widget>[
        Text('My Addressed Is',style: subStyle),
        SizedBox(height: 8),
        Text(
          '${user.location.street}, ${user.location.city}, ${user.location.state}.',
          textAlign: TextAlign.center,
          style: mainStyle)
      ],
    );
  }
  
  Widget _userContact(User user){
    return Column(
      children: <Widget>[
        Text(
          'Phone: ${user.phone ?? ''}',
          style: subStyle,),
        SizedBox(height: 4),
        Text(
          'Cel: ${user.cell ?? ''}', 
          style: subStyle,
        ),
        SizedBox(height: 8),
        Text(
          'Email: ${user.email ?? ''}',
          textAlign: TextAlign.center,
          style: subStyle,),
      ],
    );
  }
  
  Widget _userAccount(User user){
    return Column(
      children: <Widget>[
        Text('-',style: mainStyle),
      ],
    );
  }

  Widget _buildBottomIcon() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: onTapIcon,
      elevation: 0,
      backgroundColor: Colors.transparent,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      selectedFontSize: 12,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.person_outline,
            color: _selectedIndex == 0 ? Colors.green : Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.event,
            color: _selectedIndex == 1 ? Colors.green : Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.map,
            color: _selectedIndex == 2 ? Colors.green : Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.phone,
            color: _selectedIndex == 3 ? Colors.green : Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.lock_outline,
            color: _selectedIndex == 4 ? Colors.green : Colors.grey,
          ),
        )
      ]);
  }
  
  Widget _viewInfo(int index, User user) {
    switch (index) {
      case 0:
        return _userInfo(user);
        break;
      case 1: 
        return _userRes(user);
        break;
      case 2:
        return _userAddress(user);
        break;
      case 3: 
        return _userContact(user);
        break;
      case 4: 
        return _userAccount(user);
        break;
      default:
      return null;
    }
  }
  
  void onTapIcon(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setUser(User user) {
    setState(() {
       _user = user;
    });
  }
}