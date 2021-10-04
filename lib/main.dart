import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app.dart';
import 'src/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  late final StreamSubscription sub;
  sub = FirebaseAuth.instance.authStateChanges().listen((user) {
    sub.cancel();

    late final String initialRoute;
    if (user != null) {
      initialRoute = AppRoute.dashboard;
    } else {
      initialRoute = AppRoute.landing;
    }

    runApp(ProviderScope(
      child: App(
        initialRoute: initialRoute,
      ),
    ));
  });
}
