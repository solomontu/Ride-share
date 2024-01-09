import 'package:flutter/material.dart';
import 'package:ride_share/core/services/app_service_manager.dart';
import 'package:ride_share/routes/route_urls.dart';
import 'package:ride_share/views/home/home_shared_widgets/ride_tile.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return RideTile(
                  onTap: () {
                    as.routerService
                        .pushByName(RouteUrls.ridersForThisLocation);
                  },
                );
              }),
        ),
      ],
    );
  }
}
