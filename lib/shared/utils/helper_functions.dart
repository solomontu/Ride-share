import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import 'assets.dart';

class Utility {


  // static Future<BitmapDescriptor> createMarkerIcon({String? imageUrl}) async {
  //   if (imageUrl != null) {
  //     final byteData = await NetworkAssetBundle(
  //       Uri.parse(imageUrl),
  //     ).load("");
  //     final Uint8List byteList = byteData.buffer.asUint8List();
  //     return BitmapDescriptor.fromBytes(byteList, size: const Size(2, 2));
  //   } else {
  //     return BitmapDescriptor.fromBytes(await _getBytesFromAsset());
  //   }
  // }

  static Future<Uint8List> _getBytesFromAsset() async {
    ByteData data = await rootBundle.load(Assets.googleMapPinPerson);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: 50,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // This function covert Widget to an PNG image used for creating users google map pin icon mage
  static Future<Uint8List> capturePngImage(GlobalKey widgetKey) async {
    Uint8List? pngBytes;
    try {
      RenderRepaintBoundary? boundary =
          widgetKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      pngBytes = byteData!.buffer.asUint8List();

      // convertToFileImage(pngBytes);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return pngBytes!;
  }




  ///"Dec 6" date format
  static String dateFormat1(DateTime myDate) {
    String formattedDate = DateFormat('MMM dd').format(myDate);
    return formattedDate;
  }

  /// '10:25 AM time' format
  static String timeFormat1(DateTime myDateTime) {
    String formattedTime = DateFormat('h:mm a').format(myDateTime);
    return formattedTime;
  }
}
