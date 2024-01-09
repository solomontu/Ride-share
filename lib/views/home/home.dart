import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_share/providers/home_screen_providers.dart';
import 'package:ride_share/shared/global_variables.dart';
import 'package:ride_share/shared/strings.dart';
import 'package:ride_share/shared/widgets/custom_app_bar.dart';
import 'package:ride_share/shared/widgets/spacers/vertical_spacer.dart';
import 'package:ride_share/views/home/home_shared_widgets/custom_tab_view.dart';
import 'package:ride_share/views/home/home_tabs/completed.dart';
import 'package:ride_share/views/home/home_tabs/create_new.dart';
import 'package:ride_share/views/home/home_tabs/upcoming.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(storeSearchControllerProvider.notifier).onInit();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watchTabs = ref.watch(storeSearchControllerProvider);
    var watchSelectedTabs = ref.watch(selectedTabController);
    return Material(
      color: srThemes.white,
      child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const CustomAppBar(
              shouldPop: false,
              title: Strings.rideShare,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTabBar(
                          children: watchTabs
                              .map((item) => CustomTabs(
                                    tabModel: item,
                                    onTap: () {
                                      ref
                                          .read(storeSearchControllerProvider
                                              .notifier)
                                          .onTap(id: item.tabId);
                                      ref
                                          .read(selectedTabController.notifier)
                                          .onTap(item.tabId);
                                    },
                                  ))
                              .toList()),
                      VSpace(60.h),
                      if (watchSelectedTabs == '1')
                        const Expanded(child: Upcoming())
                      else if (watchSelectedTabs == '2')
                        const Completed()
                      else
                        CreateNew()
                    ]),
              ),
            )
          ])),
    );
  }
}
