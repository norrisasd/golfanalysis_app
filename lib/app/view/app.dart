import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatelessWidget {
  AppView({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(routes: routes, initialLocation: '/result');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Golf Pose Analysis',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MaterialApp.router(
          routerConfig: _router,
          title: 'App Go Router',
        ));
  }
}
