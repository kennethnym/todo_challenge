import 'package:flutter/material.dart';

import 'themes/themes.dart';
import 'dashboard/dashboard_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Scaffold(body: DashboardScreen()),
    );
  }
}
