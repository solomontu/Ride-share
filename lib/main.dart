import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_share/core/services/app_service_manager.dart';
import 'package:ride_share/core/services/routing_service.dart';
import 'package:ride_share/shared/global_variables.dart';

/// Provides access to the ObjectBox Store throughout the app.

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  RouterService get _routerService => as.routerService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: _routerService.informationParser,
            routerDelegate: _routerService.delegate,
            routeInformationProvider: _routerService.informationProvider,
            theme: ThemeData(
              primaryColor: srThemes.primaryColor,
            ),
          );
        });
  }
}
