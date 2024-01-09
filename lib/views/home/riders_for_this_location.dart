import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/shared/global_variables.dart';
import 'package:ride_share/shared/strings.dart';
import 'package:ride_share/shared/utils/assets.dart';
import 'package:ride_share/shared/utils/constants.dart';
import 'package:ride_share/shared/utils/styles.dart';
import 'package:ride_share/shared/widgets/custom_app_bar.dart';
import 'package:ride_share/shared/widgets/custom_divider.dart';
import 'package:ride_share/shared/widgets/spacers/vertical_spacer.dart';
import 'package:ride_share/views/home/home_shared_widgets/ride_tile.dart';

class RidersForThisLocation extends StatelessWidget {
  const RidersForThisLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: srThemes.white,
      child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const CustomAppBar(
              title: Strings.rideShare,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RideTile(
                          seatsLeft: Styles.regular('5 Seats Booked',
                              fontSize: 14.sp, color: srThemes.primaryColor)),
                      const Expanded(child: RidersBuilder()),
                      const ActionButton()
                    ]),
              ),
            )
          ])),
    );
  }
}

class RidersBuilder extends StatelessWidget {
  const RidersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const RidersTile(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.h),
                child: const CustomHorizontalDivider(),
              ),
            ],
          );
        });
  }
}

class RidersTile extends StatelessWidget {
  const RidersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TileTitle(
              profileImage: 'https://tinyurl.com/yexpucht',
              titleText: 'Sara Jacob',
              titleSubWidget: DriverRating()),
          VSpace(14.h),
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
              SvgPicture.asset(Assets.call)
            ],
          ),
        ],
      ),
    );
  }
}

class DriverRating extends StatelessWidget {
  const DriverRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [...Constants.driverRating],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 28.h),
      padding: const EdgeInsets.all(16),
      height: 63.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r), color: srThemes.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Styles.bold(Strings.startTrip, color: srThemes.white),
          SvgPicture.asset(Assets.arrowForward)
        ],
      ),
    );
  }
}
