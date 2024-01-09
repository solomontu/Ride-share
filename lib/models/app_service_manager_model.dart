import 'package:ride_share/core/services/color_service.dart';
import 'package:ride_share/core/services/routing_service.dart';

class AppServiceManagerModel {
  AppServiceManagerModel({
    this.colorService,
    // this.routeService,
  });

  ColorService? colorService;
  RouterService routeService = RouterService();

  AppServiceManagerModel copyWith(
    ColorService? colorService,
  ) {
    return AppServiceManagerModel(
      colorService: colorService ?? this.colorService,
    );
  }
}
