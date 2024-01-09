

import 'package:ride_share/models/route_model.dart';

/// A simple class that composes a route by appending [base] path
/// to each [route.path] declared for a module.
///
/// if [base] path is empty then [base] path is returned.
class RouteComposer {
  RouteComposer();

  /// composes routes by iterating over routes declared for a particular module
  /// by appending [base] path.
  ///
  ///
  /// Example:
  /// * String base = '/apps';
  /// * List<RouteModel> routes = ['records', 'profile'];
  /// * base + route => two composedPath = '/apps/records' and '/apps/profile'.
  static List<RouteModel> compose(String base, List<RouteModel> children) {
    final List<RouteModel> routes = children.map((RouteModel route) {
      return RouteModel(
        name: route.name,
        path: route.path.isEmpty ? base : '$base/${route.path}',
        redirect: route.redirect,
        subRoutes: route.subRoutes,
        builder: route.builder,
        pageBuilder: route.pageBuilder,
      );
    }).toList();

    return routes;
  }
}
