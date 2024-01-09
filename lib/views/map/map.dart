// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:ride_share/shared/global_variables.dart';
//
// class Maps extends ConsumerStatefulWidget {
//   const Maps({super.key});
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _MapsState();
// }
//
// class _MapsState extends ConsumerState<Maps> {
//   UserLocationController userLocationController = UserLocationController();
//
//   CameraPosition? cameraPosition;
//   final Completer<GoogleMapController> _googleMapController =
//       Completer<GoogleMapController>();
//
//   @override
//   void initState() {
//     getUserInitPosition();
//     super.initState();
//   }
//
//   Future<void> getUserInitPosition() async {
//     String? response = await as.devicePermissions.handleLocationPermission();
//     if (response == null) {
//       ref.read(googleMapProvider.notifier).getCurrentPosition();
//     } else {
//       dialogShower(response);
//     }
//   }
//
//   Future<dynamic> dialogShower(String response) {
//     return showDialog(
//         barrierColor: fzThemes.black.withOpacity(0),
//         context: context,
//         builder: (context) {
//           return CustomSnackBar(message: response);
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Material(
//       color: srThemes.background,
//       child: SafeArea(
//           child: Scaffold(
//         backgroundColor: srThemes.background,
//         //Todo: check the platform and return the appropriate map(google and apple map)
//         body:
//         googleMap.cameraPosition ==
//                 const CameraPosition(target: LatLng(0, 0))
//             ?
//         Padding(
//                 padding: EdgeInsets.only(top: 40.0.h),
//                 child: const Align(
//                     alignment: Alignment.topCenter,
//                     child:Placeholder(),
//                     // CustomCircularProgressIndicator()
//                 ),
//               )
//             : Stack(
//                 children: [
//                   GoogleMap(
//                     myLocationEnabled: true,
//                     zoomControlsEnabled: false,
//                     mapType: MapType.normal,
//                     initialCameraPosition: googleMap.cameraPosition,
//                     markers: googleMap.markers,
//                     onMapCreated: (GoogleMapController controller)async {
//                       _googleMapController.complete(controller);
//
//                     },
//                   ),
//
//                 ],
//               ),
//         // bottomSheet:,
//       )),
//     );
//   }
// }
