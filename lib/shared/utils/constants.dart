import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/models/home_tab_model.dart';
import 'package:ride_share/shared/global_variables.dart';
import 'package:ride_share/shared/utils/assets.dart';

class Constants {
  static const designWidth = 375;
  static const desginHeight = 812;

  static const List<HomeTabModel> profileTab = [
    HomeTabModel(isSelected: true, label: 'Upcoming', tabId: '1'),
    HomeTabModel(isSelected: false, label: 'Completed', tabId: '2'),
    HomeTabModel(isSelected: false, label: 'Create new', tabId: '3'),
  ];

  static List<Widget> driverRating = List.generate(
      5,
      (index) => Padding(
            padding:  EdgeInsets.only(right: 6.0.w),
            child: SvgPicture.asset(Assets.star),
          ));
}
