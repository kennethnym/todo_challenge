import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'themes/themes.dart';
import 'dashboard/dashboard_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent));

    return MaterialApp(
      title: 'Todo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const DashboardScreen(),
    );
  }
}
