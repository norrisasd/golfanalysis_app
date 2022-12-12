import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golfanalysis_jpn/features/guide/guide.dart';
import 'package:golfanalysis_jpn/features/player/player.dart';
import 'package:golfanalysis_jpn/features/record/record.dart';
import 'package:golfanalysis_jpn/features/result/result.dart';

import '../../features/home/home.dart';

List<GoRoute> routes = [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      }),
  GoRoute(
      path: '/guide',
      builder: (BuildContext context, GoRouterState state) {
        return const GuidePage();
      }),
  GoRoute(
      path: '/record',
      builder: (BuildContext context, GoRouterState state) {
        return RecordPage();
      }),
  GoRoute(
      path: '/player',
      builder: (BuildContext context, GoRouterState state) {
        return const PlayerPage();
      }),
  GoRoute(
      path: '/result',
      builder: (BuildContext context, GoRouterState state) {
        return const ResultPage();
      }),
];
