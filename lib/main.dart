import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:pyco_test_tony/data/service/user_service.dart';
import 'package:pyco_test_tony/notifier/user_notifier.dart';
import 'package:pyco_test_tony/view/home_view.dart';

void main() {
  _setupLogging();
  runApp(MultiProvider(
    providers: [
      Provider<UserService>(
        create: (_) => UserService(),
        dispose: (_, authService) => authService.dispose(),
      ),
      ChangeNotifierProxyProvider<UserService, UserNotifier>(
        create: (_) => null,
        update: (_, userService, __) {
          return UserNotifier(userService);
        },
      ),
    ],
    child: MyApp(),
  ));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
      ],
      home: HomeView(),
    );
  }
}