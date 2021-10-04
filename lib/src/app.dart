import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'themes/themes.dart';
import 'dashboard/dashboard_screen.dart';
import 'landing/landing_screen.dart';
import 'routes.dart';

class App extends StatelessWidget {
  /// The name of the route that [App] should show initially.
  final String initialRoute;

  const App({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent));

    return MaterialApp(
      title: 'Todo',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: initialRoute,
      routes: {
        AppRoute.landing: (_) => const LandingScreen(),
        AppRoute.dashboard: (_) => const DashboardScreen(),
      },
    );
  }
}
