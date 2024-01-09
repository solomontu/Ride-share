import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_share/models/home_tab_model.dart';
import 'package:ride_share/shared/global_variables.dart';
import 'package:ride_share/shared/utils/styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 48.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
              border: Border.all(color: srThemes.primaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ],
    );
  }
}

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key, required this.tabModel, required this.onTap});

  final HomeTabModel tabModel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: tabModel.isSelected ? srThemes.primaryColor : srThemes.white,
        ),
        child: Styles.medium(
          tabModel.label,
          fontSize: 12.sp,
          color: tabModel.isSelected ? srThemes.white : srThemes.gray,
        ),
      ),
    );
  }
}
