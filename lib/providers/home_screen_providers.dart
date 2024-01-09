import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_share/controllers/view_controller/home_tab_bar_controller.dart';
import 'package:ride_share/controllers/view_controller/selected_hom_tab_controller.dart';
import 'package:ride_share/models/home_tab_model.dart';

final storeSearchControllerProvider =
    NotifierProvider<HomeTabBarController, List<HomeTabModel>>(() {
  return HomeTabBarController();
});

final selectedTabController =
    NotifierProvider<SelectedTabController, String>(() {
  return SelectedTabController();
});
