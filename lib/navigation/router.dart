import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/generic_page.dart';

import 'route_name.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();
GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: "/",
      name: RouteName.home,
      builder: (context, state) => const GenericPage(
        titleText: RouteName.home,
        destination: RouteName.profile,
      ),
    ),
    GoRoute(
      path: "/profile",
      name: RouteName.profile,
      builder: (context, state) => const GenericPage(
        titleText: RouteName.profile,
        destination: RouteName.login,
      ),
    ),
    GoRoute(
        path: "/login",
        name: RouteName.login,
        builder: (context, state) => const GenericPage(
              titleText: RouteName.login,
              destination: RouteName.forgot,
            ),
        routes: [
          GoRoute(
            name: RouteName.forgot,
            path: "forgot",
            builder: (context, state) => const GenericPage(
              titleText: RouteName.forgot,
              destination: RouteName.signUp,
            ),
          ),
          GoRoute(
            name: RouteName.signUp,
            path: "signUp",
            builder: (context, state) => const GenericPage(
                titleText: RouteName.signUp, destination: RouteName.home),
          ),
        ]),
  ],
);
