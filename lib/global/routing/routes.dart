import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:very_good_coffee_app/modules/home/views/screens/favorites_index.dart';
import 'package:very_good_coffee_app/modules/home/views/screens/home_index.dart';

final List<RouteBase> routes = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeIndex();
    },
  ),
  GoRoute(
    path: FavoritesIndex.routePath,
    name: FavoritesIndex.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const FavoritesIndex();
    },
  ),
];
