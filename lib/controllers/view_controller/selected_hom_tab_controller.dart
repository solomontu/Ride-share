//Todo: get the selected card and pass it For An API call
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedTabController extends Notifier<String> {
  @override
  String build() {
    return '1';
  }

  void onTap(String id) {
    state = id;
  }
}
