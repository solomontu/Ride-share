import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_share/models/route_model.dart';
import 'package:ride_share/routes/route_urls.dart';
import 'package:ride_share/views/home/home.dart';
import 'package:ride_share/views/home/riders_for_this_location.dart';

class MyRouter {
  MyRouter();

  static final List<RouteModel> routes = <RouteModel>[
    RouteModel(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
    RouteModel(
      path: RouteUrls.ridersForThisLocation,
      name: RouteUrls.ridersForThisLocation,
      builder: (BuildContext context, GoRouterState state) {
        return const RidersForThisLocation();
      },
    ),
  ];
}
