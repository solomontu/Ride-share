import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_share/shared/global_variables.dart';

//This divider does not have an inherent padding unlike the flutter
//built in which has unsatisfying inbuilt padding

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key, this.color, this.height});

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.minPositive,
      width: 0.5,
      decoration: BoxDecoration(
        color: color ?? srThemes.dividerGray,
      ),
    );
  }
}

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({super.key, this.color, this.width});

  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.h,
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        color: color ?? srThemes.dividerGray,
      ),
    );
  }
}
