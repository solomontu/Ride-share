import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/shared/global_variables.dart';
import 'package:ride_share/shared/strings.dart';
import 'package:ride_share/shared/utils/assets.dart';
import 'package:ride_share/shared/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.leading,
      required this.title,
      this.actions,
      this.itemsColor,
      this.edgeInsets,
      this.shouldPop});

  final Widget? leading;
  final String title;
  final Widget? actions;
  final Color? itemsColor;
  final EdgeInsets? edgeInsets;
  final bool? shouldPop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          edgeInsets ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 37.h),
      child: Align(
        alignment: Alignment.topCenter,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          leading ??
              GestureDetector(
                onTap: () {
                  if (shouldPop == null || shouldPop == true) {
                    Navigator.pop(context);
                  }
                },
                child: SvgPicture.asset(Assets.arrowBackIos,
                    semanticsLabel: Strings.arrowBackIos,
                    color: itemsColor ?? srThemes.primaryColor),
              ),
          Styles.bold(title,
              fontSize: 20.sp, color: itemsColor ?? srThemes.primaryColor),
          actions ?? const SizedBox.shrink()
        ]),
      ),
    );
  }
}
