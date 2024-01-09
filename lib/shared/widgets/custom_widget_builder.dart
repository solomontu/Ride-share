import 'package:flutter/material.dart';

import '../../models/dimensions_model.dart';

/// This widget is a wrapper on all screens in this app,
/// it is used by [builder] parameter of the [CustomMaterialApp] widget.
///
/// it takes in a [child] parameter, which is the particular screen to be displayed.
class CustomWidgetBuilder extends StatelessWidget {
  const CustomWidgetBuilder({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

    return MediaQuery(
      // this is to make sure the text scale factor is 1
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0,
        alwaysUse24HourFormat: true,
      ),
      child: Stack(
        children: <Widget>[
          SizedBox(
              key: key,
              height: media.size.height,
              child: Material(child: child!)),
        ],
      ),
    );
  }
}
