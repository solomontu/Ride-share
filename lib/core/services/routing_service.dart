// ignore_for_file: implementation_imports

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/delegate.dart';
import 'package:go_router/src/information_provider.dart';
import 'package:go_router/src/parser.dart';
import 'package:ride_share/models/route_model.dart';
import 'package:ride_share/routes/base_route.dart';
import 'package:ride_share/routes/route_animation.dart';
import 'package:ride_share/shared/widgets/custom_widget_builder.dart';
import 'package:ride_share/views/error_screens.dart/routing_error_screen.dart';


class RouterService {
  RouterService() {
    _router = GoRouter(
      navigatorKey: _routeKey,
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellRouteKey,
          routes: _parseRouteModel(MyRouter.routes),
          builder: (context, GoRouterState state, Widget child) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: CustomWidgetBuilder(
                key: state.pageKey,
                child: child,
              ),
            );
          },
        )
      ],
      redirect: _handleTopLevelRedirection,
      errorPageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<Widget>(
          key: state.pageKey,
          child: const ErrorScreen(),
          transitionsBuilder: transitionsBuilder,
        );
      },
    );
  }

  FutureOr<String?> _handleTopLevelRedirection(
      BuildContext context, GoRouterState state) async {
    return null;
  }

  BuildContext? get context => _shellRouteKey.currentContext;

  GoRouterDelegate get delegate => _router.routerDelegate;

  GoRouteInformationParser get informationParser =>
      _router.routeInformationParser;

  GoRouteInformationProvider get informationProvider =>
      _router.routeInformationProvider;
  late GoRouter _router;

  /// The global navigator key to all screens routed through the router's shell.
  final GlobalKey<NavigatorState> _shellRouteKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _routeKey = GlobalKey<NavigatorState>();

  List<GoRoute> _parseRouteModel(List<RouteModel> routes) {
    return routes.map((RouteModel route) {
      return GoRoute(
        name: route.name,
        path: route.path,
        redirect: route.redirect,
        routes: _parseRouteModel(route.subRoutes),
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<Widget>(
            key: state.pageKey,
            child: route.builder.call(context, state),
            transitionsBuilder: transitionsBuilder,
          );
        },
      );
    }).toList();
  }

  /// Pushes a new route on to the page stack.
  /// Push a named route onto the page stack with optional parameters
  /// and/or optional query parameters,
  /// e.g. name='person', params={'fid': 'f2', 'pid': 'p1'}, params={'fid': 'f2', 'pid': 'p1'},
  void pushByName(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.pushNamed(name,
        params: params, queryParams: queryParams, extra: extra);
  }

  /// Navigate to a page by [path] i.e (URI location) with optional query parameters,
  /// e.g. /family/f2/person/p1?color=blue
  ///
  void go(
    String path, {
    Object? extra,
  }) {
    _router.go(path, extra: extra);
  }

  void goNamed(
    String pathName, {
    Object? extra,
  }) {
    _router.goNamed(pathName, extra: extra);
  }

  /// Push a path (URI location) onto the page stack
  /// with an optional query parameters, e.g. /family/f2/person/p1?color=blue
  void pushByPath(
    String path, {
    Object? extra,
  }) {
    _router.push(path, extra: extra);
  }

  //Navigate to a new page but not leaving anything on the stack
  //except the new route that was navigated to
  void popUntil(String name) {
    _router.goNamed(name);
  }


}
