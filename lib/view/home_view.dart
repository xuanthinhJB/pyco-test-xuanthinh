import 'package:flutter/material.dart';
import 'package:pyco_test_tony/view/user_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Divider(height: 1, color: Colors.grey),
              Flexible(
                flex: 7,
                child: Container(
                  color: Colors.grey[200],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: UserView(),
            ),
          ),
        ],
      ),
    );
  }
}