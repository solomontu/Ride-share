import 'package:ride_share/core/services/color_service.dart';
import 'package:ride_share/core/services/routing_service.dart';
import 'package:ride_share/shared/utils/device_permissions.dart';

class AppServiceManager {
  late ColorService colorService;
  late RouterService routerService;
  late DevicePermissions devicePermissions;

  AppServiceManager() {
    colorService = ColorService();
    routerService = RouterService();

    devicePermissions = DevicePermissions();
  }
}

AppServiceManager as = AppServiceManager();
