import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_share/models/home_tab_model.dart';
import 'package:ride_share/shared/utils/constants.dart';

class HomeTabBarController extends Notifier<List<HomeTabModel>> {
  @override
  List<HomeTabModel> build() {
    return [];
  }

  void onInit() {
    state = [...Constants.profileTab];
  }

  void onTap({required String id}) {
    resetState();
    state = state.map((item) {
      if (item.tabId == id) {
        return item.copyWith(
            tabId: item.tabId, label: item.label, isSelected: true);
      } else {
        return   item.copyWith(
            tabId: item.tabId, label: item.label, isSelected: false);
      }
    }).toList();
  }

  void resetState() {
    state.clear();
    onInit();
  }
}
