
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_share/shared/global_variables.dart';

class FWt {
  FWt();

  // static FontWeight extraLight = FontWeight.w200;
  // static FontWeight light = FontWeight.w300;
  static FontWeight normal = FontWeight.w400;
  static FontWeight mediumBold = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;

  static FontWeight bold = FontWeight.w700;
// static FontWeight extraBold = FontWeight.w800;
// static FontWeight text = FontWeight.w900;
}

class Styles {
  Styles();

  static TextStyle regularTextStyle({
    double? fontSize,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextOverflow? textOverflow,
    bool strike = false,
    bool underline = false,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14.0,
      fontWeight: fontWeight ?? FWt.normal,
      color: color ?? srThemes.primaryColor,
      height: height,
      fontStyle: fontStyle,
      overflow: textOverflow,
      decoration: underline
          ? TextDecoration.underline
          : strike
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      fontFamily: 'Euclid-Circular-B',
    );
  }

  static Text regular(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    double? height,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
    bool? softWrap,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      softWrap: softWrap ?? true,
      style: regularTextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
          height: height,
          fontWeight: fontWeight,
          strike: strike,
          underline: underline),
    );
  }

  static Text bold(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    double? height,
    bool? softWrap,
  }) {
    return Text(
      text,
      softWrap: softWrap ?? false,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: boldTextStyle(
          fontSize: fontSize, height: height, color: color, strike: strike),
    );
  }

  static TextStyle boldTextStyle(
      {double? fontSize, double? height, Color? color, bool strike = false}) {
    return TextStyle(
      fontSize: fontSize ?? 18.0,
      fontWeight: FWt.bold,
      color: color ?? srThemes.white,
      height: height,
      decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
      fontFamily: 'Euclid-Circular-B',
    );
  }

  static Text medium(
    String text, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? align,
    double? height,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
    String fontFamily = 'Euclid-Circular-B',
    bool? softWrap,
  }) {
    return Text(text,
        textAlign: align ?? TextAlign.left,
        maxLines: lines,
        overflow: overflow,
        softWrap: softWrap,
        style: mediumTextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          underline: underline,
          color: color,
          strike: strike,
        ));
  }

  static TextStyle mediumTextStyle(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      double? height,
      bool underline = false,
      bool strike = false,
      String fontFamily = 'Euclid-Circular-B'}) {
    return TextStyle(
      fontSize: fontSize ?? 14.0.sp,
      fontWeight: fontWeight ?? FWt.mediumBold,
      color: color ?? srThemes.white,
      height: height,
      decoration: underline
          ? TextDecoration.underline
          : strike
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      fontFamily: fontFamily,
    );
  }

  static Text semiBold(
    String text, {
    double? fontSize,
    Color? color,
    TextOverflow? overflow,
    TextAlign? align,
    double? height,
    bool? strike = false,
    bool underline = false,
    int? lines,
    String fontFamily = 'Euclid-Circular-B',
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: semiBoldTextStyles(
          fontSize: fontSize,
          color: color,
          height: height,
          underline: underline,
          textOverflow: overflow,
          strike: strike!,
          fontFamily: fontFamily),
    );
  }

  static TextStyle semiBoldTextStyles(
      {double? fontSize,
      Color? color,
      double? height,
      bool underline = false,
      TextOverflow? textOverflow,
      bool strike = false,
      String? fontFamily}) {
    return TextStyle(
      fontSize: fontSize ?? 16.0,
      fontWeight: FWt.semiBold,
      color: color ?? srThemes.white,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      height: height,
      decoration: underline
          ? TextDecoration.underline
          : strike
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      fontFamily: fontFamily,
    );
  }


}
