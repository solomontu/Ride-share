import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class RouteModel {
  RouteModel({
    required this.path,
    this.builder = _invalidBuilder,
    this.name,
    this.subRoutes = const <RouteModel>[],
    this.pageBuilder,
    this.redirect = _noRedirection,
  });

  final String path;
  final String? name;
  final List<RouteModel> subRoutes;
  Page<void> Function(BuildContext, GoRouterState)? pageBuilder;
  Widget Function(BuildContext, GoRouterState) builder;
  FutureOr<String?> Function(BuildContext context, GoRouterState) redirect;

  static FutureOr<String?> _noRedirection(
          BuildContext context, GoRouterState state) =>
      null;

  static Widget _invalidBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SizedBox.shrink();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'name': name,
      'subRoutes': subRoutes,
      'pageBuilder': pageBuilder,
      'builder': builder,
    };
  }
}
