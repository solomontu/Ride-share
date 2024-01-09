import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/shared/global_variables.dart';
import 'package:ride_share/shared/utils/assets.dart';
import 'package:ride_share/shared/utils/styles.dart';
import 'package:ride_share/shared/widgets/custom_divider.dart';

class RideTile extends StatelessWidget {
  const RideTile({super.key, this.onTap, this.seatsLeft});

  final Function()? onTap;
  final Widget? seatsLeft;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            // height: seatsLeft == null ? 268 : 269,
            width: 335.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TileTitle(),
                const MapContainer(),
                const Destination(),
                seatsLeft != null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: seatsLeft,
                        ))
                    : const SizedBox(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.h),
            child: CustomHorizontalDivider(
              color: srThemes.dividerGray,
            ),
          )
        ],
      ),
    );
  }
}

class TileTitle extends StatelessWidget {
  const TileTitle(
      {super.key,
      this.titleSubWidget,
      this.titleText,
      this.isDrivers,
      this.profileImage});

  final Widget? titleSubWidget;
  final String? titleText;
  final bool? isDrivers;
  final String? profileImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      // height: 49.h,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ProfilePicture(imageUrl: profileImage ?? ''),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Styles.bold(titleText ?? '11/Sep/2023',
                      color: srThemes.primaryColor),
                ],
              ),
              titleSubWidget ??
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Subtitle(text: '4 seats'),
                      Subtitle(text: '46min 10sec'),
                      Subtitle(text: '40.4 mile')
                    ],
                  )
            ],
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.topRight,
          child:
              Styles.regular('8:12PM', fontSize: 12.sp, color: srThemes.gray2),
        ),
      ]),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      width: 40.w,
      decoration: BoxDecoration(
          border: Border.all(color: srThemes.black), shape: BoxShape.circle),
      child: CachedNetworkImageHolder(imageUrl: imageUrl),
    );
  }
}

class ProfileImagePlaceHolder extends StatelessWidget {
  const ProfileImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          bottom: 10.h,
          left: 0,
          right: 0,
          child: SvgPicture.asset(Assets.personBody)),
      Positioned(
          top: 8.h,
          left: 0,
          right: 0,
          child: SvgPicture.asset(Assets.personHead))
    ]);
  }
}

class CachedNetworkImageHolder extends StatelessWidget {
  const CachedNetworkImageHolder({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: imageUrl ?? '',
      placeholder: (context, url) => const ProfileImagePlaceHolder(),
      errorWidget: (context, url, error) => const ProfileImagePlaceHolder(),
    );
  }
}

///this is use the build the timestamp subtitle
class Subtitle extends StatelessWidget {
  const Subtitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0.w),
      child: Styles.regular(text, fontSize: 12.sp, color: srThemes.gray1),
    );
  }
}

class MapContainer extends StatelessWidget {
  const MapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0.h),
      child: Container(
        height: 120.h,
        width: 335.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            image: DecorationImage(
                image: Image.asset(
              Assets.googleMap,
              height: 120.h,
              width: double.infinity.w,
              fit: BoxFit.fitWidth,
            ).image)),
      ),
    );
  }
}

///This is used to build the name of the starting location of the lourny and
//the name of the final destination the journey
class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 13.0.w),
              child: SvgPicture.asset(Assets.journeyStartLocation),
            ),
            Styles.regular('Douglas Crescent Road',
                fontSize: 14.sp, color: srThemes.primaryColor)
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 5.w),
          child: CustomVerticalDivider(
            height: 19.h,
            color: srThemes.primaryColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 13.0.w),
              child: SvgPicture.asset(Assets.journeyEndLocation),
            ),
            Styles.regular('Logan Avenue',
                fontSize: 14.sp, color: srThemes.primaryColor),
            const Spacer(),
            const PriceBuilder()
          ],
        ),
      ],
    );
  }
}

class PriceBuilder extends StatelessWidget {
  const PriceBuilder({super.key, this.price});

  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29.h,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          color: srThemes.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.currencyNaira),
          Styles.regular(price ?? '200',
              fontSize: 16.sp, color: srThemes.white),
        ],
      ),
    );
  }
}
